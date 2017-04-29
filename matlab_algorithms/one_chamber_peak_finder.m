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
t_blank = 100; l_blank = 100;
if detection.v_first
    v_bool = detection.vflip*data>detection.v_thresh;
    [~,v_indices_r, v_indices_f] = CountPeaks(v_bool,detection.v_length);

    for i = 1:length(v_indices_r)
        data((v_indices_r(i)-t_blank):(v_indices_f(i)+l_blank)) = 0;
    end
    v_indices = v_indices_r;

    a_bool = detection.aflip*data>detection.a_thresh;
    [~,a_indices,~] = CountPeaks(a_bool,detection.a_length);
else
    a_bool = detection.aflip*data>detection.a_thresh;
    [~,a_indices_r, a_indices_f] = CountPeaks(a_bool,detection.a_length);

    for i = 1:length(a_indices_r)
        data((a_indices_r(i)-t_blank):(a_indices_f(i)+l_blank)) = 0;
    end
    a_indices = a_indices_r;

    v_bool = detection.vflip*data>detection.v_thresh;
    [~,v_indices,~] = CountPeaks(v_bool,detection.v_length);
end
