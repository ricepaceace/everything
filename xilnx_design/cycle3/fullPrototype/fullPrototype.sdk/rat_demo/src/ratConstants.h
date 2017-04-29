#ifndef CONSTANTS
#define CONSTANTS

//General Rate Parameters
#define BASE_SAMPLE_RATE 1000
#define SAMPLE_RATE_SCALE 2		//currently multiplies the base sampling rate
#define INPUT_TIME_SCALE 8		//input signal is this many times faster than 60bpm
#define SAMPLE_RATE (BASE_SAMPLE_RATE*SAMPLE_RATE_SCALE)
#define TIME_SCALE (INPUT_TIME_SCALE/SAMPLE_RATE_SCALE)

//Bounds for length calculations; these four may or may not need to be scaled
#define V_LENGTH_BASE (8*SAMPLE_RATE_SCALE)
#define A_LENGTH_BASE (26*SAMPLE_RATE_SCALE)
#define V_LENGTH_MAX (30*SAMPLE_RATE_SCALE)
#define A_LENGTH_MAX (100*SAMPLE_RATE_SCALE)

#define AV_DELAY_THRESH (250/TIME_SCALE)
#define AA_DELAY_THRESH (1000/TIME_SCALE)
#define POSTVARP (250/TIME_SCALE)
#define PREVARP (20/TIME_SCALE)
#define SAMPLES_PER_ADDTL_HEARTBEAT (128/TIME_SCALE)
#define INVERSE_FILTER_THRESHOLD 4

#define L_BLANK (50/TIME_SCALE) // number of samples to blank leading the heartbeat
#define T_BLANK (50/TIME_SCALE) // number of samples to blank trailing the heartbeat

#define N_BS_PTS 12
#define NUM_RECURSIVE_SUBDIV 3
#define MIN_HEARTRATE (10*TIME_SCALE)
#define MAX_HEARTRATE (150*TIME_SCALE)
#define PARAM_LEARN_SIZE (SAMPLE_RATE*10)
#define MINHEARTRATE_DIV_SAMPLRATE60 (SAMPLE_RATE*60/MIN_HEARTRATE) //Defined as SampleRate*60/MinHeartRate
#define MAXHEARTRATE_DIV_SAMPLERATE60 (SAMPLE_RATE*60/MAX_HEARTRATE) //Defined as SampleRate*60/MaxHeartRate

#define MAX_EDGES (PARAM_LEARN_SIZE * 3) /MAXHEARTRATE_DIV_SAMPLERATE60

#define BUFFER_SIZE 128

#define NUM_PARAMS 4

#define IS_A 0xF000
#define IS_V 0x00F0
#define A_ST 0x0F00
#define V_ST 0X000F

#define MAX_EXTREMA (MAX_EDGES * 2)
#define EXTREME_OVER 100

#define VENTRICLE_STIM_GPIO 0x0008
#define ATRIAL_STIM_GPIO 0x0080

// Useful Macros
#define SIGN(x) ((x < 0) ? -1 : (x > 0))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define ABS(x) ((x) < 0 ? -(x) : x)

#endif /*CONSTANTS*/
