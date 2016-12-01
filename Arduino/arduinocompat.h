
#ifdef NO_ARDUINO
#define PROGMEM
#define pgm_read_word_near(x) (*(x))
#define byte unsigned char
#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((a) > (b) ? (a) : (b))
#define abs(x) ((x) < 0 ? -(x) : x)
#include <stdbool.h>
#endif

