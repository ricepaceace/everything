#pragma once
#ifdef NO_ARDUINO
#define PROGMEM
#define pgm_read_word_near(x) (*(x))
#define byte unsigned char
#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((a) > (b) ? (a) : (b))
#define abs(x) ((x) < 0 ? -(x) : x)
#include <stdbool.h>

#define pinMode(pin, mode) 
#define boolean bool
#include <stdio.h>

class _Serial {
	public:
	void begin(int a) {}
	void print(const char* c) { printf("%s", c);}
	void print(int g) { printf("%d", g); } 
	void println(const char* c) { printf("%s\n", c);}
	void println(int g) { printf("%d\n", g); } 
	void println() {  printf("\n");} 
};
_Serial Serial;

void setup();
void loop();

int main(int argc, char** argv)
{
	setup();
	while (true)
		loop();
}
#endif

