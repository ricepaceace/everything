ainds = zeros(17, 1);
vinds = zeros(17, 1);
for i=1:size(NormalSinusRhythm_struct.data,2)
    data=NormalSinusRhyclosethm_struct.data(:,i);
    [a,v]=GuessParameters(data);
    figure; hold on; plot(data); plot(a*(data>a), 'o');plot(v*(data>v).*(data<a), 'x');

    detection.v_thresh = a;
    detection.v_length = 5;
    detection.a_thresh = v;
    detection.a_length = 5;
    [aind, vind] = one_chamber_peak_finder(detection, data);
    ainds(i) = length(aind);
    vinds(i) = length(vind);
end
ainds
vinds
