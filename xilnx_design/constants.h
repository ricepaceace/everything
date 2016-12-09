#pragma once
#define V_LENGTH 11
#define A_LENGTH 30
#define AV_DELAY_THRESH 900
#define AA_DELAY_THRESH 1000
#define POSTVARP 250
#define PREVARP 20

#define N_CHANNELS 4

// Constants used for CountPeaks:
// Used to punish when the threshold is too low so large blocks of the data are above the threshold
// This is sample-rate dependent. It was 150 in the Matlab code, but dividing by 128 can be done with
// a bitshift instead of a division
#define SAMPLES_PER_ADDTL_HEARTBEAT 128
// over 1/inverse_filter_threshold samples in min_length need to be high for it to count as a peak
#define INVERSE_FILTER_THRESHOLD 4

#define L_BLANK 50 // number of samples to blank leading the heartbeat
#define T_BLANK 50 // number of samples to blank trailing the heartbeat

// Constants used for BinarySearch
// Number of points to use in each round of flat finding
#define N_BS_PTS 12
// Max number of rounds of recursive flat finding to do
#define NUM_RECURSIVE_SUBDIV 3
#define SAMPLE_RATE 1000
#define MIN_HEARTRATE 10
#define MAX_HEARTRATE 150
#define PARAM_LEARN_SIZE SAMPLE_RATE*10
#define MINHEARTRATE_DIV_SAMPLRATE_60 6000 //Defined as SampleRate*60/MinHeartRate
#define MAXHEARTRATE_DIV_SAMPLERATE_60 400 //Defined as SampleRate*60/MaxHeartRate

#define MAX_EDGES ((PARAM_LEARN_SIZE * 3) / MAXHEARTRATE_DIV_SAMPLERATE_60) // The we expect two rising, falling edges per beat, but the 3 gives us padding

#define BUFFER_SIZE 128

//The above two constants are used to help the binary search find minimum and maximum heart rates that thresholding can return.

#define NUM_PARAMS 4
#define LEN_ALLDATA 10000
#define NUM_CHANNELS 3


#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((a) > (b) ? (a) : (b))
#define abs(x) ((x) < 0 ? -(x) : x)

