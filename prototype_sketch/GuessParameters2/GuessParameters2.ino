#define PARAM_LEARN_SIZE 8192 //The number of points to use in parameter learning


#define SAMPLE_RATE 1000
#define MIN_HEARTRATE 50 //BPM
#define MAX_HEARTRATE 150 //BPM

// The we expect two rising, falling edges per beat, but the 3 gives us padding
#define MAX_EDGES (PARAM_LEARN_SIZE * 3 * MAX_HEARTRATE) / (SAMPLE_RATE * 60)

#if FFT
	#define FHT_N PARAM_LEARN_SIZE

	#include <FHT.h>
	//need data to get inserted here as fht_input[]
	short fht_lin_out[NHT_N/2];
#endif

#include "data.h"

short ldata[PARAM_LEARN_SIZE];
bool thresholded[PARAM_LEARN_SIZE];
short rising_edges[MAX_EDGES];
short falling_edges[MAX_EDGES];
short FindHeartRate();
short BinarySearch(short* data, short len, short expected, short hh);
short CountPeaks(bool* th_data, short* rising_edges, short* falling_edges, short length_data, short max_edges);
void GuessParameters2();

//Struct that holds vc, ac, and SamplesHB
struct  {
  short ac;
  short vc;
  short samplesHB;
} guessed_param;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

void loop() {
  Serial.println("Starting");
  digitalWrite(13, HIGH);
  GuessParameters2();
  digitalWrite(13, LOW);
  Serial.println(guessed_param.ac);
  Serial.println(guessed_param.vc);
}

void GuessParameters2() { 
  for (int i = 0; i < PARAM_LEARN_SIZE; i++) {
    ldata[i] = pgm_read_word_near(data + i);
  }
  
  short heartbeats = FindHeartRate();
  guessed_param.samplesHB = PARAM_LEARN_SIZE/heartbeats;

  short v_cutoffs[] = {0, 0};
  v_cutoffs[0] = BinarySearch(ldata, PARAM_LEARN_SIZE, heartbeats+2, 1);
  v_cutoffs[1] = BinarySearch(ldata, PARAM_LEARN_SIZE, heartbeats-2, 0);
  
  guessed_param.vc = v_cutoffs[1] >> 1 + v_cutoffs[2] >> 1; //.5*v_cutoffs[1] + .5*v_cutoffs[2] 


  short t_blank = 30;
  short l_blank = 30;

  for (short i = 0; i < PARAM_LEARN_SIZE; i++)
  	thresholded[i] = ldata[i] > guessed_param.vc;

  short n_edges = CountPeaks(thresholded, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES);
  for (short peak = 0; peak < n_edges && rising_edges[peak] != -1; peak++)
  {
  	short start_idx = max(rising_edges[peak] - t_blank, 0);
	  short end_idx = min(falling_edges[peak] + l_blank, PARAM_LEARN_SIZE - 1);
	  for (short j = start_idx; j < end_idx; j++)
		  ldata[j] = 0;
  }

  short a_cutoffs[] = {0, 0};
  a_cutoffs[0] = BinarySearch(ldata, PARAM_LEARN_SIZE, heartbeats+2, 1);
  a_cutoffs[1] = BinarySearch(ldata, PARAM_LEARN_SIZE, heartbeats-2, 0);
  guessed_param.ac = (7*a_cutoffs[0] + 3*a_cutoffs[1])/10;
  return;
}
// above_th is basically scratch memory used by this function
// both data and above_th should be of the specified length 
short BinarySearch(short* data, short len, short expected, short hh) {
	bool* above_th = thresholded;	
	short low = 0;
	short high = 0;

	for (int i = 0; i < len; i++)
	{
		low = min(low, data[i]);
		high = max(high, data[i]);
	}


  short mid;
  short count;
  
  for(short j = 0; j <= 9; j++){
    mid = (low+high) >> 1; //(Low + High) / 2
    for(short i = 0; i < len; i++) {
      if (data[i] > mid){
        above_th[i] = true;
      } else {
        above_th[i] = false;
      }
    }
    count = CountPeaks(above_th, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES); 

    if((count > expected) || ((count == expected) && (hh == 0))){
      low = mid;
    } else if ((count < expected) || ((count == expected) && (hh == 1))) {
      high = mid;
      continue;
    }
  }
  return mid;
}

#define RISING_EDGE 1
#define FALLING_EDGE 2

#define FILTER_LENGTH 21
// TH_CUTOFF was .005 in Matlab (chosen mostly arbitrarily), but the filter coefficients are scaled by 2^20
#define TH_CUTOFF 5243

