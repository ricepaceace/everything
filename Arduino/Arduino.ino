#define PARAM_LEARN_SIZE 8192 //The number of points to use in parameter learning

#ifdef NO_ARDUINO
#include "arduinocompat.h"
#endif


#define SAMPLE_RATE 1000
#define MIN_HEARTRATE 20 //BPM
#define MAX_HEARTRATE 250 //BPM

// The we expect two rising, falling edges per beat, but the 3 gives us padding
#define MAX_EDGES (PARAM_LEARN_SIZE * 3 * MAX_HEARTRATE) / (SAMPLE_RATE * 60)


#include "data.h"
#include "constants.h"
#include "detections.h"


#include "countpeaks.h"
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
    Serial.println("Starting");
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







