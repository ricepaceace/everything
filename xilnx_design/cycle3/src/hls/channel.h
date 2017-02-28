#include <ap_fixed.h>

typedef ap_uint<1> dbool;

short Decision(dbool reset_A, dbool reset_V, dbool reset_params, int vthresh, int athresh, char a_flip, char v_flip, unsigned int a_length, unsigned int v_length, short data);
