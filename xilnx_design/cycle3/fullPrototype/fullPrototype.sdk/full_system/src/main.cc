//Libraries for Hardware:
#include "platform.h"
#include "xparameters.h"
#include "xdecision.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xtmrctr.h"
#include "axi_max11100.h"

//Libraries for Software
#include "constants.h"
#include "LearnLengths.h"
#include "guessparameters.h"


//General Testing Tools
#include "xil_printf.h"
#include "xtime_l.h"


#define GPIO_CHANNEL 1
// Parameter Definitions for hardware initialization
#define INTC_DEVICE_ID 			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define BTNS_DEVICE_ID			XPAR_AXI_BTNS_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID  XPAR_FABRIC_AXI_BTNS_IP2INTC_IRPT_INTR
#define BTN_INT 				XGPIO_IR_CH1_MASK // This is the interrupt mask for channel one
#define TMR_DEVICE_ID			XPAR_TMRCTR_0_DEVICE_ID
#define INTC_TMR_INTERRUPT_ID 	XPAR_FABRIC_AXI_TIMER_0_INTERRUPT_INTR
#define TMR_LOAD				0xFFFE7961 // Yields 1ms interrupt

//----------------------------------------------------
// PROTOTYPE FUNCTIONS
//----------------------------------------------------
static void BTN_Intr_Handler(void *baseaddr_p);
static int InterruptSystemSetup(XScuGic *XScuGicInstancePtr);
static int IntcInitFunction(u16 DeviceId, XTmrCtr *TmrInstancePtr, XGpio *GpioInstancePtr);
static void TMR_Intr_Handler(void *baseaddr_p, u8 num);
static int Timer_btn_setup(void);
static int channel_init(XDecision * sdc0, XDecision * sdc1, XDecision * sdc2, XDecision * sdc3);

static void run_params(void);


XGpio   BTNInst;
XGpio stim;
XScuGic INTCInst;
XDecision Xsdc0, Xsdc1, Xsdc2, Xsdc3;
static int btn_value;
XTmrCtr TMRInst;
unsigned int seconds = 0;
unsigned long long ms = 0;
static unsigned short results[4][PARAM_LEARN_SIZE];
static short cen[4][PARAM_LEARN_SIZE];
int alen[4], vlen[4], athresh[4], vthresh[4], aflip[4], vflip[4];
volatile bool newms = false;
unsigned long offset = 0;


static void chan_param(char i)
{
	XDecision * sdc0;
	if(i == 3)
		sdc0 = &Xsdc3;
	else if(i == 2)
			sdc0 = &Xsdc2;
	else if(i == 1)
			sdc0 = &Xsdc1;
	else if(i ==0)
			sdc0 = &Xsdc0;
	else
		return;
	XDecision_Set_reset_A_V(sdc0, 0);
	XDecision_Set_reset_V_V(sdc0, 0);
	XDecision_Set_reset_params_V(sdc0, 1);
	XDecision_Set_vthresh(sdc0, vthresh[i]);
	XDecision_Set_athresh(sdc0, athresh[i]);
	XDecision_Set_v_flip(sdc0, vflip[i]);
	XDecision_Set_a_flip(sdc0, aflip[i]);
	XDecision_Set_a_length(sdc0, alen[i]);
	XDecision_Set_v_length(sdc0, vlen[i]);
	XDecision_Set_data(sdc0, 0);

	if (XDecision_IsReady(sdc0))
	{
		XDecision_Start(sdc0);
		do
		{

		}while(!XDecision_IsReady(sdc0));
	}
}

