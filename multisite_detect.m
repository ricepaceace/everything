% main script for running detection algorithms on test data
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
s = load('iaf2_struct.mat'); %number ranges from 1-8 for different patients

sampling_rate = s.sampling_rate;
data = s.data;
numChannels = size(data,1);
begin_time = 0.0;
end_time = 30; %second
data = data(begin_time*sampling_rate+1:end_time*sampling_rate+1,:);

% run on sum of all channels
[a,v,samplesHB]=GuessParameters2(sum(data,2));
%figure; hold on; plot(data,'b'); plot(a*(data>a), 'or');plot(v*(data>v).*(data<a), 'xp');

detection.v_thresh = a;
detection.v_length = 3;
detection.a_thresh = v;
detection.a_length = 8;
[vind, aind] = one_chamber_peak_finder(detection, sum(data,2));

figure; hold on;
plot(data,'b');
plot(aind,  detection.a_thresh, 'xg');
plot(vind,  detection.v_thresh, 'or');
title('sum')

%%% run on each channel individually
% ainds = zeros(17, 1);
% vinds = zeros(17, 1);
% for i=1:size(NormalSinusRhythm_struct.data,2)
%     data=NormalSinusRhythm_struct.data(:,i);
%     [a,v,samplesHB]=GuessParameters2(data);
%     %figure; hold on; plot(data,'b'); plot(a*(data>a), 'or');plot(v*(data>v).*(data<a), 'xg');
% 
%     detection.v_thresh = a;
%     detection.v_length = 3;
%     detection.a_thresh = v;
%     detection.a_length = 8;
%     [vind, aind] = one_chamber_peak_finder(detection, data);
%     
%     figure; hold on;
%     plot(data,'b');
%     plot(aind,  detection.a_thresh, 'xg');
%     plot(vind,  detection.v_thresh, 'or');
%     
%     ainds(i) = length(aind);
%     vinds(i) = length(vind);
% end
% ainds
% vinds

