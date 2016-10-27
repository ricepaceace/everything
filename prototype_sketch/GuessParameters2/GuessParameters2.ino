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

void GuessParameters2 { 
  short heartbeats = FindHeartRate();
  guessed_param.samplesHB = floor((sizeof(fht_input)/sizeof(short))/heartbeats);

  short v_cutoffs[] = {0, 0};
  v_cutoffs[1] = BinarySearch(fht_input, heartbeats+2, 1);
  v_cutoffs[2] = BinarySearch(fht_input, heartbeats-2, 0);
  
  guessed_param.vc = v_cutoffs[1] >> 1 + v_cutoffs[2] >> 1; //.5*v_cutoffs[1] + .5*v_cutoffs[2] 

  short ndata[];
  memcpy(ndata, fht_input, (sizeof(fht_input)/sizeof(short))); //copy array

  short t_blank = 30;
  short l_blank = 30;
  //CONTINUE HERE
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

