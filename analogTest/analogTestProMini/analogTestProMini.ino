#define N_CH 4
#include <avr/pgmspace.h>


int outPins[] = {9, 10, 11, 12};

const byte ch1[] PROGMEM =  {
#include "rounded-ch6.h"
};

/*const byte ch2[] PROGMEM =  {
#include "rounded-ch2.h"
};
const byte ch3[] PROGMEM =  {
#include "rounded-ch3.h"
};
const byte ch4[] PROGMEM =  {
#include "rounded-ch4.h"
};
*/
const byte *ch2 = ch1;
const byte *ch3 = ch1;
const byte *ch4 = ch1;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  TCCR2B = TCCR2B & 0b11111000 | 0x01;
  TCCR1B = TCCR1B & 0b11111000 | 0x01;
}


unsigned long start, finish, elapsed;
int incomingVal;
int i = 0;

void loop() {
  /*for(incomingVal = 0; incomingVal < 255; incomingVal++){
    analogWrite(PWM_OUT, incomingVal);
    delay(1);
  }*/
  start = micros();
  // incomingVal = Serial.read();
  if (i == 14926){
    i = 0;
  }
 
  incomingVal = pgm_read_byte_near(&(ch1[i]));
   analogWrite(outPins[0], incomingVal);
   incomingVal = pgm_read_byte_near(&(ch2[i]));
   analogWrite(outPins[1], incomingVal);
   incomingVal = pgm_read_byte_near(&(ch3[i]));
   analogWrite(outPins[2], incomingVal);
   incomingVal = pgm_read_byte_near(&(ch4[i]));
   analogWrite(outPins[3], incomingVal);  
  i++;
 
  finish = micros();
  elapsed = finish - start;
  delayMicroseconds(1000 - elapsed);
}