static unsigned short read_chan(XDecision *sdc0, short dat)
{
	short result;
	XDecision_Set_reset_A_V(sdc0, 0);
	XDecision_Set_reset_V_V(sdc0, 0);
	XDecision_Set_reset_params_V(sdc0, 0);
	XDecision_Set_vthresh(sdc0, 0);
	XDecision_Set_athresh(sdc0, 0);
	XDecision_Set_v_flip(sdc0, 0);
	XDecision_Set_a_flip(sdc0, 0);
	XDecision_Set_a_length(sdc0, 0);
	XDecision_Set_v_length(sdc0, 0);
	XDecision_Set_data(sdc0, dat);
	if (XDecision_IsReady(sdc0))
	{
		XDecision_Start(sdc0);
		do
		{
			result = XDecision_Get_return(sdc0);
		}while(!XDecision_IsReady(sdc0));
	}
	return (unsigned short)result;
}

int main()
{
	init_platform();
	xil_printf("-- Start of the Program --\r\n");

	xil_printf("--  Setting up hardware --\r\n");

	if(Timer_btn_setup()) return XST_FAILURE;

	xil_printf("-- Interrupts initialized and running: ms = %d\r\n", (int)ms);

	xil_printf("-- Setting up decision hardware --\r\n");

	if(channel_init(&Xsdc0, &Xsdc1, &Xsdc2, &Xsdc3 )) return XST_FAILURE;

	xil_printf("-- Channels initialized and running: ms = %d\r\n", (int)ms);

	if (XGpio_Initialize(&stim, XPAR_STIM_DEVICE_ID) != XST_SUCCESS) {
		xil_printf("failed to initialize debug board\r\n");
		return XST_FAILURE;
	}
	 /*
	  * Set the direction for all signals to be outputs
	  */
	 XGpio_SetDataDirection(&stim, GPIO_CHANNEL, 0x0);

	 /*
	  * Set the GPIO outputs to low
	  */
	 XGpio_DiscreteWrite(&stim, GPIO_CHANNEL, 0x0);

	xil_printf("-- Init Complete --\r\n");

	xil_printf("-- Press btn 1 to  start gathering data for parameter learning\r\n");
	while(btn_value != 1);

	newms = false;
	int i = 0;
	while(i < PARAM_LEARN_SIZE)
	{
		if(newms)
		{
			results[0][i] = get_sample(0);
			results[1][i] = get_sample(1);
			results[2][i] = get_sample(2);
			results[3][i] = get_sample(3);

			offset = offset + results[0][i];

			i++;
			newms = false;
		}
	}
	offset = offset/PARAM_LEARN_SIZE;

	xil_printf("%d\r\n", (int) offset);

	for(i = 0; i < PARAM_LEARN_SIZE;i++)
	{
		cen[0][i] = (short)((int)results[0][i] - offset);
		cen[1][i] = (short)((int)results[1][i] - offset);
		cen[2][i] = (short)((int)results[2][i] - offset);
		cen[3][i] = (short)((int)results[3][i] - offset);
	}
	xil_printf("-- Data Gathering Complete! --\r\n");
	xil_printf("-- Press btn 1 to  run parameter learning\r\n");
	while(btn_value != 1);

	run_params();

	chan_param(0);
	chan_param(1);

	xil_printf("-- Parameter learning complete! --\r\n");


	unsigned short r[4];
	unsigned long long on_a = 0;
	unsigned long long on_v = 0;
	newms = false;
	for(;;)
	{
		if(newms)
		{
			newms = false;
			r[0] = read_chan(&Xsdc0, (short)((int)get_sample(0) - offset));

			if(!(r[0] & 0xf0f0))
			{
			}
			else if (r[0] == 240)
			{
				on_v = ms +30;
				XGpio_DiscreteWrite(&stim, GPIO_CHANNEL, 0x10);
				xil_printf("-- VENTRICLE\r\n");


			}
			else
			{
				on_a = ms+30;
				XGpio_DiscreteWrite(&stim, GPIO_CHANNEL, 0x40);
				xil_printf("-- ATRIA\r\n");

			}
			if(ms == on_a || ms == on_v)
			{
				 XGpio_DiscreteClear(&stim, GPIO_CHANNEL, 0xFF);
			}

			if(r[0]!= 0) xil_printf("%d\r\n",r[0]);
		}
	}

	xil_printf("-- End of the Program --\r\n");

	return 0;
}

