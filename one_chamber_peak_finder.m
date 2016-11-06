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
a_bool = (data>detection.a_thresh).*(data<detection.v_thresh);
[~,v_indices,~] = CountPeaks(v_bool,detection.v_length);
[~,a_indices,~] = CountPeaks(a_bool,detection.a_length);
