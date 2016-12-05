#define PWM_OUT 9 //use this pin for PWM out
#include <avr/pgmspace.h>

const byte data[] PROGMEM =  {
#include "rounded-ch1.h"
};

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  TCCR2B = TCCR2B & 0b11111000 | 0x01;
}


int start;
int finish;
int elapsed;
int incomingVal;
int i = 0;

void loop() {
  /*for(incomingVal = 0; incomingVal < 255; incomingVal++){
    analogWrite(PWM_OUT, incomingVal);
    delay(1);
  }*/
  start = micros();
  // incomingVal = Serial.read();
  if (i < 30000)
    incomingVal = pgm_read_byte_near(&(data[i++]));
  else
    incomingVal = 0;
  Serial.println(incomingVal);
  analogWrite(PWM_OUT, incomingVal);
  finish = micros();
  elapsed = finish - start;
  delayMicroseconds(1000 - elapsed);
}


