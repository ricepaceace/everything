#pragma once
#ifndef NO_ARDUINO
	#include <avr/pgmspace.h>
#endif

const short data[] PROGMEM = {
#include "good-ch1.h"
};

void prepareData(int pin)
{
}
