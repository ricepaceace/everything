function multisiteDecision

%This script simulates our algorithm in real time.  It performs parameter
%learning on each channel of data.  In addition, it will perform beat
%detection on each of the channels and will utilize knowledge from multiple
%channnels to determine whether stimulation needs to be delivered.
%Additionally, it will weight channels based on how correct the channels
%seem to be in their pacing decisions.  
%
%Input:
%s - Structure that will contain the data, with multiple channels, and
%appropriate sampling rate.
%
%Output:
%Plots that will showcase ventricular beat detection, atrial beat detection
%and stimulation if necessary based on multisite information. 

close all
addpath('test_data/sept29_2016_test/')
addpath('test_data/PhisioBank_iaf/')
%addpath('test_data/FebruaryData/')
% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point


%s = load('NormalSinusRhythm_struct.mat');
%s = load('Pacingfromchipapprox120bpmxmA_struct.mat');
s = load('PacingfromMedtronic120bpm2mA_struct.mat');
%s = load('iaf1_struct.mat'); %number ranges from 1-8 for different
%s = load('SinusRhythmHRAHBCSRVpluspaced_struct.mat');

%Set the sampling rate and data that we will be working with.
Fs = s.Fs; 
data = s.data;

%Define the amount of data that we want to use for parameter learning and
%detection.
begin_time = 0.0;
end_time = 7; %second
data = data(begin_time*Fs+1:end_time*Fs+1,:);
[numSamples, numChannels] = size(data);

VENT = 1;
ATRIAL = 2;

b = fir1(1000,2.5/Fs,'high'); %filter to remove DC bias
b2 = fir1(500,150/Fs);

%~~~~~~~~~~~~~~~~~~~~~
%Channel Parameters
%~~~~~~~~~~~~~~~~~~~~~
ds = repmat(struct(), numChannels, 1);
aSumofVote = [];
vSumofVote = [];

%AVDelayThresh defines the maximimum amount of time between atrial and ventricular beats
%before a channel will flag that it needs ventricular stimulation
AVDelayThresh = 350;
%AADelayThresh defines the maximimum amount of time between consecutive atrial beats
%before a channel will flag that it needs an atrial stimulation
AADelayThresh = 1000;
AdjustWeightsLag = 100;

%Recquire that aVoteThresh and vVoteThresh percent of channels must flag
%for atrial and ventricular respectively for an actual stimulation to be
%delivered.
aVoteThresh = 0.4;
vVoteThresh = 0.4;

%Will be used to bound each channel to a maximum weight so no single
%channel can dominate the voting scheme. 
maxWeight = 2/numChannels;

