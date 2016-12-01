#include "arduinocompat.h"



#include "data.h"
#include "constants.h"
#include "detections.h"

#include "guessparameters.h"
#include "multisiteDecision.h"



void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  Serial.println("STart Pls");
}
bool runn = true;
void loop() {
  if (runn) {


    multisiteDecision();
    
    /*
    //Serial.println("Starting");
    digitalWrite(13, HIGH);
    GuessParameters2();
    digitalWrite(13, LOW);
    Serial.println(guessed_param.ac);
    Serial.println(guessed_param.vc);

    for (int i = 0; i < 60000; i++) {
      short val = pgm_read_word_near(data + i);
      char c = one_chamber_peak_finder(val);
      if (c != 0) {
        Serial.print(i);
        Serial.print(" ");
        Serial.println(c);
        }
        */
    
      
    
    Serial.println("AYYY LMAO");
  }
  runn = false;
}










