% main script for running detection algorithms on test data
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

detections = [];
for channel = 1:numChannels
    data(:,channel) = abs(data(:,channel));
    data(:,channel) = filter(b,1,data(:,channel));
    data(:,channel) = filter(b2,1,data(:,channel));
    detection.v_length = 21;
    detection.a_length = 41; %Defining the Thresholds
    [v,a]=GuessParameters2(data(:,channel),detection.v_length,detection.a_length);
    detection.a_thresh = a;
    detection.v_thresh = v;
    detection.AbeatDelay = 0;
    detection.VbeatDelay = 0;
    detection.VbeatFallDelay = 0;
    detection.AstimDelay = 0;
    detection.VstimDelay = 0;
    detection.AVDelayThresh = 200;
    detection.AADelayThresh = 1000;
    detection.ACaptureThresh = detection.a_length;
    detection.VCaptureThresh = detection.v_length;
    
    %these are used for doing real time detection
    detection.recentVBools = zeros(1,detection.v_length); %all the recent samples needed to do real time filtering
    detection.recentABools = zeros(1,detection.a_length); %all the recent samples needed to do real time filtering
    detection.last_sample_is_V = false;
    detection.last_sample_is_A = false;
    detection.PostVARP = 250;
    detection.PreVARP = 20;
    detection.recentdatapoints = zeros(1,detection.PreVARP);
    
    %These variables are just used for testing and visualization, not actually
    %used in the algorithm. 
    detection.vPeakInd = [];
    detection.aPeakInd = [];
    detection.aStimInd = [];
    detection.vStimInd = [];

    detections = [detections detection];
    

end

%This loop models real time data acquisition in the arduino.
for i = 1:numSamples
    
        %~~~~~~~~~~~~~~~~~~~~~~~~~
    %Detection for all channels
    %~~~~~~~~~~~~~~~~~~~~~~~~~
    %Increment time since last atrial beat detection.
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
    
    for k = 1:numChannels
        d = detections(k);
        if (d.AbeatDelay > d.AADelayThresh && d.AstimDelay > d.ACaptureThresh)
            if (d.AstimDelay == d.ACaptureThresh+1)
                disp('Failed Atrial Capture - increase stim')
            end
            disp('Deliver Atrial Stimulation due to AA Delay')
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
                disp('Failed Ventricular Capture - increase stim')
            end
            disp('Deliver Ventricular Stimulation due to AV Delay')
            for j = 1:numChannels
                detections(j).vStimInd = [detections(j).vStimInd i];
                detections(j).VstimDelay = 0;
            end
            break
        end
    end
    
end

for i = 1:numChannels
    figure; hold on;
    plot(data(:,i),'b');
    plot(detections(i).vPeakInd, detections(i).v_thresh, 'or')
    plot(detections(i).aPeakInd, detections(i).a_thresh, 'or')
%     plot(detections(i).aStimInd, detections(i).a_thresh, 'xb')
%     plot(detections(i).vStimInd, detections(i).v_thresh, 'xb')
    title(['Channel ' num2str(i)])
end