for k = 1:numChannels
    %Filter the data.  In our hardware system, the preprocessor does this
    %step.
    data(:,k) = filter(b,1,data(:,k));
    data(:,k) = filter(b2,1,data(:,k));
    
    %Compute all of the detection parameters for this channel using
    %LearnParameters (LearnParameters will also call LearnLengths.
    [ds(k).v_thresh,ds(k).a_thresh,ds(k).v_flip,ds(k).a_flip,ds(k).v_length,ds(k).a_length,ds(k).v_first]=LearnParameters(data(:,k));
    
    %Initialize the structure ds, that will have numChannel fields.  ds(k)
    %will be used extensively for atrial and ventricular beat detection for
    %channel k.
    
    %Each channel k will have its own set of parameters that are defined
    %below.
    ds(k).AbeatDelay = 0; %Tracks amount of time since last atrial beat.
    ds(k).VbeatDelay = 0;%Tracks amount of time since last ventricular beat.
    ds(k).VbeatFallDelay = 0;%Tracks amount of time since last falling edge of ventricular beat.
    ds(k).AbeatFallDelay = 0;%Tracks amount of time since last falling edge of atrial beat.
    ds(k).AstimDelay = 0;%Tracks amount of time since last atrial stimulation.
    ds(k).VstimDelay = 0;%Tracks amount of time since last ventricular stimulation.
    ds(k).ACaptureThresh = ds(k).a_length;%Stimulation voltage for atria
    ds(k).VCaptureThresh = ds(k).v_length;%Stimulation voltage for ventricles
    ds(k).PostVARP = 250;%Minimum time between ventricular then atrial beat.
    ds(k).PreVARP = 20;
    ds(k).PostAVRP = 100;%Minimum time between atrial then ventricular beat.
    ds(k).PreAVRP = 20;
    
    %these are used for doing real time detection
    ds(k).recentVBools = zeros(1,ds(k).v_length); %Binary value indicating whether recent values have exceeded v_thresh
    ds(k).recentABools = zeros(1,ds(k).a_length); %Binary value indicating whether recent values have exceeded a_thresh
    ds(k).last_sample_is_V = false;%Flag indicating whether last sample was a V beat
    ds(k).last_sample_is_A = false;%Flag indicating whether last sample was a A beat
    
    %Redefines recent data points depending on whether we have determined
    %if the ventricle or atria are bigger.
    %if = ventricle bigger
    %else = atria bigger.
    if ds(k).v_first
        ds(k).recentdatapoints = zeros(1,ds(k).PreVARP);
    else
        ds(k).recentdatapoints = zeros(1,ds(k).PreAVRP);
    end
    
    %initialize polling weights for each channel.
    ds(k).aWeight = 1/numChannels;
    ds(k).vWeight = 1/numChannels;
    ds(k).AbeatWeighted = false;
    ds(k).VbeatWeighted = false;
    
    %These variables are just used for testing and visualization, not actually
    %used in the algorithm. 
    ds(k).vPeakInd = [];
    ds(k).aPeakInd = [];
    ds(k).aStimInd = [];
    ds(k).vStimInd = [];
    %Tracks location of stimulations and peaks.
    ds(k).aWeightTrace = zeros(1,numSamples);
    ds(k).vWeightTrace = zeros(1,numSamples);
    %traces weights for each channel.
    
    %Flag that each channel throws indiciating whether the channel decides
    %if atrial or ventricular stimulation is necessary.
    ds(k).aPacingNeeded = 0;
    ds(k).vPacingNeeded = 0;
    
end

%data(floor(numSamples/10):floor(numSamples/3),1:2) = 0;
%data(:,1) = data(:,1)+[normrnd(0,max(data(:,1))/2,[floor(numSamples/3),1]); zeros(numSamples-floor(numSamples/3),1)];%.*exp(-(1:numSamples)'/numSamples);

%This loop models real time data acquisition in an actual hardware system.
for i = 1:numSamples
    
    %~~~~~~~~~~~~~~~~~~~~~~~~~
    %detection for all channels
    %~~~~~~~~~~~~~~~~~~~~~~~~~
   
    %Increment time since last atrial beat d.
    for k = 1:numChannels
        ds(k).recentdatapoints = [ds(k).recentdatapoints(2:end) data(i,k)]; 
        %get next datapoint and add to buffer
        
        %increment all delays when considering each sample in real time.
        ds(k).AbeatDelay = ds(k).AbeatDelay + 1;
        ds(k).VbeatDelay = ds(k).VbeatDelay + 1;
        ds(k).AbeatFallDelay = ds(k).AbeatFallDelay + 1;
        ds(k).VbeatFallDelay = ds(k).VbeatFallDelay + 1;
        ds(k).AstimDelay = ds(k).AstimDelay + 1;
        ds(k).VstimDelay = ds(k).VstimDelay + 1;
        
        %Perform beat detection with the knowledge of the new sample.
        ds(k) = yamPeakFinder(i,ds(k));
    end
    
    %~~~~~~~~~~~~~~~~~
    %Stimulation Code
    %~~~~~~~~~~~~~~~~~
    %Want to organize code such that one channels need to stimulate will
    %dominate decision to stimulate. 
    
    aPacingVoteCount = 0;
    
    for k = 1:numChannels
        d = ds(k);
        %If the beatdelay for channel k exceeds the threshold, channel will
        %decide that pacing is needed.
        if (d.AbeatDelay > AADelayThresh)
            ds(k).aPacingNeeded = 1;
        else
            ds(k).aPacingNeeded = 0;
        end
        %Sum vote from all channels based on each channels respective
        %weights.
        aPacingVoteCount = aPacingVoteCount + ds(k).aWeight*ds(k).aPacingNeeded;
    end
    
    aSumofVote = [aSumofVote aPacingVoteCount];
    
    %If atrial vote exceeds threshold and it has been 1/2 second since the
    %last atrial stimulation, deliver a stimulation.
    if aPacingVoteCount >= aVoteThresh && ds(1).AstimDelay > 500
        for k = 1:numChannels
            d = ds(k);
            %disp('Deliver Atrial Stimulation due to AA Delay')
            ds(k).aStimInd = [d.aStimInd i];
            ds(k).AstimDelay = 0;
        end
    end
    
    %Next for loop handles ventricular stimulation.
    vPacingVoteCount = 0;
    for k = 1:numChannels
        d = ds(k);
        
        %Channel will decide that pacing is necessary for the ventricle if
        %the following conditions are met.
        %1. We have seen an atrial beat more recently than a ventricular
        %beat.
        %2. It has been long enough since we last have seen an atrial beat
        %and since we have last stimulated.
        if (min(d.VstimDelay,d.VbeatDelay) > min(d.AstimDelay,d.AbeatDelay) && min(d.AstimDelay,d.AbeatDelay) > AVDelayThresh)
            ds(k).vPacingNeeded = 1;
        else 
            ds(k).vPacingNeeded = 0;
        end
        %Sum ventricular vote count based on weight of each channel
        vPacingVoteCount = vPacingVoteCount + ds(k).vWeight*ds(k).vPacingNeeded;
    end
    
    vSumofVote = [vSumofVote vPacingVoteCount];
    
    %Deliver stimulation if enough channels vote and it has been 1/2 second
    %since we have stimulated the ventricle.
    if vPacingVoteCount >= vVoteThresh && ds(1).VstimDelay > 500
        for k = 1:numChannels
            d = ds(k);
            %disp('Deliver Ventricular Stimulation due to AV Delay')
            ds(k).vStimInd = [ds(k).vStimInd i];
            ds(k).VstimDelay = 0;
        end
    end
    
    %%% Adjust capture voltages if necessary
    if (ds(1).AstimDelay == ds(1).ACaptureThresh+1) && aPacingVoteCount >= aVoteThresh
        %disp('Failed Atrial Capture - increase stim')
    end
    
    if (ds(1).VstimDelay == ds(1).VCaptureThresh+1) && vPacingVoteCount >= vVoteThresh
        %disp('Failed Ventricular Capture - increase stim')
    end
    
    %%% Adjust Weights
    
    %if any of the channels had a peak a fixed amount of time ago that we
    %havent already taken into account...
    for k = 1:numChannels
        if (ds(k).AbeatDelay == AdjustWeightsLag) && ~ds(k).AbeatWeighted
            
            %determine whether there was a beat or not
            weighted_sum = 0;
            for kk = 1:numChannels
                if ds(kk).AbeatDelay <= AdjustWeightsLag
                    weighted_sum = weighted_sum + ds(kk).aWeight;
                end
            end
            decision = weighted_sum>0.5;
            
            
            % make actual weight adjustments
            sumWeights = 0;
            for kk = 1:numChannels
                correct = (decision == (ds(kk).AbeatDelay <= AdjustWeightsLag));
                ds(kk).aWeight = adjustWeightFn(ds(kk).aWeight,correct,numChannels);
                ds(kk).AbeatWeighted = true;
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
    
    %if any of the channels had a peak a fixed amount of time ago that we
    %havent already taken into account...
    for k = 1:numChannels
        if (ds(k).VbeatDelay == AdjustWeightsLag) && ~ds(k).VbeatWeighted
            
            %determine whether there was a beat or not
            weighted_sum = 0;
            for kk = 1:numChannels
                if ds(kk).VbeatDelay <= AdjustWeightsLag
                    weighted_sum = weighted_sum + ds(kk).vWeight;
                end
            end
            decision = weighted_sum>0.5;
            
            
            % make actual weight adjustments
            sumWeights = 0;
            for kk = 1:numChannels
                correct = (decision == (ds(kk).VbeatDelay <= AdjustWeightsLag));
                ds(kk).vWeight = adjustWeightFn(ds(kk).vWeight,correct,numChannels);
                ds(kk).VbeatWeighted = true;
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
    a=plot([0 d.vStimInd], d.v_thresh*d.v_flip*vVoteThresh, 'xr'); h=[h a(1)];
    a=plot([0 d.aStimInd], d.a_thresh*d.a_flip*aVoteThresh, 'xb'); h=[h a(1)];
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
