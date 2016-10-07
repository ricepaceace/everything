% main script for running detection algorithms on test data
addpath('test_data/sept29_2016_test/')

% each .mat file contains a struct for data from a test
% currently, each struct has two fields:
% sampling_rate: the sampling rate of the data in Hz
% data: a NxC matrix where each column represents a channel and each row
%       represents a time point

load('NormalSinusRhythm_struct.mat')
load('Pacingfromchipapprox120bpmxmA_struct.mat')
load('PacingfromMedtronic120bpm2mA_struct.mat')