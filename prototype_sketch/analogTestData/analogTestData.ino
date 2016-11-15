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

#define PWM_OUT 4 //use this pin for PWM out

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.print("Program has started");
  int start = millis();
  int mapped_val;
  for (int i=0; i < (sizeof(data)/sizeof(short)); i++){
    mapped_val = map(data[i], min_point, max_point, 0, 255);
    analogWrite(PWM_OUT, mapped_val);
    int finish = millis();
    int elapsed = finish - start;
    Serial.println(elapsed);
    Serial.println(" milliseconds elapsed");
  }
}


