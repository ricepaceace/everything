% This function takes in a stream of data (prerecorded, see yamPeakFinder
% for real-time), as well as a struct containing dectection parameters, and
% detects and returns the times of all the atrial and peaks in the data

%Inputs:
% detection - struct representing the preset/learned detection paramters
%   .v_thresh - magnitude threshold for ventricular beats
%   .v_length - the duration (in samples) a ventricular peak must occur in
%   .v_flip - sign of data that should be examined for ventricuar peaks (+1 or -1)
%   .a_thresh - magnitude threshold for atrial beats
%   .a_length - the duration (in samples) an atrial peak must occur in
%   .a_flip - sign of data that should be examined for atrial peaks (+1 or -1)
%   .v_first - boolean value that is true if we should detect ventricles first
%              before looking for atria, false otherwise
% data - vector data from a single channel

%Outputs
% v_indices - vector containing the indices of all the ventricular beats
% a_indices - vector containing the indices of all the atrial beats

function [v_indices, a_indices] = one_chamber_peak_finder(detection,data)
t_blank = 100; l_blank = 100; %number of samples to zero out on each side of a peak

% if we should detect ventricles first
if detection.v_first
    %find ventricular peaks
    v_bool = detection.v_flip*data>detection.v_thresh;
    [~,v_indices_rise, v_indices_fall] = CountPeaks(v_bool,detection.v_length);

    %zero out region around ventricular peaks
    for i = 1:length(v_indices_rise)
        data((v_indices_rise(i)-t_blank):(v_indices_fall(i)+l_blank)) = 0;
    end
    v_indices = v_indices_rise;

    %find atrial peaks
    a_bool = detection.a_flip*data>detection.a_thresh;
    [~,a_indices,~] = CountPeaks(a_bool,detection.a_length);

% if we should detect ventricles first
else
    %find atrial peaks
    a_bool = detection.a_flip*data>detection.a_thresh;
    [~,a_indices_r, a_indices_f] = CountPeaks(a_bool,detection.a_length);
    
    %zero out region around ventricular peaks
    for i = 1:length(a_indices_r)
        data((a_indices_r(i)-t_blank):(a_indices_f(i)+l_blank)) = 0;
    end
    a_indices = a_indices_r;

    %find ventricular peaks
    v_bool = detection.v_flip*data>detection.v_thresh;
    [~,v_indices,~] = CountPeaks(v_bool,detection.v_length);
end
