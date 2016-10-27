close all
% ainds = zeros(17, 1);
% vinds = zeros(17, 1);
% for i=1:size(NormalSinusRhythm_struct.data,2)
%     data=NormalSinusRhythm_struct.data(:,i);
%     [a,v,samplesHB]=GuessParameters2(data);
%     %figure; hold on; plot(data,'b'); plot(a*(data>a), 'or');plot(v*(data>v).*(data<a), 'xg');
% 
%     detection.v_thresh = a;
%     detection.v_length = 3;
%     detection.a_thresh = v;
%     detection.a_length = 8;
%     [vind, aind] = one_chamber_peak_finder(detection, data);
%     
%     figure; hold on;
%     plot(data,'b');
%     plot(aind,  detection.a_thresh, 'xg');
%     plot(vind,  detection.v_thresh, 'or');
%     
%     ainds(i) = length(aind);
%     vinds(i) = length(vind);
% end
% ainds
% vinds

data = sum(NormalSinusRhythm_struct.data,2);
[a,v,samplesHB]=GuessParameters2(data);
%figure; hold on; plot(data,'b'); plot(a*(data>a), 'or');plot(v*(data>v).*(data<a), 'xp');

detection.v_thresh = a;
detection.v_length = 3;
detection.a_thresh = v;
detection.a_length = 8;
[vind, aind] = one_chamber_peak_finder(detection, data);

figure; hold on;
plot(data,'b');
plot(aind,  detection.a_thresh, 'xg');
plot(vind,  detection.v_thresh, 'or');
title('sum')
