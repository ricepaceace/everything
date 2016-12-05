#define N_PTS 10000
short bbuffer[N_PTS];
int i = 0;
void setup() {
  Serial.begin(250000);
}

void loop() {
  unsigned long start = micros();
  if (i < N_PTS)
    bbuffer[i] = analogRead(A0)-256;
  i++;
  delayMicroseconds(1000 + start - micros());
  if (i == N_PTS)
    for (int j = 0; j < N_PTS; j++)
      Serial.println(bbuffer[j]);
}
