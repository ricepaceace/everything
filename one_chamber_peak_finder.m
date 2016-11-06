
function [v_indices, a_indices] = one_chamber_peak_finder(detection,data)
v_indices = [];
a_indices = [];
v_bool = data>detection.v_thresh;
a_bool = (data>detection.a_thresh).*(data<detection.v_thresh);
[~,v_indices,~] = CountPeaks(v_bools,detection.v_length);
[~,a_indices,~] = CountPeaks(a_bools,detection.a_length);
