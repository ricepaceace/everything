%Inputs: 
%bools - a vector of booleans representing some qunatity (data>threshold)
%min_length - the minimum width of the peaks we're looking for in number of samples

%Outputs:
%count: the number of peaks detected (including "chunked" peaks at low
%   thresholds to ensure threshhold vs num-peaks-found function decreases
%   monotonically
%rising_indices: a vector containing the indices of the beginnings of each peak (used as time of detection)
%falling_indices: a vector containing the indices of the ends of each peak

function [count, rising_indices, falling_indices] = CountPeaks(bools,min_length)

    % Denoise boolean vector with LPF and threshold in order to only count
    % a peak when the data exceeds the threshold for at least 2/3 of a
    % min_length samples window
    filt = ones(1,min_length)/min_length;
    filtBool = filter(filt, 1, bools);
    above=[0; filtBool > 2/3; 0];
    below = ~above;
    
    %detect rising and falling edges in denoised boolean function
    rising_edges=above(2:end) & below(1:end-1); 
    falling_edges=above(1:end-1) & below(2:end); % falling edges
    rising_indices = find(rising_edges);
    falling_indices = find(falling_edges);
    
    %calculate count as the number of peaks + number of chunks from
    %splitting long peaks (which is done to ensure that the function
    %LearnHeightRange is searching through is monotonically decreasing)
    peakLengths = falling_indices-rising_indices;
    count = length(rising_indices) + sum(floor(peakLengths/150));
end