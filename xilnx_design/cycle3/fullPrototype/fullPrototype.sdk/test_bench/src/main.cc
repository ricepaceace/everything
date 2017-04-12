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
#include "stdio.h"

//Data
static short data[10000] = {
#include "good-ch2.h"
};

// Parameter Definitions for hardware initialization
#define INTC_DEVICE_ID 			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define BTNS_DEVICE_ID			XPAR_AXI_BTNS_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID  XPAR_FABRIC_AXI_BTNS_IP2INTC_IRPT_INTR
#define BTN_INT 				XGPIO_IR_CH1_MASK // This is the interrupt mask for channel one
#define TMR_DEVICE_ID			XPAR_TMRCTR_0_DEVICE_ID
#define INTC_TMR_INTERRUPT_ID 	XPAR_FABRIC_AXI_TIMER_0_INTERRUPT_INTR
#define TMR_LOAD				0xFFFE7961 // Yields 1ms interrupt
// Timer Load Equation == Interrupt period (in s) = ( 2^32-1 – TMR_LOAD in dec + 2) * (10^-8))

//----------------------------------------------------
// PROTOTYPE FUNCTIONS
//----------------------------------------------------
static void BTN_Intr_Handler(void *baseaddr_p);
static int InterruptSystemSetup(XScuGic *XScuGicInstancePtr);
static int IntcInitFunction(u16 DeviceId, XTmrCtr *TmrInstancePtr, XGpio *GpioInstancePtr);
static void TMR_Intr_Handler(void *baseaddr_p, u8 num);
static int Timer_btn_setup(void);
static int channel_init(XDecision * sdc0, XDecision * sdc1, XDecision * sdc2, XDecision * sdc3);

static int test_params(void);
static int channel_test(void);
static int interrupt_test(void);
static int adc_test(void);
static int debug_test(void);
static int flow_test(void);


XGpio   BTNInst;
XGpio stim;
XScuGic INTCInst;
XDecision Xsdc0, Xsdc1, Xsdc2, Xsdc3;
static int btn_value;
XTmrCtr TMRInst;
unsigned int seconds = 0;
unsigned long long ms = 0;
static unsigned short results[4][PARAM_LEARN_SIZE];
int alen, vlen, athresh, vthresh, aflip, vflip;
bool start = false;





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

    xil_printf("-- Init Complete --\r\n");

    xil_printf("-- Beginning Testing --\r\n");

    if (test_params()) return 11;

    xil_printf("-- Done Learning Parameters --\r\n");

    if(interrupt_test()) return 1;

    xil_printf("-- Done testing interrupts -- \r\n");

   if(channel_test()) return 1;

   xil_printf("-- Done testing channels -- \r\n");

   if(adc_test()) return 1;

   xil_printf("-- Done testing adcs -- \r\n");

   if(debug_test()) return 1;

   xil_printf("-- Done testing debug_board -- \r\n");

   if(flow_test()) return 1;

   xil_printf("-- End of the Program --\r\n");

   return 0;
}

