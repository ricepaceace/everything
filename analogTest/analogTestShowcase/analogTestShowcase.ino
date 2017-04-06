#define N_CH 2
#define N_BUTTON 4
#define TIME_SCALAR 2 // Each millisecond is 2 units of time, that way we can slow the signal down
#include <avr/pgmspace.h>


int outPins[N_CH] = {9, 10};
int buttonPins[N_BUTTON] = {4,5,6,7};

const byte ch1[] PROGMEM =  {
#include "NormalSinusRhythm_struct1.h"
};

const byte ch2[] PROGMEM =  {
#include "NormalSinusRhythm_struct2.h"
};
const byte* data[N_CH] = {ch1, ch2};
const int ch_len[N_CH] = {14926, 14926}; // TODO: Update this
int cindex[N_CH] = {0, 0};
/*
const byte ch3[] PROGMEM =  {
#include "rounded-ch3.h"
};
const byte ch4[] PROGMEM =  {
#include "rounded-ch4.h"
};
*/

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  for (int i = 0; i < N_CH; i++) {
    pinMode(outPins[i], OUTPUT);
  }
  
  for (int i = 0; i < N_BUTTON; i++) {
    pinMode(buttonPins[i], INPUT);
  }
  TCCR2B = TCCR2B & 0b11111000 | 0x01;
  TCCR1B = TCCR1B & 0b11111000 | 0x01;
}


unsigned long start, finish, elapsed;
int incomingVal;
int i = 0;

void loop() {
  start = micros();
  
  int pressedButton = -1;
  for (int i = 0; i < N_BUTTON; i++) {
    if (digitalRead(buttonPins[i])) {
      pressedButton = i;
    }
  }

  for (int ch = 0; ch < N_CH; ch++) {
    if (cindex[ch] / TIME_SCALAR == ch_len[ch]) {
      cindex[ch] = 0;
    }
    int incomingVal =  pgm_read_byte_near(data[ch] + (cindex[ch] / TIME_SCALAR));
    int increment = TIME_SCALAR;
    
    switch (pressedButton) {
      case -1: break;
      case 0: // flatline
        incomingVal = 0;
        break;
      case 1: // half signal
        incomingVal /= 2;
        break;
      case 2: // slow down heart
        increment = 1;
        break;
      case 3: // replace signal with noise
        incomingVal = micros() & 0xFF;
        break;
    }
    analogWrite(outPins[ch], incomingVal);
    cindex[ch] += increment;
    
  }
  
  finish = micros();
  elapsed = finish - start;
  delayMicroseconds(1000 - elapsed);
}


