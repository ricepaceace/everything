data = sum(NormalSinusRhythm_struct.data,2); %Data to be analyzed
Fs = NormalSinusRhythm_struct.sampling_rate; %Sampling rate of data to be analyzed

%This block of code calculates parameters for the dataset that will have
%ideally been calculated beforehand when actually implementing this
%algorithm on the micocontroller or FPGA. 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[v,a,samplesHB]=GuessParameters2(data); %In actual code, we'll parameters from previous data.  

detection.v_thresh = (v+a)/2;
detection.v_length = 3;
detection.a_thresh = .8*a;
detection.a_length = 15; %Defining the Thresholds 

[aind, vind] = one_chamber_peak_finder(detection,data);

numAPeaks = length(aind);
numVPeaks = length(vind);

AADelay = 0;
for i = 1:numAPeaks-1
    delay = aind(i+1) - aind(i);
    AADelay = delay + AADelay;
end
avgAADelay = ceil(AADelay/(numAPeaks-1));
%Calculates the Atrium to Atrium Delay of this specific data set.  Assume
%this value has been calculated for the person algorithm is being used on.

AVDelay = 0;
for i = 1:min(numAPeaks,numVPeaks)
    delay = max(vind(i),aind(i)) - min(vind(i),aind(i));
    AVDelay = delay + AVDelay;
end
AVDelay = ceil(AVDelay/max(numAPeaks,numVPeaks));

VVDelay = 0;
for i = 1:numVPeaks-1
    delay = vind(i+1) - vind(i);
    VVDelay = delay + VVDelay;
end
avgVVDelay = ceil(VVDelay/(numAPeaks-1));
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%This code analyzes the data one input at a time
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%These thresholds will have to be altered in the actual implemenetation.
%Perhaps can make changes in guess parameters to get this working.  
detection.v_thresh = (v+a)/2;
detection.v_length = 8;
detection.a_thresh = .8*a;
detection.a_length = 26; %Defining the Thresholds 

vCount = 0;
aCount = 0;

delayVV = 0; %Keeps a running counter of time past since the last ventricular beat 
delayAA = 0; %Keeps a running counter of time past since the last atrial beat 

aPeakInd = [];
vPeakInd = [];
%Keeps track of where peaks are being detected, just to make sure
%algorithm is functioning properly.

aStimInd = [];
vStimInd = [];
%Keeps track of where the algorithm decides that a stimulation is
%necessary.

%This loop models reading data from a channel, one sample at a time, and
%making a decision about whether a pacing stimulation is needed, based on
%information coming from the channel.  
for i = 1:length(data) 
    delayVV = delayVV + 1;
    delayAA = delayAA + 1;
    
     %Deciding whether you need to deliver a ventricular stimulation.
     %In actual implementation, we could potentially say when the delay is
     %x samples more than the avg delay, then deliver a stimulation.  
    if(delayVV > avgVVDelay)
        vStimInd = [vStimInd i];
        delayVV = 0;%If stimulated in Ventricle, reset the time sense last ventricle beat. 
        disp('Deliver Stimulation to ventricle')
    end
    
    %Deciding whether you need to deliver an atrial stimulation.
    if(delayAA > avgAADelay)
        aStimInd = [aStimInd i];
        delayAA = 0; %If stimulated in Atrium, reset the time sense last atrial beat.  
        disp('Deliver Stimulation to atrium')
    end
    
    %Checking for a ventricular peak.  
    if(data(i) > detection.v_thresh)
        vCount = vCount + 1;
        if(vCount == detection.v_length)
            delayVV = 0;
            vCount = 0;
            vPeakInd = [vPeakInd i];
        end
    else
        vCount = 0;
    end
    
    %Checking for an atrial peak.  
    if(data(i) < detection.v_thresh && data(i) > detection.a_thresh)
        aCount = aCount + 1;
        if(aCount == detection.a_length)
            delayAA = 0;
            aCount = 0;
            aPeakInd = [aPeakInd i];
        end
    else
        aCount = 0;
    end
end
    
figure; hold on;
plot(data,'b');
plot(aPeakInd,  detection.a_thresh, 'xg');
plot(vPeakInd,  detection.v_thresh, 'or');
plot(vStimInd, 1e4,'p');
plot(aStimInd, .5e4,'o');
title('sum')

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%This code analyzes the data in 100 ms intervals
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%This code analyzes 
    
% intSize = 100; %Algorithm analyzes ECG signals of 100 samples (corresponds to .1 s)
% 
% detection.v_thresh = (v+a)/2;
% detection.v_length = 3;
% detection.a_thresh = a*.8;
% detection.a_length = 15; %Defining the Thresholds 
% 
% numInts = floor(length(data)/intSize);

%%Assume that AA delay and VV delay has been determined previously. 

% calcAADelay = 0;
% calcVVDelay = 0;
% aPeakTimePrev = 0;
% vPeakTimePrev = 0;
% tempAADelays = []
% for i = 1:numInts
%     
%     dataInt = data((i-1) * intSize + 1 : i * intSize);
%     [vPeakTime,aPeakTime] = one_chamber_peak_finder(detection, dataInt);  
%  
%     if(length(aPeakTime)==0) %No peak detecteded in this ECG epoch
%         
%         calcAADelay = calcAADelay + intSize;
%         
%         if(calcAADelay > AADelay - intSize/2) %If the calculated AA Delay is 100 samples more than the average AA Delay)
%             disp('Shock Delivered to Atrium')
%         end
%         
%     else
%         calcAADelay = intSize - aPeakTime;   
%     end
%     
%     
% end

