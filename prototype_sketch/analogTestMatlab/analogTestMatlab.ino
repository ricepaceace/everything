#define PWM_OUT 4 //use this pin for PWM out

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

int start;
int finish;
int elapsed;
int incomingVal;

void loop() {
  start = micros();
  incomingVal = Serial.read();
  Serial.println(incomingVal);
  analogWrite(PWM_OUT, incomingVal);
  finish = micros();
  elapsed = finish - start;
  delayMicroseconds(1000 - elapsed);
}


