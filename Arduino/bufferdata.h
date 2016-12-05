#pragma once

#include "FlashStorage.h"

const PROGMEM short data[PARAM_LEARN_SIZE] = {};
volatile short* vdata = (volatile short *) data;
short bbuffer[BUFFER_SIZE];

  FlashClass flashData((const short*) vdata, PARAM_LEARN_SIZE * sizeof(short));

int i, j;
void prepareData(int pin)
{
	while(i < PARAM_LEARN_SIZE)
	{
		int samplesToRead = min(BUFFER_SIZE, PARAM_LEARN_SIZE - i);
		for (j = 0; j < samplesToRead; j++, i++) {
      unsigned long start = micros();
			bbuffer[j] = analogRead(pin);
      delayMicroseconds(1000 + start - micros());
		}
		flashData.write(&vdata[i], bbuffer, samplesToRead * sizeof(short));
	}
}


