#pragma once
/*
%Inputs:
%detection - struct representing the preset/learned detection paramters
%   .v_thresh - magnitude threshold for ventricular beats
%   .v_length - min_length of a ventricular beat (in samples)
%   .a_thresh - magnitude threshold for atrial beats
%   .a_length - min_length of an atrial beat (in samples)
%data - vector data from a single channel

%Outputs
%v_indices - vector containing the indices of all the ventricular beats
%a_indices - vector containing the indices of all the atrial beats
*/

#include "detections.h"
#include "constants.h"

//Need to import function countpeaks

void one_chamber_peak_finder(struct detection, short data[]){
  bool v_bool[(sizeof(data)/sizeof(short))];
  for (i = 0; i < (sizeof(data)/sizeof(short)); i++) {
    if ((detection.vflip * data[i]) > detection.v_thresh){
      v_bool[i] = true; 
    }
    else {
      v_bool[i] = false;
    }
  }
  //Count Peaks needs to be added, returns v_indices_r and v_indices_f
  CountPeaks(bool v_bool[], short detection.v_length);

  short t_blank = 50;
  short l_blank = 50;

   //need to also have v_indices_r and v_indices_f
   for (i = 0; (sizeof(v_indices_r)/sizeof(short)); i++) {
    for (j = (v_indices_r[i]-t_blank); j < (v_indices_f[i]+l_blank); j++){
      data[j] = 0;
    }
   }

   //v_indices = v_indices_r in original matlab. Avoid copying arrays
   //instead just modify on v_indices_r

  bool a_bool[(sizeof(data)/sizeof(short))];
  for (i = 0; i < (sizeof(data)/sizeof(short)); i++) {
    if ((detection.aflip * data[i]) > detection.a_thresh){
      a_bool[i] = true; 
    }
    else {
      a_bool[i] = false;
    }
  }
  //Returns a_indices
  CountPeaks(a_bool, detection.a_length); //Line needs to be looked over 
}

//Original Matlab Code
/*
function [v_indices, a_indices] = one_chamber_peak_finder(detection,data)
v_bool = detection.vflip*data>detection.v_thresh;
[~,v_indices_r, v_indices_f] = CountPeaks(v_bool,detection.v_length);

t_blank = 50;
l_blank = 50;
%data = abs(data);
for i = 1:length(v_indices_r)
    data((v_indices_r(i)-t_blank):(v_indices_f(i)+l_blank)) = 0;
end

v_indices = v_indices_r;

a_bool = detection.aflip*data>detection.a_thresh;
[~,a_indices,~] = CountPeaks(a_bool,detection.a_length);
*/
