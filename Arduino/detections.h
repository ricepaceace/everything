#include "constants.h"

typedef struct
{
	int v_thresh;
	int a_thresh;
	int vflip;
	int aflip;
	int AbeatDelay;
	int VbeatDelay;
	int VbeatFallDelay;
	int AstimDelay;
	int VstimDelay;
	int ACaptureThresh;
	int VCaptureThresh;
	int recentVBools[V_LENGTH];
	int recentABools[A_LENGTH];
	int last_sample_is_V;
	int last_sample_is_A;
	int recentdatapoints[PREVARP];
} detections;
