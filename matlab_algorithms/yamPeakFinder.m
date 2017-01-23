function d = yamPeakFinder(i,d)
    
    %At beginning of function call, assume that no peak has been found.
    datapointV = d.recentdatapoints(end);
    d.recentVBools = [d.recentVBools(2:end) (d.vflip*datapointV>d.v_thresh)];
    
    %Only start looking for ventricular beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat.
    if(sum(d.recentVBools)>d.v_length/2) 
        if (~d.last_sample_is_V)
            d.VbeatDelay = 0;
            d.vPeakInd = [d.vPeakInd, i];
            d.last_sample_is_V = true;
        end
    else
        if(d.last_sample_is_V)
            d.VbeatFallDelay = 0;
            d.last_sample_is_V = false;
        end
    end
    
    %Only start looking for atrial beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat. 
    datapointA = d.recentdatapoints(1);
    d.recentABools = [d.recentABools(2:end) (d.aflip*datapointA>d.a_thresh)];
    
    %&& d.VbeatDelay > d.VbeatFallDelay && d.VbeatFallDelay > 2*d.t_blank
    if(sum(d.recentABools)>d.a_length/2 && d.VbeatDelay > d.VbeatFallDelay && d.VbeatFallDelay > d.PreVARP+d.PostVARP) 
        if (~d.last_sample_is_A)
            d.AbeatDelay = 0;
            d.aPeakInd = [d.aPeakInd, i];
            d.last_sample_is_A = true;
        end
    else
        if (d.last_sample_is_A)
            d.last_sample_is_A = false;
        end
    end