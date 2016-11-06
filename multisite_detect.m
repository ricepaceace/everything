% main script for running detection algorithms on test data
close all
addpath('test_data/sept29_2016_test/')
addpath('test_data/PhisioBank_iaf/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point


%s = load('NormalSinusRhythm_struct.mat');
%s = load('Pacingfromchipapprox120bpmxmA_struct.mat');
%s = load('PacingfromMedtronic120bpm2mA_struct.mat');
s = load('iaf1_struct.mat'); %number ranges from 1-8 for different patients

Fs = s.Fs; %sampling rate
data = s.data;
numChannels = size(data,1);
begin_time = 0.0;
end_time = 25; %second
data = data(begin_time*Fs+1:end_time*Fs+1,:);

b = fir1(1000,2.5/Fs,'high'); %filter to remove DC bias

%%% run on each channel individually
ainds = zeros(17, 1);
vinds = zeros(17, 1);
for i=1:size(data,2)
    channel_data=data(:,i);
    channel_data = filter(b,1,channel_data);
    [v,a]=GuessParameters2(channel_data);
    %figure; hold on; plot(data,'b'); plot(a*(data>a), 'or');plot(v*(data>v).*(data<a), 'xg');

    detection.v_thresh = v;
    detection.v_length = 8;
    detection.a_thresh = a;
    detection.a_length = 26;
    [vind, aind] = one_chamber_peak_finder(detection, channel_data);
    
    figure; hold on;
    plot(channel_data,'b');
    plot(aind, detection.a_thresh, 'xg');
    plot(vind, detection.v_thresh, 'or');
    title(['Channel' num2str(i)])
    
    ainds(i) = length(aind);
    vinds(i) = length(vind);
end
% ainds
% vinds

