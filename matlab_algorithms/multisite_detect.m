%This is the main script for running just detection algorithms on test data.
%To run detecetion and stimulation simulation, see the multisiteDecision.m
%script.  The script begins by initializing the data that detection will be
%performed on.  Next, it will loop through each channel of the data, and
%perform parameter learning and beat detection on each channel seperately.
%
%Input:
%s - Structure that will contain the data, with multiple channels, and
%appropriate sampling rate.
%
%Output:
%Plots that will showcase detection of ventricular and atrial beats using
%parameters learned for each channel.

close all
%Paths for data that we have been using for the sake of testing.
addpath('test_data/sept29_2016_test/')
addpath('test_data/PhisioBank_iaf/')
addpath('test_data/FebruaryData/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point
s = load('NormalSinusRhythm_struct.mat');
%s = load('Pacingfromchipapprox120bpmxmA_struct.mat');
%s = load('PacingfromMedtronic120bpm2mA_struct.mat');
%s = load('iaf1_struct.mat'); %number ranges from 1-8 for different patients
%s = load('SinusRhythmHRAHBCSRVpluspaced_struct.mat');

%Set the sampling rate and data that we will be working with.
Fs = s.Fs; %
data = s.data;
numChannels = size(data,2);

%Define the amount of data that we want to use for parameter learning and
%detection.
begin_time = 0.0;
end_time = 7; %second
data = data(begin_time*Fs+1:end_time*Fs+1,:); 

%filter to remove DC bias
b = fir1(1000,2.5/Fs,'high'); 
b2 = fir1(1000,150/Fs);

%%% run on each channel individually
ainds = zeros(numChannels, 1);
vinds = zeros(numChannels, 1);
for i=1:numChannels
    %Filter the data.  In our hardware system, the preprocessor does this
    %step.
    data(:,i) = filter(b,1,data(:,i));
    data(:,i) = filter(b2,1,data(:,i));
    
    %Compute all of the detection parameters for this channel using
    %LearnParameters (LearnParameters will also call LearnLengths.
    [d.v_thresh, d.a_thresh, d.v_flip, d.a_flip, d.v_length, d.a_length, d.v_first] = LearnParameters(data(:,i));
    
    %Perform beat detection on this specific channel using the parameters
    %that we learned.
    [vind, aind] = one_chamber_peak_finder(d, data(:,i));
    
    %Plot the resulting beat detection for this specific channel.
    figure; hold on;
    plot(data(:,i),'b');
    plot([0; vind], d.v_thresh*d.v_flip, 'or');
    plot([0; aind], d.a_thresh*d.a_flip, 'xk');
    title(['Channel' num2str(i)],'Fontsize',18)
    %legend({'input waveform','detected ventricles','detected atria'},'Fontsize',18)
    xlabel('time (samples)','Fontsize',14)
    
    ainds(i) = length(aind);
    vinds(i) = length(vind);
end
a=2;
% ainds
% vinds

