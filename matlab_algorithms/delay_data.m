function [delayed, delays] = delay_data(s)
data = s.data;
Fs = s.Fs;
[num_samples num_channels] = size(data);
delays = zeros(1,num_channels);
delayed = zeros(num_samples+Fs*2,num_channels);
delayed((1:num_samples)+Fs,1) = data(:,1);
for channel = 2:num_channels
    [corr,lags] = xcorr(data(:,1),data(:,channel),Fs);
    figure
    plot(lags,corr)
    [~,I] = max(corr);
    delays(channel)=lags(I);
    delayed((1:num_samples)+Fs+lags(I),channel) = data(:,channel);
end
figure
plot(delayed)
delays/Fs
a=4;

end