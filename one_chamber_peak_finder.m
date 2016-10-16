

function [v_indices, a_indices] = one_chamber_peak_finder(detection,data)
v_indices = [];
a_indices = [];
above_v = data>detection.v_thresh;
above_a = (data>detection.a_thresh).*(data<detection.v_thresh);
num_ones_v = 0;
num_ones_a = 0;
for i=1:length(data)
    if above_v(i)
        num_ones_v = num_ones_v+1;
        if num_ones_v == detection.v_length
            v_indices = [v_indices i];
        end
    else 
        num_ones_v = 0;
    end
    if above_a(i)
        num_ones_a = num_ones_a+1;
        if num_ones_a == detection.a_length
            a_indices = [a_indices i];
        end
    else 
        num_ones_a = 0;
    end
end