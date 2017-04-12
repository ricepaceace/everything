#define N_CH 3
#define N_BUTTON 4

#define TIME_SCALAR 2 // Each millisecond is 2 units of time, that way we can slow the signal down
#include <avr/pgmspace.h>

#ifndef MEGA
int outPins[N_CH] = {9, 10, 11};
int buttonPins[N_BUTTON] = {4,5,6,7};
int buzzerPin = 3;
#else
int outPins[N_CH] = {9, 10, 11};
int buttonPins[N_BUTTON] = { 22, 24, 26, 28};
int buzzerPin = 8;
#endif

const byte ch1[] PROGMEM =  {
#include "NormalSinusRhythm_struct1.h"
};

const byte ch2[] PROGMEM =  {
#include "NormalSinusRhythm_struct2.h"
};
const byte* data[N_CH] = {ch1, ch2, ch2};
const int ch_len[N_CH] = {14317, 14317, 14317}; 
int cindex[N_CH] = {0, 0, 0};
boolean zeroed[N_CH] = {false, false, false};
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
  for (int i = 0; i < N_CH; i++) {
    pinMode(outPins[i], OUTPUT);
  }
  
  for (int i = 0; i < N_BUTTON; i++) {
    pinMode(buttonPins[i], INPUT_PULLUP);
  }
  TCCR2B = TCCR2B & 0b11111000 | 0x01;
  TCCR1B = TCCR1B & 0b11111000 | 0x01;
  #ifndef MEGA
  
#endif

#ifdef MEGA
  Serial.begin(250000);
  #endif
}


unsigned long start, finish, elapsed;
int incomingVal;
int i = 0;

void loop() {
  start = micros();

  analogWrite(buzzerPin, millis() & 0xFF);
  
  for (int i = 1; i < (1+N_CH); i++) {
    // Using INPUT_PULLUP, so when low, button was pressed
    zeroed[i-1] = digitalRead(buttonPins[i]) ? false : true;
  }
  if (!digitalRead(buttonPins[0])) {
    for (int ch = 0; ch < N_CH; ch++) {
      zeroed[ch] = true;
    }
  }
 
  /*if (pressedButton == 0) // flatline
    analogWrite(buzzerPin, 128);
  else
    analogWrite(buzzerPin, 0);
    */

  for (int ch = 0; ch < N_CH; ch++) {
    if (cindex[ch] / TIME_SCALAR == ch_len[ch]) {
      cindex[ch] = 0;
    }
    int incomingVal =  pgm_read_byte_near(data[ch] + (cindex[ch] / TIME_SCALAR));
    int increment = TIME_SCALAR;
    
    /*switch (pressedButton) {
      case -1: break;
      case 0: // flatline
        incomingVal = 128;
        break;
      case 1: // half signal
        incomingVal = (incomingVal - 128)/3 + 128;
        break;
      case 2: // slow down heart
        increment = 1;
        break;
      case 3: // replace signal with noise
        incomingVal = micros() & 0xFF;
        break;
    }
    #ifdef MEGA
    Serial.println(pressedButton);
    #endif
    //if (ch == 0)
    //  Serial.println(incomingVal); */
    if (zeroed[ch])
      analogWrite(outPins[ch], 128);
    else
      analogWrite(outPins[ch], incomingVal);
    cindex[ch] += increment;
    
  }
  
  finish = micros();
  elapsed = finish - start;
  delayMicroseconds(1000 - elapsed);
}


