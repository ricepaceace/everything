#include "data.h"


short find_min(short data_array[]){
  short minimum = 0;
  for (int i=0; i < (sizeof(data_array)/sizeof(short)); i++){
    if (data_array[i] < minimum) {
      minimum = data_array[i];
    }
  }
  return minimum;
}

short find_max(short data_array[]){
  short maximum = 0;
  for (int i=0; i < (sizeof(data_array)/sizeof(short)); i++){
    if (data_array[i] > maximum) {
      maximum = data_array[i];
    }
  }
  return maximum;
}

short min_point = find_min(data);
short max_point = find_max(data);
int mapped_val;

#define PWM_OUT 4 //use this pin for PWM out

void setup() {
  // put your setup code here, to run once:
  //Serial.begin(9600);
  //Serial.println("Setup started");
}

void loop() {
  // put your main code here, to run repeatedly:
  //Serial.println("Program has started");
  for (int i=0; i < (sizeof(data)/sizeof(short)); i++){
    int start = micros();
    mapped_val = map(data[i], min_point, max_point, 0, 255);
    Serial.println(mapped_val);
    analogWrite(PWM_OUT, mapped_val);
    int finish = micros();
    int elapsed = finish - start;
    delayMicroseconds(1000 - elapsed);
  }
}