static void run_params()
{
	unsigned int tt, i;
	XTime start_time_co;
	XTime stop_time_co;

	for(i =0; i<2;i++)
	{
		XTime_GetTime(&start_time_co);

		learnLengths(cen[i], vlen+i, alen+i);

		XTime_GetTime(&stop_time_co);

		tt = stop_time_co - start_time_co;
		xil_printf("Cycles to learn lengths: = %d \r\n", tt);


		XTime_GetTime(&start_time_co);

		GuessParameters(cen[i],alen[i], vlen[i], vthresh+i, athresh+i, vflip+i, aflip+i);

		XTime_GetTime(&stop_time_co);

		tt = stop_time_co - start_time_co;
		xil_printf("Cycles to learn params: = %d \r\n", tt);

		xil_printf("alen %d: = %d \r\n", i,alen[i]);
		xil_printf("vlen %d: = %d \r\n", i,vlen[i]);
		xil_printf("athresh %d: = %d \r\n", i,athresh[i]);
		xil_printf("vthresh %d: = %d \r\n", i,vthresh[i]);
		xil_printf("aflip %d: = %d \r\n", i,aflip[i]);
		xil_printf("vflip %d: = %d \r\n", i,vflip[i]);
	}
}


//----------------------------------------------------
// INITIAL SETUP FUNCTIONS
//----------------------------------------------------
// modified to initialize the timer as well as the GIC and the GPIO.

int IntcInitFunction(u16 DeviceId, XTmrCtr *TmrInstancePtr, XGpio *GpioInstancePtr)
{

	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Call to interrupt setup
	status = InterruptSystemSetup(&INTCInst);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Connect GPIO interrupt to handler
	status = XScuGic_Connect(&INTCInst,
					  	  	 INTC_GPIO_INTERRUPT_ID,
					  	  	 (Xil_ExceptionHandler)BTN_Intr_Handler,
					  	  	 (void *)GpioInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;

	//Lab5 addition start
	// Connect timer interrupt to handler
	status = XScuGic_Connect(&INTCInst,
							 INTC_TMR_INTERRUPT_ID,
							 (Xil_ExceptionHandler)TMR_Intr_Handler,
							 (void *)TmrInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;
	//Lab5 addition end

	// Enable GPIO interrupts interrupt
	XGpio_InterruptEnable(GpioInstancePtr, 1);
	XGpio_InterruptGlobalEnable(GpioInstancePtr);

	// Enable GPIO interrupts in the controller
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);

	//Lab5 addition start
	// Enable  timer interrupts in the controller
	XScuGic_Enable(&INTCInst, INTC_TMR_INTERRUPT_ID);
	//Lab5 addition end

	return XST_SUCCESS;
}

int InterruptSystemSetup(XScuGic *XScuGicInstancePtr)
{
	// Register GIC interrupt handler

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 	 	 	 	 	 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
			 	 	 	 	 	 XScuGicInstancePtr);
	Xil_ExceptionEnable();


	return XST_SUCCESS;

}

