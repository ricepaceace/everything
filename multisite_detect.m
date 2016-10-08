% main script for running detection algorithms on test data
addpath('test_data/sept29_2016_test/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point
numChannels = 17;
N = 6;
offset = 0;

load('NormalSinusRhythm_struct.mat')
load('Pacingfromchipapprox120bpmxmA_struct.mat')
load('PacingfromMedtronic120bpm2mA_struct.mat')
s = PacingfromMedtronic120bpm2mA_struct;
sampling_rate = s.sampling_rate;
data = s.data;

%%% plotting data from multiple channels
for f = 1:ceil(numChannels/N)
    figure(f+offset)
    clf
    subplot(N,1,1)
    begin_time = 0.0;
    end_time = 10; %second
    for i = (1:N)
        if i+(f-1)*N > numChannels
            break
        end
        subplot(N,1,i)
        plot(begin_time:1/sampling_rate:end_time,data(begin_time*sampling_rate+1:end_time*sampling_rate+1,i+(f-1)*N))
        ylabel(i+(f-1)*N)
        set(gca,'XTick',[]);
    end
end

figure(4+offset)
clf
plot(begin_time:1/sampling_rate:end_time,sum(data(begin_time*sampling_rate+1:end_time*sampling_rate+1),1))

detection.v_thresh = 2000;
detection.v_length = ceil(0.005*sampling_rate);
detection.a_thresh = 200;
detection.a_length = ceil(0.02*sampling_rate);

[peak_indices peak_types] = one_chamber_peak_finder(detection,data)


