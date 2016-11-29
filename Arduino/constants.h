#define V_LENGTH 11
#define A_LENGTH 30
#define AV_DELAY_THRESH 200
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
