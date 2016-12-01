#pragma once
#include "constants.h"
#include "guessparameters.h"
#include "yamPeakFinder.c"
#include "data.h"
#define NUM_CHANNELS 4

#define VENT 1
#define ATRIAL 2
int multisiteDecision(void)
{
	detections detects[NUM_CHANNELS];
	int i,j;
	for(i = 0;i < NUM_CHANNELS; i++)
	{
		params lp = GuessParameters2(data);
		detects[i].v_thresh = lp.v_thresh;
		detects[i].a_thresh= lp.a_thresh;
		detects[i].aflip = lp.a_flip;
		detects[i].vflip = lp.v_flip;
		detects[i].AbeatDelay = 0;
		detects[i].VbeatDelay = 0;
		detects[i].VbeatFallDelay = 0;
		detects[i].AstimDelay = 0;
		detects[i].VstimDelay = 0;
		detects[i].ACaptureThresh = A_LENGTH;
		detects[i].VCaptureThresh = V_LENGTH;
		for(j = 0; j< V_LENGTH; j++)
			detects[i].recentVBools[j] = 0;
		for(j = 0; j< A_LENGTH; j++)
			detects[i].recentABools[j] = 0;
		detects[i].last_sample_is_V = 0;
		detects[i].last_sample_is_A = 0;
		for(j = 0; j< PREVARP; j++)
			detects[i].recentdatapoints[j] = 0;
	}

	/* MAIN LOOP */
	while(1)
	{
		for(i = 0; i< NUM_CHANNELS;i++)\
		{
			for(j = 0; j < PREVARP -1; j++)
			{
				detects[i].recentdatapoints[j] = detects[i].recentdatapoints[j+1];
			}
			// TODO: Add new data point to end of detects[i].recentdatapoints
		
			detects[i].AbeatDelay++;
		   	detects[i].VbeatDelay++;
			detects[i].VbeatFallDelay++;
			detects[i].AstimDelay++;
			detects[i].VstimDelay++;

			yamPeakFinder(&detects[i]);
		}
		for(i = 0; i < NUM_CHANNELS; i++)
		{
			if (detects[i].AbeatDelay > AA_DELAY_THRESH && detects[i].AstimDelay > detects[i].ACaptureThresh)
			{
				if (detects[i].VstimDelay == detects[i].VCaptureThresh+1)
				{
					//TODO: Increse Atrial Stimulation voltage
				}
				//TODO: Stimulate atria here
				for(j = 0; j< NUM_CHANNELS; j++)
				{
				    detects[j].AstimDelay = 0;
				}
				break;
			}
		}

		for(i = 0; i < NUM_CHANNELS; i++)
		{
			if (detects[i].VbeatDelay > detects[i].AbeatDelay && detects[i].AbeatDelay > AV_DELAY_THRESH && detects[i].VstimDelay > detects[i].VCaptureThresh)
			{
				if (detects[i].VstimDelay == detects[i].VCaptureThresh+1)
				{
					//TODO: increase ventricular stim voltage
				}
				//TODO: Stimulate Ventricle here
				for(j = 0; j < NUM_CHANNELS; j++)
				{
					detects[j].VstimDelay = 0;
				}
				break;
			 }
		}
	}
	return 0;
}