int channel_init(XDecision *sdc0Ptr, XDecision *sdc1Ptr,XDecision *sdc2Ptr, XDecision *sdc3Ptr)
{
	XDecision_Config *cfgPtr0;
	XDecision_Config *cfgPtr1;
	XDecision_Config *cfgPtr2;
	XDecision_Config *cfgPtr3;

	int status;

	cfgPtr0 = XDecision_LookupConfig(XPAR_XDECISION_0_DEVICE_ID);
	if (!cfgPtr0)
	{
		print("ERROR: Lookup of sdc0.\n\r");
		return XST_FAILURE;
	}
	cfgPtr1 = XDecision_LookupConfig(XPAR_XDECISION_1_DEVICE_ID);
	if (!cfgPtr1)
	{
		print("ERROR: Lookup of sdc1.\n\r");
		return XST_FAILURE;
	}
	cfgPtr2 = XDecision_LookupConfig(XPAR_XDECISION_2_DEVICE_ID);
	if (!cfgPtr2)
	{
		print("ERROR: Lookup of sdc2.\n\r");
		return XST_FAILURE;
	}
	cfgPtr3 = XDecision_LookupConfig(XPAR_XDECISION_3_DEVICE_ID);
	if (!cfgPtr3)
	{
		print("ERROR: Lookup of sdc3.\n\r");
		return XST_FAILURE;
	}

	status = XDecision_CfgInitialize(sdc0Ptr, cfgPtr0);
	if (status != XST_SUCCESS)
	{
		print("ERROR: Could not initialize sdc0.\n\r");
		return XST_FAILURE;
	}
	status = XDecision_CfgInitialize(sdc1Ptr, cfgPtr1);
	if (status != XST_SUCCESS)
	{
		print("ERROR: Could not initialize sdc1.\n\r");
		return XST_FAILURE;
	}
	status = XDecision_CfgInitialize(sdc2Ptr, cfgPtr2);
	if (status != XST_SUCCESS)
	{
		print("ERROR: Could not initialize sdc2.\n\r");
		return XST_FAILURE;
	}
	status = XDecision_CfgInitialize(sdc3Ptr, cfgPtr3);
	if (status != XST_SUCCESS)
	{
		print("ERROR: Could not initialize sdc3.\n\r");
		return XST_FAILURE;
	}
	return status;
}

static int Timer_btn_setup()
{
	int status;
	//----------------------------------------------------
	// INITIALIZE THE PERIPHERALS & SET DIRECTIONS OF GPIO
	//----------------------------------------------------
	// Initialize Push Buttons
	status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Set all buttons direction to inputs
	XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

	//----------------------------------------------------
	// SETUP THE TIMER
	//----------------------------------------------------
	status = XTmrCtr_Initialize(&TMRInst, TMR_DEVICE_ID);
	if(status != XST_SUCCESS) return XST_FAILURE;
	XTmrCtr_SetHandler(&TMRInst, TMR_Intr_Handler, &TMRInst);
	XTmrCtr_SetOptions(&TMRInst, 0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
	XTmrCtr_SetResetValue(&TMRInst, 0, TMR_LOAD);
	XTmrCtr_Start(&TMRInst,0);

	// Initialize interrupt controller
	status = IntcInitFunction(INTC_DEVICE_ID, &TMRInst, &BTNInst);
	if(status != XST_SUCCESS) return XST_FAILURE;

	return 0;
}

//----------------------------------------------------
// INTERRUPT HANDLER FUNCTIONS
// - called by the buttons interrupt, performs push buttons read
// - OLED displaying
// - called by the timer to manage the real time
//----------------------------------------------------


void BTN_Intr_Handler(void *InstancePtr)
{

	// Ignore additional button presses
	if ((XGpio_InterruptGetStatus(&BTNInst) & BTN_INT) !=
			BTN_INT) {
			return;

	// Disable GPIO interrupts
	XGpio_InterruptDisable(&BTNInst, BTN_INT);
			 }
	btn_value = XGpio_DiscreteRead(&BTNInst, 1);

	// Acknowledge GPIO interrupts
    (void)XGpio_InterruptClear(&BTNInst, BTN_INT);
    // Enable GPIO interrupts
    XGpio_InterruptEnable(&BTNInst, BTN_INT);

}

void TMR_Intr_Handler(void * data, u8 num)
{
// Disable interrupt

	XTmrCtr_Stop(&TMRInst,0);

// Increment the global seconds variable
	ms++;
	if(ms %1000 == 0)
		seconds ++;
	newms= true;

// Enable and acknowledge  interrupt

	XTmrCtr_Reset(&TMRInst,0);
	XTmrCtr_Start(&TMRInst,0);


}



