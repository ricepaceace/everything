#include "xil_printf.h"
#include "platform.h"
#include <unistd.h>
#include "xtime_l.h"
#include "guessparameters.h"
#include "LearnLengths.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xtmrctr.h"
#include "xsinglechanneldecision.h"

static short data[10000] = {
#include "good-ch2.h"
};
static int results0[10000];
static int results1[10000];


typedef XSinglechanneldecision Xsdc;

// Parameter Definitions
#define INTC_DEVICE_ID 			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define BTNS_DEVICE_ID			XPAR_AXI_GPIO_0_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID  XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define BTN_INT 				XGPIO_IR_CH1_MASK // This is the interrupt mask for channel one
#define TMR_DEVICE_ID			XPAR_TMRCTR_0_DEVICE_ID
#define INTC_TMR_INTERRUPT_ID 	XPAR_FABRIC_AXI_TIMER_0_INTERRUPT_INTR
#define TMR_LOAD				0xFFFF3CB1

XGpio   BTNInst;
XScuGic INTCInst;
Xsdc sdc0, sdc1;
static int btn_value;
static bool run_params = false;
static bool running = false;
XTmrCtr TMRInst;
unsigned int seconds = 0;
unsigned long long ms = 0;
int alen, vlen, athresh, vthresh, aflip, vflip;


//----------------------------------------------------
// PROTOTYPE FUNCTIONS
//----------------------------------------------------
static void BTN_Intr_Handler(void *baseaddr_p);
static int InterruptSystemSetup(XScuGic *XScuGicInstancePtr);
static int IntcInitFunction(u16 DeviceId, XTmrCtr *TmrInstancePtr, XGpio *GpioInstancePtr);
static void TMR_Intr_Handler(void *baseaddr_p, u8 num);
static void runparams(void);
static int Timer_btn_setup(void);
static int sdc_init(Xsdc * a0, Xsdc * a1);

