% Send ECG data to arduino to PWM the data for testing
clc;
clear all;
%Reset all ports so you can open the USB port that's connected to the
%arduino
%delete(instrfindall);
%s = serial('/dev/cu.usbmodem1411'); %Change this line based on computer USB port.
%fopen(s);

%Import data
%data = importdata('good-ch1.h');

addpath('../../matlab_algorithms/test_data/sept29_2016_test/')
% addpath('test_data/PhisioBank_iaf/')
filename='NormalSinusRhythm_struct';
s = load([filename '.mat']);
%s = load('Pacingfromchipapprox120bpmxmA_struct.mat');
%s = load('PacingfromMedtronic120bpm2mA_struct.mat');
%s = load('iaf1_struct.mat'); %number ranges from 1-8 for different patients

Fs = s.Fs; %sampling rate
origData = s.data;

channels = [1,2];
%Find the minimum and maximum value of data
%in_min = min(data);c
%in_max = max(data);
in_min = -2250;
in_max = 2250;
%Set min and max for arduino PWM values
out_min = 0;
out_max = 255;
streamLength = 30000;
for j = channels
    %Now send each point in the data array to the arduino
    data = origData(:,j);

    val_out = zeros(1, streamLength);
    for i = 1:streamLength
        %Map the value of the data to the range of 0-255 for PWM
        val_out(i) = (data(i) - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
        if val_out(i) < out_min
            val_out(i) = 0;
        end
        if val_out(i) > out_max
            val_out(i) = 255;
        end
        %Send to arduino
        %fwrite(s, val_out(i), 'int8');
        %pause(.001);
    end
    %fclose(s);
    vv = round(val_out);
    csvwrite([filename num2str(j) '.h'],vv);
end