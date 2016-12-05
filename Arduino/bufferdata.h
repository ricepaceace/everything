#pragma once

#include "FlashStorage.h"

const PROGMEM short data[PARAM_LEARN_SIZE] = {};
short buffer[BUFFER_SIZE];

  FlashClass flashData((const short*) data, PARAM_LEARN_SIZE * sizeof(short));

int i, j;
void prepareData(int pin)
{
	while(i < PARAM_LEARN_SIZE)
	{
		int samplesToRead = min(BUFFER_SIZE, PARAM_LEARN_SIZE - i);
		for (j = 0; j < samplesToRead; j++, i++) {
      unsigned long start = micros();
			buffer[j] = analogRead(pin) - 300;
      delayMicroseconds(1000 + start - micros());
		}
		flashData.write(&data[i], buffer, samplesToRead * sizeof(short));
		Serial.print("Wrote ");
		Serial.print(samplesToRead);
		Serial.println(" samples to flash.");
	}
	Serial.println("Done writing to flash");
}


