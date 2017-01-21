% main script for running d algorithms on test data
close all
addpath('test_data/sept29_2016_test/')
addpath('test_data/PhisioBank_iaf/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point


s = load('NormalSinusRhythm_struct.mat');
%s = load('Pacingfromchipapprox120bpmxmA_struct.mat');
%s = load('PacingfromMedtronic120bpm2mA_struct.mat');
%s = load('iaf1_struct.mat'); %number ranges from 1-8 for different patients

Fs = s.Fs; %sampling rate
data = s.data;
begin_time = 0.0;
end_time = 25; %second
data = data(begin_time*Fs+1:end_time*Fs+1,:);
[numSamples, numChannels] = size(data);
%numChannels = 2;

VENT = 1;
ATRIAL = 2;

b = fir1(1000,2.5/Fs,'high'); %filter to remove DC bias
b2 = fir1(500,150/Fs);

%Learn parameters for all 4 channels individually
%In the actual microcontroller code, this will be done on different data,
%as opposed to the data we are testing on. 


%~~~~~~~~~~~~~~~~~~~~~
%Channel Parameters
%~~~~~~~~~~~~~~~~~~~~~
numChannels = 3;
detections = repmat(struct(), numChannels, 1);
aSumofVote = [];
vSumofVote = [];
for channel = 1:numChannels
    %data(:,channel) = abs(data(:,channel));
    data(:,channel) = filter(b,1,data(:,channel));
    data(:,channel) = filter(b2,1,data(:,channel));
    detections(channel).v_length = 11;
    detections(channel).a_length = 30; %Defining the Thresholds
    [detections(channel).v_thresh,detections(channel).a_thresh,detections(channel).vflip,detections(channel).aflip]=GuessParameters2(data(:,channel),detections(channel).v_length,detections(channel).a_length);
    detections(channel).AbeatDelay = 0;
    detections(channel).VbeatDelay = 0;
    detections(channel).VbeatFallDelay = 0;
    detections(channel).AstimDelay = 0;
    detections(channel).VstimDelay = 0;
    detections(channel).AVDelayThresh = 200;
    detections(channel).AADelayThresh = 1000;
    detections(channel).ACaptureThresh = detections(channel).a_length;
    detections(channel).VCaptureThresh = detections(channel).v_length;
    
    %these are used for doing real time d
    detections(channel).recentVBools = zeros(1,detections(channel).v_length); %all the recent samples needed to do real time filtering
    detections(channel).recentABools = zeros(1,detections(channel).a_length); %all the recent samples needed to do real time filtering
    detections(channel).last_sample_is_V = false;
    detections(channel).last_sample_is_A = false;
    detections(channel).PostVARP = 250;
    detections(channel).PreVARP = 20;
    detections(channel).recentdatapoints = zeros(1,detections(channel).PreVARP);
    
    %These variables are just used for testing and visualization, not actually
    %used in the algorithm. 
    detections(channel).vPeakInd = [];
    detections(channel).aPeakInd = [];
    detections(channel).aStimInd = [];
    detections(channel).vStimInd = [];
    
    detections(channel).aPacingNeeded = 0;
    detections(channel).vPacingNeeded = 0;
    

end

%This loop models real time data acquisition in the arduino.
for i = 1:numSamples
    
    %~~~~~~~~~~~~~~~~~~~~~~~~~
    %d for all channels
    %~~~~~~~~~~~~~~~~~~~~~~~~~
   
    %Increment time since last atrial beat d.
    for k = 1:numChannels
        detections(k).recentdatapoints = [detections(k).recentdatapoints(2:end) data(i,k)]; %get next datapoint and add to buffer
        
        detections(k).AbeatDelay = detections(k).AbeatDelay + 1;
        detections(k).VbeatDelay = detections(k).VbeatDelay + 1;
        detections(k).VbeatFallDelay = detections(k).VbeatFallDelay + 1;
        detections(k).AstimDelay = detections(k).AstimDelay + 1;
        detections(k).VstimDelay = detections(k).VstimDelay + 1;

        detections(k) = yamPeakFinder(i,detections(k));
    end
    
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
    aPacingVoteCount = 0;
    
    for k = 1:numChannels
        d = detections(k);
        if (d.AbeatDelay > d.AADelayThresh && d.AstimDelay > d.ACaptureThresh)
            detections(k).aPacingNeeded = 1;
        else
            detections(k).aPacingNeeded = 0;
        end
        aPacingVoteCount = aPacingVoteCount + detections(k).aPacingNeeded;
    end
    
    aSumofVote = [aSumofVote aPacingVoteCount];
    
    if aPacingVoteCount >= numChannels/2
        for k = 1:numChannels
            d = detections(k);
            if (d.AstimDelay == d.ACaptureThresh+1)
                %disp('Failed Atrial Capture - increase stim')
            end
            %disp('Deliver Atrial Stimulation due to AA Delay')
            detections(k).aStimInd = [d.aStimInd i];
            detections(k).AstimDelay = 0;
        end
    end

    vPacingVoteCount = 0;
    for k = 1:numChannels
        d = detections(k);
        if (d.VbeatDelay > d.AbeatDelay && d.AbeatDelay > d.AVDelayThresh && d.VstimDelay > d.VCaptureThresh)
            detections(k).vPacingNeeded = 1;
        else 
            detections(k).vPacingNeeded = 0;
        end
        vPacingVoteCount = vPacingVoteCount + detections(k).vPacingNeeded;
    end
    
    vSumofVote = [vSumofVote vPacingVoteCount];
    
    if vPacingVoteCount >= numChannels/2
        for k = 1:numChannels
            d = detections(k);
            if (d.VstimDelay == d.VCaptureThresh+1)
                %disp('Failed Ventricular Capture - increase stim')
            end
            %disp('Deliver Ventricular Stimulation due to AV Delay')
            detections(k).vStimInd = [detections(k).vStimInd i];
            detections(k).VstimDelay = 0;
        end
    end
end

for i = 1:numChannels
    d = detections(i);
    figure; hold on;
    plot(data(:,i),'b');
    plot(d.vPeakInd, d.v_thresh*d.vflip, 'or')
    plot(d.aPeakInd, d.a_thresh*d.aflip, 'ob')
    plot(d.aStimInd, d.a_thresh*d.aflip*1.2, 'xb')
    plot(d.vStimInd, d.v_thresh*d.vflip*1.2, 'xr')
    plot(vSumofVote.*d.v_thresh*d.vflip*1.0, 'r')
    plot(aSumofVote.*d.a_thresh*d.aflip*1.0, 'b')
    title(['Channel ' num2str(i)])
end