// Used to punish when the threshold is too low so large blocks of the data are above the threshold
// This is sample-rate dependent. It was 150 in the Matlab code, but dividing by 128 can be done with
// a bitshift instead of a division
#define SAMPLES_PER_ADDTL_HEARTBEAT 128

// TODO: Optimize coefficients for integers and different sampling rate
const short filter[] = {3480, 3481, 3482, 3483, 3484, 3485, 3486, 3486, 3486, 3487, 3487, 
  3487, 3486, 3486, 3486, 3485, 3484, 3483, 3482, 3481, 3480};
// th_data: 1 if data[i] > current threshold
// fills in rising_edges and falling_edges with the indices of the edge
// The same number of elements should be set in both arrays, and it should be the value that is returned unless there are some peaks that are way too big.
// Unset elements will have value -1.
// all arrays should be allocated and of size length
short CountPeaks(bool* th_data, short* rising_edges, short* falling_edges, short length_data, short max_edges)
{
  for(short i = 0; i < length_data; i++)
  {
    short acc = 0;
    // Definitely need to break if we exceed the cutoff or we risk overflowing
    for(short j = 0; j < FILTER_LENGTH && i-j >= 0 && acc < TH_CUTOFF; j++)
    {
	  if (th_data[i-j] & 1)
		  acc += filter[j] * th_data[i-j];
    }
    // Temporarily store in higher bits of th_data so we don't need more RAM
    th_data[i] |= (acc >= TH_CUTOFF) << 1;
  }
  for(short i = 0; i < length_data; i++)
  {
    th_data[i] >>= 1; // Now move that higher bit back to bit 0
  }
  bool high = false;
  short rising_count = 0;
  short last_rising_index = 0;

	short ri = 0, fi = 0; // current positions in rising and falling edges arrays
	for (short i = 0; i < max_edges; i++)
	{
		rising_edges[i] = falling_edges[i] = -1;
	}

	for(short i = 0; i < length_data; i++)
	{
		if (th_data[i] && !high)
		{
			rising_count++;
			last_rising_index = i;
			high = true;

			if (ri < max_edges) 
			{
				rising_edges[ri++] = i;
			}
		}
		else if (!th_data[i] && high)
		{
			high = false;
			rising_count += (i - last_rising_index)/SAMPLES_PER_ADDTL_HEARTBEAT;
			
			if (fi < max_edges)
				falling_edges[fi++] = i;
		}
	}
	// Handle the case where the data ends while high:
	if (high)
	{
		rising_count += (length_data - last_rising_index)/SAMPLES_PER_ADDTL_HEARTBEAT;
		high = false;
		falling_edges[fi] = length_data - 1;
	}
	return rising_count;
}

// Returns the expected number of beats in data
short FindHeartRate() {
#if FFT
	short sample_rate = 1000;
	//Use FHT library. Assumes the data points are in SRAM and the final output is kept in fht_input[], 
	//with the 0 -> N/2 bins having the sum of the real and imaginary components, 
	//and the N/2 -> N having the difference between the real and imaginary components. 
	//these two parts need to be squared and summed to get the overall magnitude at a particular frequency. 
	//as a result, you will have to run one of the magnitude functions to get useful data from these bins.
	fht_run();
	//This gives the magnitude of each bin in the FHT. It sums the squares of the imaginary and real, 
	//and then takes the square root. It uses a lookup table to calculate the square root, so it has limited precision. 
	//You can think of it as an 8b value times a 4b exponent. It covers the full 16b range, 
	//but only has 8b of precision at any point in that range. The data is taken in from fht_input[] and returned in fht_lin_out[]. 
	//The values are in sequential order, and there are only N/2 values total, as the FHT returns redundant data.
	fht_mag_lin();
	short data_length = sizeof(fht_input) / sizeof(short);
	short rescale = data_length / (sample_rate * 60);
	short min_idx = MIN_HEARTRATE * rescale;
	short max_idx = MAX_HEARTRATE * rescale;

	//Find index of max value of heartbeat data
	short hr_idx = 0;
	short hr_val = fht_lin_out[hr_idx];
	for (i = 0; i < (sizeof(fht_lin_out) / sizeof(short)); ++i)
	{
		if (fht_lin_out[i] > hr_val)
		{
			hr_val = fht_lin_out[i];
			hr_idx = i;
		}
	}
	hr_idx = hr_idx - 1 + min_idx;
	short heartbeats = hr_idx;
	return heartbeats;
#else
	const int HARDCODED_BPM = 100;
	return PARAM_LEARN_SIZE * HARDCODED_BPM / (60* SAMPLE_RATE );
#endif

}

