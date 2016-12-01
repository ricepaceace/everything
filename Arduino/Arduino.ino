#define PARAM_LEARN_SIZE 8192 //The number of points to use in parameter learning


#include "arduinocompat.h"



#include "data.h"
#include "constants.h"
#include "detections.h"

#include "guessparameters.h"


char one_chamber_peak_finder(short data);



void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(13, OUTPUT);
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
    
      
    }
    Serial.println("AYYY LMAO");
  }
  runn = false;
}


char one_chamber_peak_finder(short data)
{
  if(data > guessed_param.vc)
  {
    num_a = 0;
    return ((++num_v == 8) ? 'v' : 0);
  }
  else if (data > guessed_param.ac)
  {
    num_v = 0;
    return ((++num_a == 12) ? 'a' : 0);

  }
  else
  {
    num_v = 0;
    num_a = 0;
    return 0;
  } 
}