static int test_params()
{
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

	if(alen != 18 || vlen != 5 || athresh !=72 || vthresh != 172 || aflip != 1 || vflip != -1)
	{
		xil_printf("Error in parameter learning results\r\n");
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

static int interrupt_test()
{
	unsigned int ms_start = ms;
	while(ms - ms_start  < 5000)
	{
		if(ms % 1000 == 0) xil_printf("Current runtime: %d seconds\r\n", seconds);
		if(btn_value != 0) xil_printf("Button %d pressed\r\n", btn_value);
	}
	return 0;
}

static void chan_param(XDecision * sdc0)
{
	XDecision_Set_reset_A_V(sdc0, 0);
	XDecision_Set_reset_V_V(sdc0, 0);
	XDecision_Set_reset_params_V(sdc0, 1);
	XDecision_Set_vthresh(sdc0, vthresh);
	XDecision_Set_athresh(sdc0, athresh);
	XDecision_Set_v_flip(sdc0, vflip);
	XDecision_Set_a_flip(sdc0, aflip);
	XDecision_Set_a_length(sdc0, alen);
	XDecision_Set_v_length(sdc0, vlen);
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

static int channel_test()
{
	unsigned long long start_ms = ms;
	chan_param(&Xsdc0);
	chan_param(&Xsdc1);
	chan_param(&Xsdc2);
	chan_param(&Xsdc3);
	xil_printf("total ms to program channel parameters: %d\r\n", (int)(ms-start_ms));

	unsigned short diff;
	int i = 0;
	start_ms = ms;
	while(i !=10000)
	{
		diff = ms - start_ms;
		if(diff == 1)
		{
			start_ms = ms;

			results[0][i] = read_chan(&Xsdc0, data[i]);
			results[1][i] = read_chan(&Xsdc1, data[i]);
			results[2][i] = read_chan(&Xsdc2, data[i]);
			results[3][i] = read_chan(&Xsdc3, data[i]);

			i++;
		}
		else if(diff > 1)
		{
			xil_printf("Missed Sample\r\n");
			xil_printf("missed by : %d\r\n", (int)diff);
			return 1;
		}
	}

	int a = 0, b = 0, c = 0, d = 0 ;
	for(i = 0;i < 10000; i++)
	{
		if((results[0][i] & 0xf0f0) != 0)
			a++;
		if(results[1][i] & 0xf0f0)
			b++;
		if(results[2][i] & 0xf0f0)
			c++;
		if(results[3][i] & 0xf0f0)
			d++;
	}

	if(a != 35 || b != 35 || c !=35 || d !=35)
	{
		xil_printf("Detection failed to detect all peaks \r\n");
		return 1;
	}
	return 0;
}

static int adc_test()
{
	unsigned long long start_ms = ms;

	u16 res0,res1,res2,res3;
	bool broke = false;
	while(ms - start_ms <3000)
	{
		res0 = get_sample(0);
		res1 = get_sample(1);
		res2 = get_sample(2);
		res3 = get_sample(3);
		if(res0 == 0)
		{
			xil_printf("adc # 0 not working\r\n");
			broke = true;
		}
		if(res1 == 0)
		{
			xil_printf("adc # 1 not working\r\n");
			broke = true;
		}
		if(res2 == 0)
		{
			xil_printf("adc # 2 not working\r\n");
			broke = true;
		}
		if(res3 == 0)
		{
			xil_printf("adc # 3 not working\r\n");
			broke = true;
		}
		if(broke)
			return 1;
		if(ms % 1000 == 0)
		{
			xil_printf("%i\r\n", res0);
			xil_printf("CODE: 0x%0.4X\r\n",res0);
			printf("VOLTAGE:%7.4fV\r\n",(float)4.096*res0/65536);
			xil_printf("%i\r\n", res1);
			xil_printf("CODE: 0x%0.4X\r\n",res1);
			printf("VOLTAGE:%7.4fV\r\n",(float)4.096*res1/65536);
			xil_printf("%i\r\n", res2);
			xil_printf("CODE: 0x%0.4X\r\n",res2);
			printf("VOLTAGE:%7.4fV\r\n",(float)4.096*res2/65536);
			xil_printf("%i\r\n", res3);
			xil_printf("CODE: 0x%0.4X\r\n",res3);
			printf("VOLTAGE:%7.4fV\r\n",(float)4.096*res3/65536);
		}
	}
	return 0;
}


#define GPIO_CHANNEL 1

static int debug_test()
{

	int Status;
	unsigned long long start_ms = ms;

	/*
	 * Initialize the GPIO driver
	 */
	Status = XGpio_Initialize(&stim, XPAR_STIM_DEVICE_ID);
	if (Status != XST_SUCCESS) {
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

	 XGpio_DiscreteWrite(&stim, GPIO_CHANNEL, 1<<6); // e.g. this writes a 1 to pin 1 (starting from 0)
	 while(ms-start_ms < 1000);
	 XGpio_DiscreteClear(&stim, GPIO_CHANNEL, 0xFF);
	 return 0;

}


static int flow_test()
{
	int a, b, c;
	start = false;
	while(!start);
	short res1 = -32768,res2 = -32768,res3 = -32768,res0 = -32768;
	unsigned short r[4];
	char i, vc = 0, ac = 0;
	unsigned long long startms = ms;
	while (startms == ms);
	startms = ms;
	res0 += get_sample(0);
	res1 += get_sample(1);
	res2 += get_sample(2);
	res3 += get_sample(3);
	a = ms-startms;
	r[0] = read_chan(&Xsdc0, res0/16);
	r[1] = read_chan(&Xsdc1, res1/16);
	r[2] = read_chan(&Xsdc2, res2/16);
	r[3] = read_chan(&Xsdc3, res3/16);
	b = ms - startms;
	for(i = 0; i<4; i++)
	{
		if((r[i] & V_ST) != 0)
			vc ++;
		if((r[i] & A_ST) != 0)
			ac++;
	}
	 XGpio_DiscreteWrite(&stim, GPIO_CHANNEL, ((1<<6) + (1<<3))); // e.g. this writes a 1 to pin 6  and pin 3(starting from 0)
	 c = ms - startms;
	 xil_printf("a,b,c =  %d, %d, %d\r\n", a,b,c);
	 while(startms < 500);
	 XGpio_DiscreteClear(&stim, GPIO_CHANNEL, 0xFF);
	 if(c || b ||a)
	 {
		 xil_printf("flow took to long to complete, and therefore failed\r\n");
		 return XST_FAILURE;
	 }
	 return XST_SUCCESS;

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
	start = true;

// Enable and acknowledge  interrupt

	XTmrCtr_Reset(&TMRInst,0);
	XTmrCtr_Start(&TMRInst,0);


}


