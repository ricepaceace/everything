function d = yamPeakFinder(i,d)
%This function is called every sample to determine whether the current
%sample is an atrial beat or ventricular beat.  To do this, the function
%considers the detection structure, d, and determines whether an atrial or
%ventricular beat has occured, based on the parameters of d.

%Inputs:
%i - The current sample of the signal.
%d - The detection structure that contains the parameters necessary for
%detection. 

%Outputs:
%d.recentVBools = a binary vector indicating whether the recent data points
%have been above the ventricular threhsold.
%d.VbeatDelay = delay since the last ventricular beat is seen.
%d.vPeakInd = time (in samples) of the ventricular peaks.  
%d.last_sample_is_V = Flag indicating whether the last sample was a
%ventricular beat. 
%d.recentABools = a binary vector indicating whether the recent data points
%have been above the atrial threhsold.
%d.AbeatDelay = delay since the last atrial beat is seen.
%d.aPeakInd = time (in samples) of the atrial peaks.  
%d.last_sample_is_A = Flag indicating whether the last sample was a
%atrial beat. 

% if we should detect ventricles first
if d.v_first
    %At beginning of function call, assume that no peak has been found.
    datapointV = d.recentdatapoints(end);
    d.recentVBools = [d.recentVBools(2:end) (d.v_flip*datapointV>d.v_thresh)];
    
    %Only start looking for ventricular beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat.
    
    %We detect a ventricular beat if the following conditions are met:
    %1. If atleast 2/3*v_length of the recent samples have exceeded the
    %ventricular threshold.
    %2. The delay since the last atrial beat detected is greater than the
    %delay since the last atrial falling beat.
    %3. It has been at least PreVARP + PostVARP since the last atrial beat.
    if(sum(d.recentVBools)>d.v_length*2/3 && d.AbeatDelay >= d.AbeatFallDelay && d.AbeatFallDelay > d.PreAVRP+d.PostAVRP) 
        if (~d.last_sample_is_V)
            d.VbeatDelay = 0;
            d.VbeatWeighted = false;
            d.vPeakInd = [d.vPeakInd, i];
            d.last_sample_is_V = true;
        end
    else
        %If the last sample is V, set the falling edge delay to the sample after. 
        if(d.last_sample_is_V)
            d.VbeatFallDelay = 0;
            d.last_sample_is_V = false;
        end
    end
    
    %Only start looking for atrial beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat. 
    datapointA = d.recentdatapoints(1);
    d.recentABools = [d.recentABools(2:end) (d.a_flip*datapointA>d.a_thresh)];
    
   %We detect a atrial beat if the following conditions are met:
    %1. If atleast 2/3*a_length of the recent samples have exceeded the
    %ventricular threshold.
    %2. The delay since the last ventricular beat detected is greater than the
    %delay since the last ventricular falling beat.
    %3. It has been at least PreVARP + PostVARP since the last ventricular beat.
    if(sum(d.recentABools)>d.a_length*2/3 && d.VbeatDelay >= d.VbeatFallDelay && d.VbeatFallDelay > d.PreVARP+d.PostVARP) 
        if (~d.last_sample_is_A)
            d.AbeatDelay = 0;
            d.AbeatWeighted = false;
            d.aPeakInd = [d.aPeakInd, i];
            d.last_sample_is_A = true;
        end
    else
        if (d.last_sample_is_A)
            d.AbeatFallDelay = 0;
            d.last_sample_is_A = false;
        end
    end

% if we should detect the atria first
else
    
    %At beginning of function call, assume that no peak has been found.
    datapointA = d.recentdatapoints(end);
    d.recentABools = [d.recentABools(2:end) (d.a_flip*datapointA>d.a_thresh)];
    
    %Only start looking for ventricular beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat.
    
    %Condition to detect atria beat ar same as described above.
    if(sum(d.recentABools)>d.a_length*2/3 && d.VbeatDelay >= d.VbeatFallDelay && d.VbeatFallDelay > d.PreVARP+d.PostVARP) 
        if (~d.last_sample_is_A)
            d.AbeatDelay = 0;
            d.AbeatWeighted = false;
            d.aPeakInd = [d.aPeakInd, i];
            d.last_sample_is_A = true;
        end
    else
        if(d.last_sample_is_A)
            d.AbeatFallDelay = 0;
            d.last_sample_is_A = false;
        end
    end
    
    %Only start looking for atrial beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat. 
    datapointV = d.recentdatapoints(1);
    d.recentVBools = [d.recentVBools(2:end) (d.v_flip*datapointV>d.v_thresh)];
    
    %Condition to detect ventricular beat ar same as described above.
    if(sum(d.recentVBools)>d.v_length*2/3 && d.AbeatDelay >= d.AbeatFallDelay && d.AbeatFallDelay > d.PreAVRP+d.PostAVRP) 
        if (~d.last_sample_is_V)
            d.VbeatDelay = 0;
            d.VbeatWeighted = false;
            d.vPeakInd = [d.vPeakInd, i];
            d.last_sample_is_V = true;
        end
    else
        if (d.last_sample_is_V)
            d.VbeatFallDelay = 0;
            d.last_sample_is_V = false;
        end
    end
    
end
