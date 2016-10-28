#include "data.h"

static short v_thresh;
static short a_thresh;
static short v_length;
static short a_length;
static short num_v;
static short num_a;

void setup() {
  // TODO : iniitalize above variables

}

void loop() {
  // put your main code here, to run repeatedly:

}

char one_chamber_peak_finder(short data)
{
  if(data > v_thresh)
  {
    num_a = 0;
    return ((++num_v == v_length) ? 'v' : 0);
  }
  else if (data > a_thresh)
  {
    num_v = 0;
    return ((++num_a == a_length) ? 'a' : 0);

  }
  else
  {
    num_v = 0;
    num_a = 0;
    return 0;
  } 
}
#define RISING_EDGE 1
#define FALLING_EDGE 2

#define FILTER_LENGTH 21
// TH_CUTOFF was .005 in Matlab (chose mostly arbitrarily), but the filter coefficients are scaled by 2^20
#define TH_CUTOFF 5243

// Used to punish when the threshold is too low so large blocks of the data are above the threshold
// This is sample-rate dependent. It was 150 in the Matlab code, but dividing by 128 can be done with
// a bitshift instead of a division
#define SAMPLES_PER_ADDTL_HEARTBEAT 128

// TODO: Optimize coefficients for integers and different sampling rate
const int filter[] = {3480, 3481, 3482, 3483, 3484, 3485, 3486, 3486, 3486, 3487, 3487, 
	3487, 3486, 3486, 3486, 3485, 3484, 3483, 3482, 3481, 3480};
// th_data: 1 if data[i] > current threshold
// fills in edges[i] with a 1 if i is a rising edge, 2 if i is a falling edge 
// all arrays should be allocated and of size length
// TODO: really we want to return the indices of the peaks, which is less data, but is variable sized
int countPeaks(bool* th_data, char* edges, int length)
{
	for(int i = 0; i < length; i++)
	{
		int acc = 0;
		// Definitely need to break if we exceed the cutoff or we risk overflowing
		for(int j = 0; j < FILTER_LENGTH && i-j >= 0 && acc < TH_CUTOFF; j++)
		{
			acc += filter[j] * th_data[i-j];
		}
		// Temporarily store in falling_edges so we don't need more RAM
		edges[i] = acc >= TH_CUTOFF;
	}
	for(int i = 0; i < length; i++)
	{
		th_data[i] = edges[i];
		edges[i] = 0;
	}
	bool high = false;
	int rising_count = 0;
	int last_rising_index = 0;
	for(int i = 0; i < length; i++)
	{
		if (th_data[i] && !high)
		{
			rising_count++;
			last_rising_index = i;
			high = true;
			edges[i] = RISING_EDGE;
		}
		else if (!th_data[i] && high)
		{
			high = false;
			rising_count += (i - last_rising_index)/SAMPLES_PER_ADDTL_HEARTBEAT;
			edges[i] = FALLING_EDGE;
		}
	}
	// Handle the case where the data ends while high:
	if (high)
	{
		rising_count += (length - last_rising_index)/SAMPLES_PER_ADDTL_HEARTBEAT;
		high = false;
	}
	return rising_count;
}

