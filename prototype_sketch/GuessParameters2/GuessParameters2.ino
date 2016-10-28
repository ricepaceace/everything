#include <FHT.h>
#include "data.h"

#define MIN_HEARTRATE 50 //BPM
#define MAX_HEARTRATE 150 //BPM

//need data to get inserted here as fht_input[]
short fht_lin_out[];

//Struct that holds vc, ac, and SamplesHB
struct guessed_param {
  short ac;
  short vc;
  short samplesHB;
}

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}

void GuessParameters2() { 
  short heartbeats = FindHeartRate();
  guessed_param.samplesHB = floor((sizeof(fht_input)/sizeof(short))/heartbeats);

  short v_cutoffs[] = {0, 0};
  v_cutoffs[0] = BinarySearch(fht_input, heartbeats+2, 1);
  v_cutoffs[1] = BinarySearch(fht_input, heartbeats-2, 0);
  
  guessed_param.vc = v_cutoffs[1] >> 1 + v_cutoffs[2] >> 1; //.5*v_cutoffs[1] + .5*v_cutoffs[2] 

  short ndata[];
  memcpy(ndata, fht_input, (sizeof(fht_input)/sizeof(short))); //copy array

  short t_blank = 30;
  short l_blank = 30;
  short rising_edges = CountPeaks(); //Change this line
  //    rising_edges = find(rising_edges);
  //  falling_edges = find(falling_edges);
  //  for i = 1:length(rising_edges)
  //      ndata((rising_edges(i)-t_blank):(falling_edges(i)+l_blank)) = 0;
  //  end

  short a_cutoffs[] = {0, 0};
  a_cutoffs[0] = BinarySearch(ndata, heartbeats+2, 1);
  a_cutoffs[1] = BinarySearch(ndata, heartbeats-2, 0);
  guessed_param.ac = .7*a_cutoffs[0] + .3*a_cutoffs[1];
  return;
}

short BinarySearch(short data, short expected, short hh) {
  short low = min(data);
  short high = max(data);
  short mid;
  short count;
  //Assuming 10 s of data
  bool above_th[10000];
  
  for(short i = 0; i <= 9; i++){
    mid = (low+high) >> 1; //(Low + High) / 2
    for(short i = 0; i < (sizeof(fht_input)/sizeof(short)); i++) {
      if (fht_input > mid){
        above_th[i] = true;
      } else {
        above_th[i] = false;
      }
    }
    count = CountPeaks(); //NEED TO CHANGE THIS LINE

    if(count > expected) || ((count == expected) && (hh == 0)){
      low = mid;
    } else if (count < expected) || ((count == expected) && (hh == 1)) {
      high = mid;
      continue;
    }
  }
  return mid;
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
const short filter[] = {3480, 3481, 3482, 3483, 3484, 3485, 3486, 3486, 3486, 3487, 3487, 
  3487, 3486, 3486, 3486, 3485, 3484, 3483, 3482, 3481, 3480};
// th_data: 1 if data[i] > current threshold
// fills in edges[i] with a 1 if i is a rising edge, 2 if i is a falling edge 
// all arrays should be allocated and of size length
// TODO: really we want to return the indices of the peaks, which is less data, but is variable sized
short CountPeaks(bool* th_data, char* edges, short length_data)
{
  for(short i = 0; i < length_data; i++)
  {
    short acc = 0;
    // Definitely need to break if we exceed the cutoff or we risk overflowing
    for(short j = 0; j < FILTER_LENGTH && i-j >= 0 && acc < TH_CUTOFF; j++)
    {
      acc += filter[j] * th_data[i-j];
    }
    // Temporarily store in falling_edges so we don't need more RAM
    edges[i] = acc >= TH_CUTOFF;
  }
  for(short i = 0; i < length_data; i++)
  {
    th_data[i] = edges[i];
    edges[i] = 0;
  }
  bool high = false;
  short rising_count = 0;
  short last_rising_index = 0;
  for(short i = 0; i < length_data; i++)
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
    rising_count += (length_data - last_rising_index)/SAMPLES_PER_ADDTL_HEARTBEAT;
    high = false;
  }
  return rising_count;
}


short FindHeartRate() {
  //Explanation of function goes here
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
}

