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

