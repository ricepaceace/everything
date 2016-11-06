function [count, rising_indices, falling_indices] = CountPeaks(bools,min_length)
    % Todo: this is sample-rate and heart-rate dependent
    %filt = [0.00331877528131886,0.00331999841461628,0.00332109305985185,0.00332205912946198,0.00332289654616099,0.00332360524295000,0.00332418516312464,0.00332463626028153,0.00332495849832360,0.00332515185146431,0.00332521630423051,0.00332515185146431,0.00332495849832360,0.00332463626028153,0.00332418516312464,0.00332360524295000,0.00332289654616099,0.00332205912946198,0.00332109305985185,0.00331999841461628,0.00331877528131886];
    filt = ones(1,min_length)/min_length;
    filtBool = filter(filt, 1, bools);
    o1=[0; filtBool > 1/min_length; 0];
    o2=[1; filtBool <= 1/min_length; 1];
    rising_edges=o1(2:end) & o2(1:end-1); 
    falling_edges=o1(1:end-1) & o2(2:end); % falling edges
    
    rising_indices = find(rising_edges);
    falling_indices = find(falling_edges);
    peakLengths = falling_indices-rising_indices;
    count = length(rising_indices) + sum(floor(peakLengths/150));
end