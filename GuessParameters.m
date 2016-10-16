function [ athresh, vthresh] = GuessParameters( data )
%GUESSPARAMETERS Summary of this function goes here
%   Detailed explanation goes here

    % Moving average filter to get rid of some of the peaks
    data = conv(data, [1 1 1 1 1]/5);

    [~, athresh] = recurse_div_bins(data, .95, .99, 1.3);
    [~, vthresh] = recurse_div_bins(data, .90, .95, 1.3);

end
function [bins, thresh] = recurse_div_bins(data, fmin, fmax, adjust)
    starting_bins = [-20000,-1000,-100,-10,10,100,1000,10000];
    bins = starting_bins;
    for iter = 1:4
        counts = special_histogram(data, bins);
        fractions = cumsum(counts)./sum(counts);
        % For both the low side, we want to keep from the last zero value
        % to the first value > .05 (both inclusive)
        low_l = max(1, find(fractions, 1)-1);
        low_h = find(fractions > .05,1);
        % And similarly for the high side
        high_l = find(fractions < fmin, 1, 'last');
        high_h = min(length(bins), find(fractions < fmax, 1, 'last')+2); % the +2 is needed because of the way cumsum works
       
        thresh = bins(high_l);
        
        bins = [ 
            interp1(low_l:low_h, bins(low_l:low_h), linspace(low_l,low_h,10), 'pchip'), ...
            interp1(high_l:high_h, bins(high_l:high_h), linspace(high_l,high_h,10), 'pchip')
            ]; 
        fmin = fmin^adjust;
        fmax = 1-(1-fmax)^adjust;
    end
end

function [counts] = special_histogram(data, bins)
    zc = repmat(data, [1, length(bins)]) - repmat(bins, [length(data), 1]);
    zc_plus = zc>0;
    zc_minus = zc<0;
    zc_counts =zc_plus(2:end, :).*zc_minus(1:end-1, :)+zc_minus(2:end, :).*zc_plus(1:end-1, :);
    counts = sum(zc_counts, 1);
end