int main()
{

	init_platform();
    xil_printf("-- Start of the Program --\r\n");

	if(Timer_btn_setup()) return XST_FAILURE;
	if(sdc_init(&sdc0, &sdc1)) return XST_FAILURE;

    xil_printf("-- Init Complete --\r\n");

    runparams();

    XSinglechanneldecision_Set_reset_A_V(&sdc0, 0);
    XSinglechanneldecision_Set_reset_V_V(&sdc0, 0);
    XSinglechanneldecision_Set_reset_params_V(&sdc0, 1);
    XSinglechanneldecision_Set_vthresh(&sdc0, vthresh);
    XSinglechanneldecision_Set_athresh(&sdc0, athresh);
    XSinglechanneldecision_Set_v_flip(&sdc0, vflip);
    XSinglechanneldecision_Set_a_flip(&sdc0, aflip);
    XSinglechanneldecision_Set_a_length(&sdc0, alen);
    XSinglechanneldecision_Set_v_length(&sdc0, vlen);
    XSinglechanneldecision_Set_data(&sdc0, 0);

    if (XSinglechanneldecision_IsReady(&sdc0))
	{
		XSinglechanneldecision_Start(&sdc0);
		do
		{

		}while(!XSinglechanneldecision_IsReady(&sdc0));
	}

    XSinglechanneldecision_Set_reset_A_V(&sdc1, 0);
	XSinglechanneldecision_Set_reset_V_V(&sdc1, 0);
	XSinglechanneldecision_Set_reset_params_V(&sdc1, 1);
	XSinglechanneldecision_Set_vthresh(&sdc1, vthresh);
	XSinglechanneldecision_Set_athresh(&sdc1, athresh);
	XSinglechanneldecision_Set_v_flip(&sdc1, vflip);
	XSinglechanneldecision_Set_a_flip(&sdc1, aflip);
	XSinglechanneldecision_Set_a_length(&sdc1, alen);
	XSinglechanneldecision_Set_v_length(&sdc1, vlen);
	XSinglechanneldecision_Set_data(&sdc1, 0);

	if (XSinglechanneldecision_IsReady(&sdc1))
	{
		XSinglechanneldecision_Start(&sdc1);
		do
		{

		}while(!XSinglechanneldecision_IsReady(&sdc1));
	}

    unsigned long long prev_ms = ms;
    unsigned short diff;
    int i = 0;
    while(i !=10000)
	{
    	if(btn_value == 1)
		{
			xil_printf("pressed button: %d\r\n", btn_value);
			xil_printf("%d seconds since startup\r\n", seconds);
			break;
		}
    	diff = ms - prev_ms;
    	if(diff == 1)
    	{
    		prev_ms = ms;
      		XSinglechanneldecision_Set_reset_A_V(&sdc0, 0);
			XSinglechanneldecision_Set_reset_V_V(&sdc0, 0);
			XSinglechanneldecision_Set_reset_params_V(&sdc0, 0);
			XSinglechanneldecision_Set_vthresh(&sdc0, 0);
			XSinglechanneldecision_Set_athresh(&sdc0, 0);
			XSinglechanneldecision_Set_v_flip(&sdc0, 0);
			XSinglechanneldecision_Set_a_flip(&sdc0, 0);
			XSinglechanneldecision_Set_a_length(&sdc0, 0);
			XSinglechanneldecision_Set_v_length(&sdc0, 0);
			XSinglechanneldecision_Set_data(&sdc0, data[i]);
			if (XSinglechanneldecision_IsReady(&sdc0))
			{
				XSinglechanneldecision_Start(&sdc0);
				do
				{
					results0[i] = XSinglechanneldecision_Get_return(&sdc0);
				}while(!XSinglechanneldecision_IsReady(&sdc0));
			}
			XSinglechanneldecision_Set_reset_A_V(&sdc1, 0);
			XSinglechanneldecision_Set_reset_V_V(&sdc1, 0);
			XSinglechanneldecision_Set_reset_params_V(&sdc1, 1);
			XSinglechanneldecision_Set_vthresh(&sdc1, vthresh);
			XSinglechanneldecision_Set_athresh(&sdc1, athresh);
			XSinglechanneldecision_Set_v_flip(&sdc1, vflip);
			XSinglechanneldecision_Set_a_flip(&sdc1, aflip);
			XSinglechanneldecision_Set_a_length(&sdc1, alen);
			XSinglechanneldecision_Set_v_length(&sdc1, vlen);
			XSinglechanneldecision_Set_data(&sdc1, 0);

			if (XSinglechanneldecision_IsReady(&sdc1))
			{
				XSinglechanneldecision_Start(&sdc1);
				do
				{
					results1[i] = XSinglechanneldecision_Get_return(&sdc0);
				}while(!XSinglechanneldecision_IsReady(&sdc1));
			}
			i++;
    	}
    	else if(diff > 1)
    	{
    		xil_printf("Missed Sample\r\n");
    		xil_printf("at ms = %d\r\n", (int)ms);
    		xil_printf("missed by : %d\r\n", (int)diff);
    		break;
    	}
	}

    int d = 0, e = 0;
    for(i = 0;i < 10000; i++)
    {
    	if(results0[i] != 0)
    		d++;
    }
    for(i = 0;i < 10000; i++)
	{
		if(results1[i] != 0)
			e++;
	}
    xil_printf("%d, %d\r\n",d, e);

	xil_printf("-- End of the Program --\r\n");

    return 0;
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

int sdc_init(Xsdc *sdc0Ptr, Xsdc *sdc1Ptr)
{
	XSinglechanneldecision_Config *cfgPtr0;
	XSinglechanneldecision_Config *cfgPtr1;

	int status;
	cfgPtr0 = XSinglechanneldecision_LookupConfig(XPAR_XSINGLECHANNELDECISION_0_DEVICE_ID);
	if (!cfgPtr0)
	{
		print("ERROR: Lookup of sdc0.\n\r");
		return XST_FAILURE;
	}
	status = XSinglechanneldecision_CfgInitialize(sdc0Ptr, cfgPtr0);
	if (status != XST_SUCCESS)
	{
		print("ERROR: Could not initialize sdc0.\n\r");
		return XST_FAILURE;
	}
	cfgPtr1 = XSinglechanneldecision_LookupConfig(XPAR_XSINGLECHANNELDECISION_1_DEVICE_ID);
	if (!cfgPtr1)
	{
		print("ERROR: Lookup of sdc1.\n\r");
		return XST_FAILURE;
	}
	status = XSinglechanneldecision_CfgInitialize(sdc1Ptr, cfgPtr1);
	if (status != XST_SUCCESS)
	{
		print("ERROR: Could not initialize sdc1.\n\r");
		return XST_FAILURE;
	}
	return status;
}

void runparams()
{
	running = true;
	unsigned int tt;
	XTime start_time_co;
	XTime stop_time_co;


	XTime_GetTime(&start_time_co);

	learnLengths(data, &vlen, &alen);

	XTime_GetTime(&stop_time_co);

	tt = stop_time_co - start_time_co;
	xil_printf("Cycles to learn lengths: = %d \r\n", tt);


	XTime_GetTime(&start_time_co);

	GuessParameters(data,alen, vlen, &vthresh, &athresh, &vflip, &aflip);


	XTime_GetTime(&stop_time_co);


	tt = stop_time_co - start_time_co;


	xil_printf("Cycles to learn params: = %d \r\n", tt);

	xil_printf("alen: = %d \r\n", alen);
	xil_printf("vlen: = %d \r\n", vlen);
	xil_printf("athresh: = %d \r\n", athresh);
	xil_printf("vthresh: = %d \r\n", vthresh);
	xil_printf("aflip: = %d \r\n", aflip);
	xil_printf("vflip: = %d \r\n", vflip);
	run_params = false;
	running = false;
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
	run_params  = true;

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

// Enable and acknowledge  interrupt

	XTmrCtr_Reset(&TMRInst,0);
	XTmrCtr_Start(&TMRInst,0);


}



