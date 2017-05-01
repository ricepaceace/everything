function d = yamPeakFinder(i,d)
% if we should detect ventricles first
a = fieldnames(d);
if d.v_first
    %At beginning of function call, assume that no peak has been found.
    datapointV = d.recentdatapoints(end);
    d.recentVBools = [d.recentVBools(2:end) (d.v_flip*datapointV>d.v_thresh)];
    
    %Only start looking for ventricular beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat.
    if(sum(d.recentVBools)>d.v_length*2/3 && d.ApeakDelay >= d.ApeakFallDelay && d.ApeakFallDelay > d.PreAVRP+d.PostAVRP) 
        if (~d.last_sample_is_V)
            d.VpeakDelay = 0;
            d.VpeakWeighted = false;
            d.vPeakInd = [d.vPeakInd, i];
            d.last_sample_is_V = true;
        end
    else
        if(d.last_sample_is_V)
            d.VpeakFallDelay = 0;
            d.last_sample_is_V = false;
        end
    end
    
    %Only start looking for atrial beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat. 
    datapointA = d.recentdatapoints(1);
    d.recentABools = [d.recentABools(2:end) (d.a_flip*datapointA>d.a_thresh)];
    
    %&& d.VpeakDelay > d.VpeakFallDelay && d.VpeakFallDelay > 2*d.t_blank
    if(sum(d.recentABools)>d.a_length*2/3 && d.VpeakDelay >= d.VpeakFallDelay && d.VpeakFallDelay > d.PreVARP+d.PostVARP) 
        if (~d.last_sample_is_A)
            d.ApeakDelay = 0;
            d.ApeakWeighted = false;
            d.aPeakInd = [d.aPeakInd, i];
            d.last_sample_is_A = true;
        end
    else
        if (d.last_sample_is_A)
            d.ApeakFallDelay = 0;
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
    if(sum(d.recentABools)>d.a_length*2/3 && d.VpeakDelay >= d.VpeakFallDelay && d.VpeakFallDelay > d.PreVARP+d.PostVARP) 
        if (~d.last_sample_is_A)
            d.ApeakDelay = 0;
            d.ApeakWeighted = false;
            d.aPeakInd = [d.aPeakInd, i];
            d.last_sample_is_A = true;
        end
    else
        if(d.last_sample_is_A)
            d.ApeakFallDelay = 0;
            d.last_sample_is_A = false;
        end
    end
    
    %Only start looking for atrial beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat. 
    datapointV = d.recentdatapoints(1);
    d.recentVBools = [d.recentVBools(2:end) (d.v_flip*datapointV>d.v_thresh)];
    
    %&& d.VpeakDelay > d.VpeakFallDelay && d.VpeakFallDelay > 2*d.t_blank
    if(sum(d.recentVBools)>d.v_length*2/3 && d.ApeakDelay >= d.ApeakFallDelay && d.ApeakFallDelay > d.PreAVRP+d.PostAVRP) 
        if (~d.last_sample_is_V)
            d.VpeakDelay = 0;
            d.VpeakWeighted = false;
            d.vPeakInd = [d.vPeakInd, i];
            d.last_sample_is_V = true;
        end
    else
        if (d.last_sample_is_V)
            d.VpeakFallDelay = 0;
            d.last_sample_is_V = false;
        end
    end
    
end

b = fieldnames(d);
if numel(a)~=numel(b)
    f=2;
end
