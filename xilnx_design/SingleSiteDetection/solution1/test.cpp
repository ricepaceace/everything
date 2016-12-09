#include "singleChannelDecision.h"

static short data[10000] = {
		#include "good-ch2.h"
};
static short detect_out[10000];
static short stim_out[10000];
int main()

{
	int i;

	singleDecision(0, 0, 0, 0, 0, 0, 0, data, detect_out, stim_out);

	for(i = 1; i<10000;i++)
	{
		singleDecision(stim_out[i-1] == 'a',( stim_out[i-1] == 'v'), 0, 0, 0, 0, 0, data+i, detect_out+i, stim_out+i);

	}
	return 0;
}
