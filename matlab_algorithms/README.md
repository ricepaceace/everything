# multisite_test_detection_algorithms
Matlab algorithms that run on test multisite data and figure out optimal detection strategy. 
test_data folder contains all of our test data (original files and our created .mat files), organized by its source. 
multisite_detect.m is the Matlab script to run - it loads data and calls helper functions
GuessParameters2.m learns parameters for detecting beats in the data
one_chamber_peak_finder.m uses parameters to locate all the beats in a waveform

