ainds = zeros(17, 1);
vinds = zeros(17, 1);
for i=1:size(NormalSinusRhythm_struct.data,2)
    data=NormalSinusRhythm_struct.data(:,i);
    [a,v]=GuessParameters2(data);
    figure; hold on; plot(data); plot(a*(data>a), 'o');plot(v*(data>v).*(data<a), 'x');

    detection.v_thresh = a;
    detection.v_length = 3;
    detection.a_thresh = v;
    detection.a_length = 8;
    [vind, aind] = one_chamber_peak_finder(detection, data);
    %figure; hold on;
    %plot(data);
    %plot(aind,  detection.a_thresh, 'x');
    %plot(vind,  detection.v_thresh, 'o');
    ainds(i) = length(aind);
    vinds(i) = length(vind);
end
ainds
vinds
