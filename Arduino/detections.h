#pragma once
#include "constants.h"
#include "circularBuffer.h"

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
	CircularBuffer<int, V_LENGTH> recentVBools;
	CircularBuffer<int, A_LENGTH> recentABools;
	int last_sample_is_V;
	int last_sample_is_A;
	CircularBuffer<int, PREVARP> recentdatapoints;
} detections;

typedef struct
{
	int v_thresh;
	int a_thresh;
	int v_flip;
	int a_flip;
} params;
