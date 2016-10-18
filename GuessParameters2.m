function [ vc, ac , samplesHB ] = GuessParameters2( data )
%GUESSPARAMETERS2 Summary of this function goes here
%   Detailed explanation goes here
    heartbeats = FindHeartRate(data);
    samplesHB = floor(length(data)/heartbeats);
    
    v_cutoffs = [0,0];
    v_cutoffs(1) = BinarySearch(data, heartbeats+2, 1);
    v_cutoffs(2) = BinarySearch(data, heartbeats-2, 0);
    
    vc = sum([.5, .5] .* v_cutoffs);
 
    
    ndata = data;
    
    t_blank = 30;
    l_blank = 30;
    [~, rising_edges, falling_edges] = CountPeaks(data > vc);
    rising_edges = find(rising_edges);
    falling_edges = find(falling_edges);
    for i = 1:length(rising_edges)
        ndata((rising_edges(i)-t_blank):(falling_edges(i)+l_blank)) = 0;
    end
   
    a_cutoffs = [0,0];
    a_cutoffs(1) = BinarySearch(ndata, heartbeats+2, 1);
    a_cutoffs(2) = BinarySearch(ndata, heartbeats-2, 0);
    ac = sum([.7, .3] .* a_cutoffs);
    
end

function [mid] = BinarySearch(data, expected, hh)
    low = min(data);
    high = max(data);
    for i=1:10
        mid = (low+high)/2;
        count = CountPeaks(data>mid);
    
        if (count > expected) || ((count == expected) && (hh == 0))
            low = mid;
        elseif (count < expected) || ((count == expected) && (hh == 1))
            high = mid;
            continue;
        end
    end
end

function [count, rising_edges, falling_edges] = CountPeaks(bools)
    % Todo: this is sample-rate and heart-rate dependent
    filt = [0.00331877528131886,0.00331999841461628,0.00332109305985185,0.00332205912946198,0.00332289654616099,0.00332360524295000,0.00332418516312464,0.00332463626028153,0.00332495849832360,0.00332515185146431,0.00332521630423051,0.00332515185146431,0.00332495849832360,0.00332463626028153,0.00332418516312464,0.00332360524295000,0.00332289654616099,0.00332205912946198,0.00332109305985185,0.00331999841461628,0.00331877528131886];
    filtBool = filter(filt, 1, bools);
    o1=[0; filtBool > .005; 0];
    o2=[1; filtBool <= .005; 1];
    rising_edges=o1(2:end) & o2(1:end-1); 
    falling_edges=o1(1:end-1) & o2(2:end); % falling edges
    peakLengths = find(falling_edges)-find(rising_edges);
    
    count = sum(rising_edges) + sum(floor(peakLengths/150));
end

function [heartbeats] = FindHeartRate(data)
    min_heartrate = 50; % bpm
    max_heartrate = 150; % bpm
    sample_rate = 1000;
    Y = abs(fft(data));
    rescale =  length(data)/(sample_rate * 60); % TODO: check this
    min_idx = min_heartrate * rescale;
    max_idx = max_heartrate * rescale;
    [~, hr_idx] = max(Y(min_idx:max_idx));
    hr_idx = hr_idx - 1 + min_idx;
    heartbeats = hr_idx;
end