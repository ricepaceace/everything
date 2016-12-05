% Send ECG data to arduino to PWM the data for testing
clc;
clear all;
%Reset all ports so you can open the USB port that's connected to the
%arduino
%delete(instrfindall);
%s = serial('/dev/cu.usbmodem1411'); %Change this line based on computer USB port.
%fopen(s);

%Import data
data = importdata('good-ch1.h');

%Find the minimum and maximum value of data
%in_min = min(data);
%in_max = max(data);
in_min = -2000;
in_max = 2000;
%Set min and max for arduino PWM values
out_min = 0;
out_max = 255;

%Now send each point in the data array to the arduino
sizedata = size(data);
val_out = zeros(1, 60000);
for i = 1:sizedata(1,2)
    %Map the value of the data to the range of 0-255 for PWM
    val_out(i) = (data(1,i) - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
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