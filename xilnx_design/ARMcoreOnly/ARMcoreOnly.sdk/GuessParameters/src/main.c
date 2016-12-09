#include <stdio.h>
#include "platform.h"
#include <unistd.h>
#include "xtime_l.h"
#include <math.h>
#include "guessparameters.h"



int main()
{
	init_platform();
	unsigned long long tt[4];
	int tt_print[4];
	int *vthresh, *athresh, *aflip, *vflip;
	XTime start_time_co;
	XTime stop_time_co;

    xil_printf("-- Start of the Program --\r\n");

	//FIRST MATRIX
    XTime_GetTime(&start_time_co);

	GuessParameters(0, vthresh, vflip, athresh, aflip);

	XTime_GetTime(&stop_time_co);


	tt[0] = stop_time_co - start_time_co;

	tt_print[0] = (unsigned) tt[0];

	xil_printf("Cycles to process first matrix: = %d \r\n", tt_print[0]);

	//SECOND MATRIX
	XTime_GetTime(&start_time_co);

	GuessParameters(1, vthresh, vflip, athresh, aflip);

	XTime_GetTime(&stop_time_co);


	tt[1] = stop_time_co - start_time_co;

	tt_print[1] = (unsigned) tt[1];

	xil_printf("Cycles to process second matrix: = %d \r\n", tt_print[1]);

	//Last MATRIX
	XTime_GetTime(&start_time_co);

	GuessParameters(2, vthresh, vflip, athresh, aflip);


	XTime_GetTime(&stop_time_co);


	tt[2] = stop_time_co - start_time_co;

	tt_print[2] = (unsigned) tt[2];

	xil_printf("Cycles to process final matrix: = %d \r\n", tt_print[2]);


	//ALL MATRICES AT ONCE
	GuessParameters(0, vthresh, vflip, athresh, aflip);
	GuessParameters(1, vthresh, vflip, athresh, aflip);
	GuessParameters(2, vthresh, vflip, athresh, aflip);

	tt[3] = stop_time_co - start_time_co;

	tt_print[3] = (unsigned) tt[3];

	xil_printf("Cycles to process all three matrices in a row: = %d \r\n", tt_print[3]);
	xil_printf("-- End of the Program --\r\n");


    return 0;
}
