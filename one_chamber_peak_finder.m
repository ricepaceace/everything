

function [peak_indices peak_types] = one_chamber_peak_finder(detection,data)
peak_indices = [];
peak_types = [];
d = sum(data,2);
above_v = d>detection.v_thresh;
above_a = (d>detection.a_thresh).*(d<detection.v_thresh);
num_ones_v = 0;
num_ones_a = 0;
for i=1:length(d)
    if above_v(i)
        num_ones_v = num_ones_v+1;
        if num_ones_v == detection.v_length
            peak_indices = [peak_indices i];
            peak_types = [peak_types 'v'];
        end
    else 
        num_ones_v = 0;
    end
    if above_a(i)
        num_ones_a = num_ones_a+1;
        if num_ones_a == detection.a_length
            peak_indices = [peak_indices i];
            peak_types = [peak_types 'a'];
        end
    else 
        num_ones_a = 0;
    end
end