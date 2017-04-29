#pragma once
#ifndef NO_ARDUINO
	#include <avr/pgmspace.h>
#endif

#define NUM_CHANNELS 1

/*const short data[] PROGMEM = {
#include "good-ch1.h"
};*/
const short data[NUM_CHANNELS][10000] PROGMEM = {
  {
    #include "testdata.h.txt"
  }/*,
    {
    #include "testdata.h.txt"
  },
    {
    #include "testdata.h.txt"
  },
    {
    #include "testdata.h.txt"
  }*/
};

void prepareData(int pin)
{
}
