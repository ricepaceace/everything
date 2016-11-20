function[peakFound,vCount, aCount] = yamPeakFinder(data,i,detection)
    
    %At beginning of function call, assume that no peak has been found.
    peakFound = 0;
    
    %Only start looking for ventricular beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat.
    if(data > detection.v_thresh && i-detection.lastPeak>30) 
        detection.vCount = detection.vCount + 1;
        if(detection.vCount == detection.v_length)
            detection.vCount = 0;
            peakFound = 1;
        end
    else
        detection.vCount = 0;
    end
    
    %Only start looking for atrial beats when the current data point
    %is greater than the threshold and it has been 30 samples since the
    %last ventricle or atrial beat.    
    if(data < detection.v_thresh && data > detection.a_thresh && i-detection.lastPeak>30)
        peakFound = 0;
        detection.aCount = detection.aCount + 1;
        if(detection.aCount == detection.a_length)
            detection.aCount = 0;
            peakFound = 2;
        end
        
    else
        detection.aCount = 0;
    end
    
    vCount = detection.vCount;
    aCount = detection.aCount;
    