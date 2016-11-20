%Inputs:
%detection - struct representing the preset/learned detection paramters
%   .v_thresh - magnitude threshold for ventricular beats
%   .v_length - min_length of a ventricular beat (in samples)
%   .a_thresh - magnitude threshold for atrial beats
%   .a_length - min_length of an atrial beat (in samples)
%data - vector data from a single channel

%Outputs
%v_indices - vector containing the indices of all the ventricular beats
%a_indices - vector containing the indices of all the atrial beats
function [v_indices, a_indices] = one_chamber_peak_finder(detection,data)
v_bool = data>detection.v_thresh;
[~,v_indices_r, v_indices_f] = CountPeaks(v_bool,detection.v_length);

t_blank = 20;
l_blank = 20;
%data = abs(data);
for i = 1:length(v_indices_r)
    data((v_indices_r(i)-t_blank):(v_indices_f(i)+l_blank)) = min(data);
end

v_indices = v_indices_r;

a_bool = (data>detection.a_thresh);
[~,a_indices,~] = CountPeaks(a_bool,detection.a_length);
