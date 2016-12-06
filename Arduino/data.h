#pragma once
#ifndef NO_ARDUINO
	#include <avr/pgmspace.h>
#endif


/*const short data[] PROGMEM = {
#include "good-ch1.h"
};*/
const short data[4][10000] PROGMEM = {
  {
    #include "good-ch2.h"
  },
    {
    #include "good-ch3.h"
  },
    {
    #include "good-ch4.h"
  },
    {
    #include "good-ch4.h"
  }
};

void prepareData(int pin)
{
}
