#pragma once
#include "constants.h"
#include "guessparameters.h"
#include "yamPeakFinder.h"
#define NUM_CHANNELS 3

#include "data.h"

#ifdef NO_ARDUINO
int analogPins[NUM_CHANNELS] = {0};
#else
int analogPins[NUM_CHANNELS] = { A1, A2, A3};
#endif
short samples[NUM_CHANNELS];

unsigned long startSample, endSample,elapsedTime;

int missedSamples = 0;

#define VENT 1
#define ATRIAL 2


#define STATUS_PRINT(x) do { \
	Serial.print("t="); \
	Serial.print(sampleId); \
	Serial.print(" ch="); \
	Serial.print(i); \
	Serial.print(": "); \
	Serial.println(x); \
}while(0)

//#define STATUS_PRINT(x)

int multisiteDecision(void)
{
	detections detects[NUM_CHANNELS];
	int i, j;
	for(i = 0;i < NUM_CHANNELS; i++)
	{
		prepareData(analogPins[i]);

		params lp = GuessParameters2(data[i]);
		detects[i].v_thresh = lp.v_thresh;
		detects[i].a_thresh= lp.a_thresh;
		detects[i].aflip = lp.a_flip;
		detects[i].vflip = lp.v_flip;
   /*
   detects[i].v_thresh = 161;
   detects[i].a_thresh = 72;
   detects[i].aflip = 1;
   detects[i].vflip = -1;
   */
		detects[i].AbeatDelay = 0;
		detects[i].VbeatDelay = 0;
		detects[i].VbeatFallDelay = 0;
		detects[i].AstimDelay = 0;
		detects[i].VstimDelay = 0;
		detects[i].ACaptureThresh = A_LENGTH;
		detects[i].VCaptureThresh = V_LENGTH;
		detects[i].last_sample_is_V = 0;
		detects[i].last_sample_is_A = 0;

		Serial.println();
		Serial.println();
		Serial.println();
    Serial.println("Ventricle Threshold");
    Serial.println(detects[i].v_thresh);
    Serial.println("Atrial Threshold");
    Serial.println(detects[i].a_thresh);
    Serial.print("a flip: ");
    Serial.print((int) detects[i].aflip);
    Serial.print(", v flip: ");
    Serial.println((int) detects[i].vflip);
	}

	/* MAIN LOOP */
#ifdef ANALOG
	while(1)
#else
		for(int si = 0; si < LEN_ALLDATA; si++)
#endif
	{
		unsigned long sampleId;
#ifdef ANALOG
       startSample = micros();
		sampleId = millis();
#else
		sampleId = si;
#endif
    for(i = 0; i < NUM_CHANNELS;i++)
    {
              short next_sample;
#ifdef ANALOG
      next_sample = analogRead(analogPins[i])-256; 
     //Serial.println(next_sample);
#else
      next_sample = pgm_read_word_near(data[i] + si);
#endif
      samples[i] = next_sample;
    }
		for(i = 0; i < NUM_CHANNELS;i++)
		{
			detects[i].recentdatapoints.push(samples[i]);
		
			detects[i].AbeatDelay++;
		  detects[i].VbeatDelay++;
			detects[i].VbeatFallDelay++;
			detects[i].AstimDelay++;
			detects[i].VstimDelay++;

			yamPeakFinder(&detects[i]);
			if (detects[i].VbeatDelay == 0 && detects[i].last_sample_is_V)
				STATUS_PRINT("Found V beat");
        
			if (detects[i].AbeatDelay == 0 && detects[i].last_sample_is_A)
				STATUS_PRINT("Found A beat");

		}
		for(i = 0; i < NUM_CHANNELS; i++)
		{
			if (detects[i].AbeatDelay > AA_DELAY_THRESH && detects[i].AstimDelay > detects[i].ACaptureThresh)
			{
				if (detects[i].AstimDelay == detects[i].ACaptureThresh+1)
				{
					//TODO: Increse Atrial Stimulation voltage
					//STATUS_PRINT("Increasing atrial stimulation voltage");
				}
				//STATUS_PRINT("Stimulating atria");
				//TODO: Stimulate atria here
				for(j = 0; j< NUM_CHANNELS; j++)
				{
				    detects[j].AstimDelay = 0;
				}
				break;
			}
		}

		for(i = 0; i < NUM_CHANNELS; i++)
		{
			if (detects[i].VbeatDelay > detects[i].AbeatDelay && detects[i].AbeatDelay > AV_DELAY_THRESH && detects[i].VstimDelay > detects[i].VCaptureThresh)
			{
				if (detects[i].VstimDelay == detects[i].VCaptureThresh+1)
				{
					//STATUS_PRINT("Increasing ventricular stimulation voltage");
					//TODO: increase ventricular stim voltage
				}
				//STATUS_PRINT("Stimulating ventricle");
				//TODO: Stimulate Ventricle here
				for(j = 0; j < NUM_CHANNELS; j++)
				{
					detects[j].VstimDelay = 0;
				}
				break;
			 }
		}
   #ifdef ANALOG
  endSample = micros();
  elapsedTime = endSample - startSample;
  if(elapsedTime < 1000)
	  delayMicroseconds(1000-elapsedTime);
  else {
	  missedSamples++;
	  if ((missedSamples & 0xFF) == 0xFF) {
		  Serial.print("Missed samples: ");
		  Serial.println(missedSamples);
	  }
  }
     #endif
	}

	return 0;
}

