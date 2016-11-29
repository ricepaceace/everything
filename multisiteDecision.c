#include "constants.h"
#include "detections.h"
#include "guessparmaeters.h"

#define NUM_CHANNELS 4

#define VENT 1
#define ATRIAL 2

detections detects[NUM_CHANNELS];
int i,j;
for (i = 0;i < NUM_CHANNELS; i++)
{
	params lp = GuessParameters2();
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
    detects[i].last_sample_is_V = false;
    detects[i].last_sample_is_A = false;
    for(j = 0; j< PREVARP; j++)
		detects[i].recentdatapoints[j] = 0;
}

/* MAIN LOOP */
for(i = 0; i< NUM_CHANNELS;i++)\
{
	for(k = 0; k < PREVARP -1; k++)
	{
    	detects[i].recentdatapoints[k] = detects[i].recentdatapoints[k+1];
    }
    // TODO: Add new data point to end of detects[i].recentdatapoints
    
    detects[i].AbeatDelay++;
   	detects[i].VbeatDelay++;
    detects[i].VbeatFallDelay++;
    detects[i].AstimDelay++;
    detects[i].VstimDelay++;

    yamPeakFinder(&detects[i]);
}
    
    %~~~~~~~~~~~~~~~~~
    %Stimulation Code
    %~~~~~~~~~~~~~~~~~
    %Want to organize code such that one channels need to stimulate will
    %dominate decision to stimulate. 
    
    %If an atrial beat has not been detected fast enough, capture the heart
    %and deliver a stimulation. 
    %FIXME?: The code currently does not assume that a atrial beat will
    %be detected soon after stimulation, so the tracking parameters are
    %manually adjusted. 
    
    for k = 1:numChannels
        d = detections(k);
        if (d.AbeatDelay > d.AADelayThresh && d.AstimDelay > d.ACaptureThresh)
            if (d.AstimDelay == d.ACaptureThresh+1)
                %disp('Failed Atrial Capture - increase stim')
            end
            %disp('Deliver Atrial Stimulation due to AA Delay')
            for j = 1:numChannels
                detections(j).aStimInd = [detections(j).aStimInd i];
                detections(j).AstimDelay = 0;
            end
            break
        end
    end


    for k = 1:numChannels
        d = detections(k);
        if (d.VbeatDelay > d.AbeatDelay && d.AbeatDelay > d.AVDelayThresh && d.VstimDelay > d.VCaptureThresh)
            if (d.VstimDelay == d.VCaptureThresh+1)
                %disp('Failed Ventricular Capture - increase stim')
            end
            %disp('Deliver Ventricular Stimulation due to AV Delay')
            for j = 1:numChannels
                detections(j).vStimInd = [detections(j).vStimInd i];
                detections(j).VstimDelay = 0;
            end
            break
        end
    end
    
end

