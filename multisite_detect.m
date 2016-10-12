% main script for running detection algorithms on test data
addpath('test_data/sept29_2016_test/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point
numChannels = 17;
N = 6;
fig_offset = 0;

load('NormalSinusRhythm_struct.mat')
load('Pacingfromchipapprox120bpmxmA_struct.mat')
load('PacingfromMedtronic120bpm2mA_struct.mat')
s = PacingfromMedtronic120bpm2mA_struct;
sampling_rate = s.sampling_rate;
data = s.data;
begin_time = 0.0;
end_time = 10; %second
%data = data(begin_time*sampling_rate+1:end_time*sampling_rate+1,:);

%%% plotting data from multiple channels
for f = 1:ceil(numChannels/N)
    figure(f+fig_offset)
    clf
    subplot(N,1,1)
    for i = (1:N)
        if i+(f-1)*N > numChannels
            break
        end
        subplot(N,1,i)
        plot((0:length(data)-1)/sampling_rate,data(:,i+(f-1)*N))
        ylabel(i+(f-1)*N)
        set(gca,'XTick',[]);
    end
end

figure(4+fig_offset)
clf
plot((0:length(data)-1)/sampling_rate,sum(data,2))

detection.v_thresh = 1e4;
detection.v_length = ceil(0.005*sampling_rate);
detection.a_thresh = 1300;
detection.a_length = ceil(0.02*sampling_rate);

[peak_indices peak_types] = one_chamber_peak_finder(detection,sum(data,2))
hold on
plot(peak_indices/sampling_rate, (peak_types=='v')*detection.v_thresh+(peak_types=='a')*detection.a_thresh,'*')


