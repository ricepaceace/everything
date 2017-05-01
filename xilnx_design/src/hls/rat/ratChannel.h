#include <ap_fixed.h>

typedef ap_uint<1> dbool;

short ratDecision(dbool reset_A, dbool reset_V, dbool reset_params, int athresh, int vthresh, char a_flip, char v_flip, unsigned int a_length, unsigned int v_length, short data);
