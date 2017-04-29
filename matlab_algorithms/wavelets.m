close all
addpath('test_data/sept29_2016_test/')
addpath('test_data/PhisioBank_iaf/')
addpath('test_data/FebruaryData/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point


%s = load('NormalSinusRhythm_struct.mat');
s = load('SinusRhythmHRAHBCSRVpluspaced_struct.mat');
%s = load('NormalSinusRhythm_struct.mat');
%s = load('Pacingfromchipapprox120bpmxmA_struct.mat');
%s = load('PacingfromMedtronic120bpm2mA_struct.mat');
%s = load('iaf1_struct.mat'); %number ranges from 1-8 for different patients

Fs = s.Fs; %sampling rate
data = s.data;
begin_time = 0.0;
end_time = 25; %second
data = data(begin_time*Fs+1:end_time*Fs+1,:);
[numSamples, numChannels] = size(data);

data = data(:,2);
b = fir1(1000,2.5/Fs,'high'); %filter to remove DC bias
b2 = fir1(500,150/Fs);
data = filter(b,1,data);
data = filter(b2,1,data);
lens = 18:2:600;
lens = 72;
res = zeros(1,length(lens));
res2 = zeros(1,length(lens));


for i = 1:length(lens)
    len = lens(i);
    t = 1:len;
    %h = -sin(2*pi./(2/3*len)*t).*exp(-abs(t-len/2)/(len));
    %h = sin(2*pi./(2*len)*t);
    h = sinc(2./(len/2)*(t-len/2));
    h = h/sum(h);
    h = h-mean(h);
    y = filter(h,1,data);
    res(i) = max(y);
    res2(i) = min(y);
end
figure
plot(h)
figure
plot(lens,res,lens,res2)
figure
plot(1:length(data),data,1:length(data),y)