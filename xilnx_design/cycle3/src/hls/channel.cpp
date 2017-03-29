#include "constants.h"
#include "circularBuffer.h"
#include "channel.h"


short Decision(dbool reset_A, dbool reset_V, dbool reset_params, int athresh, int vthresh, char a_flip, char v_flip, unsigned int a_length, unsigned int v_length, short data)
{
#pragma HLS INTERFACE s_axilite port=reset_V
#pragma HLS INTERFACE s_axilite port=reset_A
#pragma HLS INTERFACE s_axilite port=reset_params
#pragma HLS INTERFACE s_axilite port=athresh
#pragma HLS INTERFACE s_axilite port=vthresh
#pragma HLS INTERFACE s_axilite port=a_flip
#pragma HLS INTERFACE s_axilite port=v_flip
#pragma HLS INTERFACE s_axilite port=a_length
#pragma HLS INTERFACE s_axilite port=v_length
#pragma HLS INTERFACE s_axilite port=data
#pragma HLS INTERFACE s_axilite port=return

	//STATE VARIABLES
	static int v_thresh = 0;
	static int a_thresh = 0;
	static char vflip = 0;
	static char aflip = 0;
	static int ACaptureThresh = A_LENGTH_BASE;
	static int VCaptureThresh = V_LENGTH_BASE;
	static int AbeatDelay = 0;
	static int VbeatDelay = 0;
	static int VbeatFallDelay = 0;
	static int AstimDelay = 0;
	static int VstimDelay = 0;
	static CircularBuffer<int, V_LENGTH_MAX> recentVBools;
	static CircularBuffer<int, V_LENGTH_MAX> recentABools;
	static dbool last_sample_is_V = 0;
	static dbool last_sample_is_A = 0;
	static CircularBuffer<int, PREVARP> recentdatapoints;
	
	short toReturn = 0;
	//Optionally reset parameters
	if(reset_A)
	{
		AstimDelay = 0;
	}

	if(reset_V)
	{
		VstimDelay = 0;
	}

	if(reset_params)
	{
		v_thresh = vthresh;
		a_thresh = athresh;
		aflip = a_flip;
		vflip = v_flip;
		ACaptureThresh = a_length;
		VCaptureThresh = v_length;
	}

	//ACTUAL WORK
	recentdatapoints.push(data);
	AbeatDelay++;
	VbeatDelay++;
	VbeatFallDelay++;
	AstimDelay++;
	VstimDelay++;

/****************************************************************************YAM PEAK FINDING******************************************************************************/

	//VENTRICAL
	int datapointV = recentdatapoints.head();

	if(vflip == -1)
		datapointV = -datapointV;

	int i;
	recentVBools.push(datapointV > v_thresh);

	if(recentVBools.len > VCaptureThresh)
	{
		recentVBools.pop();
		recentVBools.pop();
	}


	int sum = recentVBools.sum;

	if(sum > (VCaptureThresh >> 1))
	{
		if(!last_sample_is_V)
		{
			VbeatDelay = 0;
			last_sample_is_V = 1;
		}
	}
	else if(last_sample_is_V)
	{
		VbeatFallDelay = 0;
		last_sample_is_V = 0;
	}

	// ATRIAL
	int datapointA = recentdatapoints.ftail();

	if(aflip == -1)
		datapointA = -datapointA;

	recentABools.push(datapointA > a_thresh);

	if(recentABools.len > ACaptureThresh)
	{
		recentABools.pop();
		recentABools.pop();
	}

	sum = recentABools.sum;

	if(sum > (ACaptureThresh >> 1) && (VbeatDelay > VbeatFallDelay)  && VbeatFallDelay > POSTVARP)
	{
		if(!last_sample_is_A)
		{
			AbeatDelay = 0;
			last_sample_is_A = 1;
		}
	}

	else if(last_sample_is_A)
	{
		last_sample_is_A = 0;
	}


/********************************************************DONE YAM PEAK FINDING********************************************************************************/


	if (VbeatDelay == 0 && last_sample_is_V)
	{
		toReturn |= IS_V;
	}
	else if (AbeatDelay == 0 && last_sample_is_A)
	{
		toReturn |= IS_A;
	}

	if (AbeatDelay > AA_DELAY_THRESH && AstimDelay > ACaptureThresh)
	{
		toReturn |= A_ST;
		AstimDelay = 0;
	}

	if (VbeatDelay > AbeatDelay && AbeatDelay > AV_DELAY_THRESH && VstimDelay > VCaptureThresh)
	{
		toReturn |= V_ST;
		VstimDelay = 0;
	}
	return toReturn;
}

