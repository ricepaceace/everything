
function [v_indices, a_indices] = one_chamber_peak_finder(detection,data)
v_bool = data>detection.v_thresh;
[~,v_indices_r, v_indices_f] = CountPeaks(v_bool,detection.v_length);

t_blank = 30;
l_blank = 30;
for i = 1:length(v_indices_r)
    data((v_indices_r(i)-t_blank):(v_indices_f(i)+l_blank)) = min(data);
end
v_indices = v_indices_r;

a_bool = (data>detection.a_thresh).*(data<detection.v_thresh);
[~,a_indices,~] = CountPeaks(a_bool,detection.a_length);
