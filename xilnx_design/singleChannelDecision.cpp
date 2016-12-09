#include "constants.h"
#include "circularBuffer.h"
#define NUM_CHANNELS 3

static int vthresh = 161;
static int athresh = 72;
static int vflip = -1;
static int aflip = 1;
static int AbeatDelay = 0;
static int VbeatDelay = 0;
static int VbeatFallDelay;
static int AstimDelay = 0;
static int VstimDelay = 0;
static int ACaptureThresh = A_LENGTH;
static int VCaptureThresh = V_LENGTH;
static CircularBuffer<int, V_LENGTH> recentVBools;
static CircularBuffer<int, A_LENGTH> recentABools;
static int last_sample_is_V = 0;
static int last_sample_is_A;
static CircularBuffer<int, PREVARP> recentdatapoints;

void singleDecision(short A_stim_reset, short V_stim_reset, short set_thresh, int v_thresh, int a_thresh, int a_flip, int v_flip, short * datapoint, short * out, short  * stim)
{
	if(A_stim_reset)
		AstimDelay = 0;

	if(V_stim_reset)
		VstimDelay = 0;
	
	if(set_thresh)
	{
		   vthresh = v_thresh;
		   athresh = a_thresh;
		   aflip = a_flip;
		   vflip = v_flip;
	}

	recentdatapoints.push(*datapoint);
		
	AbeatDelay++;
	VbeatDelay++;
	VbeatFallDelay++;
	AstimDelay++;
	VstimDelay++;

	//VENTRICAL
	int datapointV = recentdatapoints.head();
	int i;
	int sum = recentVBools.sum;
	recentVBools.push((vflip * datapointV) > vthresh);
	sum += recentVBools.head();
	
	if(sum > V_LENGTH/2)
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
	sum = recentABools.sum;
	
	recentABools.push((aflip * datapointA) > athresh);
	sum += recentABools.head();

	if(sum > A_LENGTH/2 && VbeatDelay > VbeatFallDelay)
	{
		if(!last_sample_is_A)
		{
			AbeatDelay = 0;
			last_sample_is_A = 1;
		}
	}
	
	else if(last_sample_is_A)
		last_sample_is_A = 0;

	if (VbeatDelay == 0 && last_sample_is_V)
	{
		*out = 'v';
	}
    else if (AbeatDelay == 0 && last_sample_is_A)
	{
		*out = 'a';
	}
	else 
		*out = 0;

	*stim = 0;
	if (AbeatDelay > AA_DELAY_THRESH && AstimDelay > ACaptureThresh)
	{
		if (AstimDelay == ACaptureThresh+1)
		{
			//TODO: Increse Atrial Stimulation voltage
		}
		
		*stim = 'a';
	}

	if (VbeatDelay > AbeatDelay && AbeatDelay > AV_DELAY_THRESH && VstimDelay > VCaptureThresh)
	{
		if (VstimDelay == VCaptureThresh+1)
		{
			//TODO: increase ventricular stim voltage
		}

		*stim = 'v';
	 }
}
