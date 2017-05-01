function multisiteDecision

% main script for running d algorithms on test data
close all
clear all
addpath('test_data/sept29_2016_test/')
addpath('test_data/PhisioBank_iaf/')
%addpath('test_data/FebruaryData/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point


s = load('NormalSinusRhythm_struct.mat');
%s = load('Pacingfromchipapprox120bpmxmA_struct.mat');
%s = load('PacingfromMedtronic120bpm2mA_struct.mat');
%s = load('iaf1_struct.mat'); %number ranges from 1-8 for different
%s = load('SinusRhythmHRAHBCSRVpluspaced_struct.mat');

Fs = s.Fs; %sampling rate
data = s.data;
begin_time = 0.0;
end_time = 25; %second
data = data(begin_time*Fs+1:end_time*Fs+1,:);
[numSamples, numChannels] = size(data);

b = fir1(1000,2.5/Fs,'high'); %filter to remove DC bias
b2 = fir1(500,150/Fs);

%Learn parameters for all 4 channels individually
%In the actual microcontroller code, this will be done on different data,
%as opposed to the data we are testing on. 


%~~~~~~~~~~~~~~~~~~~~~
%System Parameters
%~~~~~~~~~~~~~~~~~~~~~
numChannels = 3;
data = data(:,14:16);

aSumofVote = [];
vSumofVote = [];
aStimInd = [];
vStimInd = [];

VbeatDelay = 0;
AbeatDelay = 0;
VstimDelay = 0;
AstimDelay = 0;

DoPollingLag = 100;
aVoteThresh = 0.5; % the polling threshold needed to decide that there was an atrial beat
vVoteThresh = 0.5; % the polling threshold needed to decide that there was a ventricular beat
maxWeight = 2/numChannels; %the maximum weight a single channel can have in polling

AVDelayThresh = 350;
AADelayThresh = 1000;
ACaptureThresh = DoPollingLag + 70;
VCaptureThresh = DoPollingLag + 70;

%~~~~~~~~~~~~~~~~~~~~~
%Channel Parameters
%~~~~~~~~~~~~~~~~~~~~~
ds = repmat(struct(), numChannels, 1);

for k = 1:numChannels
    data(:,k) = filter(b,1,data(:,k));
    data(:,k) = filter(b2,1,data(:,k));
    [ds(k).v_thresh,ds(k).a_thresh,ds(k).v_flip,ds(k).a_flip,ds(k).v_length,ds(k).a_length,ds(k).v_first]=LearnParameters(data(:,k));
    ds(k).ApeakDelay = 0;
    ds(k).VpeakDelay = 0;
    ds(k).VpeakFallDelay = 0;
    ds(k).ApeakFallDelay = 0;
    ds(k).PostVARP = 250;
    ds(k).PreVARP = 20;
    ds(k).PostAVRP = 100;
    ds(k).PreAVRP = 20;
    
    %these are used for doing real time detection
    ds(k).recentVBools = zeros(1,ds(k).v_length); %all the recent samples needed to do real time filtering
    ds(k).recentABools = zeros(1,ds(k).a_length); %all the recent samples needed to do real time filtering
    ds(k).last_sample_is_V = false;
    ds(k).last_sample_is_A = false;
    if ds(k).v_first
        ds(k).recentdatapoints = zeros(1,ds(k).PreVARP);
    else
        ds(k).recentdatapoints = zeros(1,ds(k).PreAVRP);
    end
    ds(k).aWeight = 1/numChannels;
    ds(k).vWeight = 1/numChannels;
    ds(k).ApeakWeighted = false;
    ds(k).VpeakWeighted = false;
    
    %These variables are just used for testing and visualization, not actually
    %used in the algorithm. 
    ds(k).vPeakInd = [];
    ds(k).aPeakInd = [];
    ds(k).aWeightTrace = zeros(1,numSamples);
    ds(k).vWeightTrace = zeros(1,numSamples);
    
    ds(k).aPacingNeeded = 0;
    ds(k).vPacingNeeded = 0;
end

% optional edits to data (after filtering)
data(floor(numSamples/12):floor(numSamples/3),1:2) = 0; % zero out some data on some channels
% add some noise to some channels
%data(:,1) = data(:,1)+[normrnd(0,max(data(:,1))/2,[floor(numSamples/3),1]); zeros(numSamples-floor(numSamples/3),1)];%.*exp(-(1:numSamples)'/numSamples);

%This loop models real time data acquisition in the arduino.
for i = 1:numSamples
    
    %~~~~~~~~~~~~~~~~~~~~~~~~~
    %Peak detection for all channels
    %~~~~~~~~~~~~~~~~~~~~~~~~~
   
    for k = 1:numChannels
        ds(k).recentdatapoints = [ds(k).recentdatapoints(2:end) data(i,k)]; %get next datapoint and add to buffer
        
        ds(k).ApeakDelay = ds(k).ApeakDelay + 1;
        ds(k).VpeakDelay = ds(k).VpeakDelay + 1;
        ds(k).ApeakFallDelay = ds(k).ApeakFallDelay + 1;
        ds(k).VpeakFallDelay = ds(k).VpeakFallDelay + 1;

        ds(k) = yamPeakFinder(i,ds(k)); %peak detection
    end
    
    VbeatDelay = VbeatDelay + 1;
    AbeatDelay = AbeatDelay + 1;
    VstimDelay = VstimDelay + 1;
    AstimDelay = AstimDelay + 1;
    
    
    %~~~~~~~~~~~~~~~~~
    %Decision and Weight Adjusting Code
    %~~~~~~~~~~~~~~~~~
    
    %if any of the channels had an atial peak a fixed amount of time ago that we
    %havent already taken into account...
    for k = 1:numChannels
        if (ds(k).ApeakDelay == DoPollingLag || min(AbeatDelay, AstimDelay) >= AADelayThresh) && ~ds(k).ApeakWeighted
            
            %determine whether there was a beat or not
            weighted_sum = 0;
            for kk = 1:numChannels
                if ds(kk).ApeakDelay <= DoPollingLag
                    weighted_sum = weighted_sum + ds(kk).aWeight;
                end
            end
            decision = weighted_sum>0.5;
            
            if(weighted_sum > aVoteThresh);
                AbeatDelay = 0;
                for kk = 1:numChannels
                    if ds(kk).ApeakDelay <= DoPollingLag && floor(ds(kk).a_length*1+ds(kk).ApeakDelay)>AbeatDelay
                        AbeatDelay = floor(ds(kk).a_length*1+ds(kk).ApeakDelay);
                    end
                end
            end
            
            % make actual weight adjustments
            sumWeights = 0;
            for kk = 1:numChannels
                correct = (decision == (ds(kk).ApeakDelay <= DoPollingLag));
                ds(kk).aWeight = adjustWeightFn(ds(kk).aWeight,correct,numChannels);
                ds(kk).ApeakWeighted = true;
                sumWeights = sumWeights + ds(kk).aWeight;
            end
            
            %normalize weights
            for kk = 1:numChannels
                ds(kk).aWeight = ds(kk).aWeight/sumWeights;
            end
            
            %limit weights to maxWeight and re-normalize
            sumLowWeights = 0;
            numLowWeights = 0;
            for kk = 1:numChannels
                if ds(kk).aWeight < maxWeight
                    sumLowWeights = sumLowWeights + ds(kk).aWeight;
                    numLowWeights = numLowWeights + 1;
                end
            end
            for kk = 1:numChannels
                if ds(kk).aWeight < maxWeight
                    ds(kk).aWeight = (ds(kk).aWeight/sumLowWeights)*(numLowWeights/numChannels);
                else
                    ds(kk).aWeight = maxWeight;
                end
            end
            
            break 
        end
    end
    
    %if any of the channels had a ventricular peak a fixed amount of time ago that we
    %havent already taken into account...
    
    needVstim = min(AbeatDelay, AstimDelay) >= AVDelayThresh && VstimDelay > AADelayThresh && VbeatDelay > min(AbeatDelay,AstimDelay);
    
    for k = 1:numChannels
        if (ds(k).VpeakDelay == DoPollingLag || needVstim) && ~ds(k).VpeakWeighted
            
            %determine whether there was a beat or not
            weighted_sum = 0;
            for kk = 1:numChannels
                if ds(kk).VpeakDelay <= DoPollingLag
                    weighted_sum = weighted_sum + ds(kk).vWeight;
                end
            end
            decision = weighted_sum>0.5;
            
            if(weighted_sum > vVoteThresh);
                VbeatDelay = 0;
                for kk = 1:numChannels
                    if ds(kk).VpeakDelay <= DoPollingLag && floor(ds(kk).v_length*1+ds(kk).VpeakDelay)>VbeatDelay
                        VbeatDelay = floor(ds(kk).v_length*1+ds(kk).VpeakDelay);
                    end
                end
            end
            
            % make actual weight adjustments
            sumWeights = 0;
            for kk = 1:numChannels
                correct = (decision == (ds(kk).VpeakDelay <= DoPollingLag));
                ds(kk).vWeight = adjustWeightFn(ds(kk).vWeight,correct,numChannels);
                ds(kk).VpeakWeighted = true;
                sumWeights = sumWeights + ds(kk).vWeight;
            end
            
            %normalize weights
            for kk = 1:numChannels
                ds(kk).vWeight = ds(kk).vWeight/sumWeights;
            end
            
            %limit weights to maxWeight and re-normalize
            sumLowWeights = 0;
            numLowWeights = 0;
            for kk = 1:numChannels
                if ds(kk).vWeight < maxWeight
                    sumLowWeights = sumLowWeights + ds(kk).vWeight;
                    numLowWeights = numLowWeights + 1;
                end
            end
            for kk = 1:numChannels
                if ds(kk).vWeight < maxWeight
                    ds(kk).vWeight = (ds(kk).vWeight/sumLowWeights)*(numLowWeights/numChannels);
                else
                    ds(kk).vWeight = maxWeight;
                end
            end
            
            break 
        end
    end
    
    
    
    %~~~~~~~~~~~~~~~~~
    %Stimulation Code
    %~~~~~~~~~~~~~~~~~
    %Want to organize code such that one channels need to stimulate will
    %dominate decision to stimulate. 
    
    %If an atrial beat has not been detected fast enough, deliver a stimulation. 
    %FIXME?: The code currently does not assume that a atrial beat will
    %be detected soon after stimulation, so the tracking parameters are
    %manually adjusted.
    
    if (min(AbeatDelay, AstimDelay) >= AADelayThresh)
        %disp('Deliver Atrial Stimulation due to AA Delay')
        AstimDelay = 0;
        aStimInd = [aStimInd i];
    end

    needVstim = min(AbeatDelay, AstimDelay) >= AVDelayThresh && VstimDelay > AADelayThresh && VbeatDelay > min(AbeatDelay,AstimDelay);
    if needVstim
        %disp('Deliver Atrial Stimulation due to AA Delay')
        VstimDelay = 0;
        vStimInd = [vStimInd i];
    end
    
    
    %~~~~~~~~~~~~~~~~~
    % Adjust capture voltages if necessary
    %~~~~~~~~~~~~~~~~~ 
    if (AstimDelay == ACaptureThresh+1) && AbeatDelay>AstimDelay
        %disp('Failed Atrial Capture - increase stim')
    end
    
    if (VstimDelay == VCaptureThresh+1) && VbeatDelay>VstimDelay
        %disp('Failed Ventricular Capture - increase stim')
    end
    
    
    
    for k = 1:numChannels
        ds(k).aWeightTrace(i) = ds(k).aWeight;
        ds(k).vWeightTrace(i) = ds(k).vWeight;
    end
    
end

figure
for i = 1:numChannels
    d = ds(i);
    if numChannels<4
        subplot(numChannels,1,i)
    else
        figure
    end
    scale = numChannels*10^floor(log10(max(data(:,i))));
    hold on;
    h=plot(data(:,i),'k');
    a=plot([0 d.vPeakInd], d.v_thresh*d.v_flip, 'or'); h=[h a(1)];
    a=plot([0 d.aPeakInd], d.a_thresh*d.a_flip, 'ob'); h=[h a(1)];
    a=plot([0 vStimInd], d.v_thresh*d.v_flip*vVoteThresh, 'xr'); h=[h a(1)];
    a=plot([0 aStimInd], d.a_thresh*d.a_flip*aVoteThresh, 'xb'); h=[h a(1)];
    %a=plot(vSumofVote.*d.v_thresh*d.v_flip, '--r'); h=[h a(1)];
    %a=plot(aSumofVote.*d.a_thresh*d.a_flip, '--b'); h=[h a(1)];
    a=plot(d.vWeightTrace.*scale*d.v_flip, 'r'); h=[h a(1)];
    a=plot(d.aWeightTrace.*scale*d.a_flip, 'b'); h=[h a(1)];
    title(['Channel ' num2str(i)],'Fontsize',14)
end
legend(h,{'data','ventricular peaks','atrial peaks','ventricular stimulation','atrial stimulation',...%'ventricular polling sum','atrial polling sum',...
    'ventricular polling weight','atrial polling weight'},'Fontsize',14)

end

function y = sig(x)
y = 1./(1+exp(-x));
end

function newW = adjustWeightFn(oldW,correct,numChannels)
    if ~correct
        %newW = sig(oldW-1/numChannels-1)*2/numChannels;
        newW = oldW*0.9;
    else
        %newW = sig(oldW-1/numChannels+1)*2/numChannels;
        newW = oldW+0.01;
    end
end
