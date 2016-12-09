#pragma line 1 "/home/greg/multisite_test_detection_algorithms/xilnx_design/singleChannelDecision.cpp"
#pragma line 1 "<built-in>"
#pragma line 1 "<command-line>"
#pragma line 1 "/home/greg/multisite_test_detection_algorithms/xilnx_design/singleChannelDecision.cpp"
#pragma line 1 "/home/greg/multisite_test_detection_algorithms/xilnx_design/constants.h" 1
#pragma empty_line
#pragma line 2 "/home/greg/multisite_test_detection_algorithms/xilnx_design/singleChannelDecision.cpp" 2
#pragma line 1 "/home/greg/multisite_test_detection_algorithms/xilnx_design/circularBuffer.h" 1
#pragma empty_line
template<typename T, int maxsize>
struct CircularBuffer {
 int sum;
 T data[maxsize];
 int head_i;
 int len;
 CircularBuffer()
  : sum(0), head_i(0), len(0) {
 }
#pragma empty_line
 void push(T val) {
  if (len == maxsize) {
   sum -= data[head_i];
   len--;
  }
  data[head_i] = val;
  sum += val;
  len++;
  head_i++;
  if (head_i == maxsize)
   head_i = 0;
 }
#pragma empty_line
 T head() {
  if (len == 0)
   return 0;
  int i = head_i - 1;
  if (i < 0)
   i += maxsize;
  return data[i];
 }
#pragma empty_line
 T tail() {
  if (len == 0)
   return 0;
  int i = head_i - len;
  if (i < 0)
   i += maxsize;
  return data[i];
 }
#pragma empty_line
#pragma empty_line
#pragma empty_line
 T ftail() {
  if (len == maxsize)
   return data[head_i];
  else
   return 0;
 }
};
#pragma line 3 "/home/greg/multisite_test_detection_algorithms/xilnx_design/singleChannelDecision.cpp" 2
#pragma empty_line
#pragma empty_line
static int vthresh = 161;
static int athresh = 72;
static int vflip = -1;
static int aflip = 1;
static int AbeatDelay = 0;
static int VbeatDelay = 0;
static int VbeatFallDelay;
static int AstimDelay = 0;
static int VstimDelay = 0;
static int ACaptureThresh = 30;
static int VCaptureThresh = 11;
static CircularBuffer<int, 11> recentVBools;
static CircularBuffer<int, 30> recentABools;
static int last_sample_is_V = 0;
static int last_sample_is_A;
static CircularBuffer<int, 20> recentdatapoints;
#pragma empty_line
void singleDecision(short A_stim_reset, short V_stim_reset, short set_thresh, int v_thresh, int a_thresh, int a_flip, int v_flip, short * datapoint, short * out, short * stim)
{
 if(A_stim_reset)
  AstimDelay = 0;
#pragma empty_line
 if(V_stim_reset)
  VstimDelay = 0;
#pragma empty_line
 if(set_thresh)
 {
     vthresh = v_thresh;
     athresh = a_thresh;
     aflip = a_flip;
     vflip = v_flip;
 }
#pragma empty_line
 recentdatapoints.push(*datapoint);
#pragma empty_line
 AbeatDelay++;
 VbeatDelay++;
 VbeatFallDelay++;
 AstimDelay++;
 VstimDelay++;
#pragma empty_line
#pragma empty_line
 int datapointV = recentdatapoints.head();
 int i;
 int sum = recentVBools.sum;
 recentVBools.push((vflip * datapointV) > vthresh);
 sum += recentVBools.head();
#pragma empty_line
 if(sum > 11/2)
 {
  if(!last_sample_is_V)
  {
   VbeatDelay = 0;
   last_sample_is_V = 1;
  }
 }
 else if(last_sample_is_V)
 {
  VbeatFallDelay = 0;
  last_sample_is_V = 0;
 }
#pragma empty_line
#pragma empty_line
 int datapointA = recentdatapoints.ftail();
 sum = recentABools.sum;
#pragma empty_line
 recentABools.push((aflip * datapointA) > athresh);
 sum += recentABools.head();
#pragma empty_line
 if(sum > 30/2 && VbeatDelay > VbeatFallDelay)
 {
  if(!last_sample_is_A)
  {
   AbeatDelay = 0;
   last_sample_is_A = 1;
  }
 }
#pragma empty_line
 else if(last_sample_is_A)
  last_sample_is_A = 0;
#pragma empty_line
 if (VbeatDelay == 0 && last_sample_is_V)
 {
  *out = 'v';
 }
    else if (AbeatDelay == 0 && last_sample_is_A)
 {
  *out = 'a';
 }
 else
  *out = 0;
#pragma empty_line
 *stim = 0;
 if (AbeatDelay > 1000 && AstimDelay > ACaptureThresh)
 {
  if (AstimDelay == ACaptureThresh+1)
  {
#pragma empty_line
  }
#pragma empty_line
  *stim = 'a';
 }
#pragma empty_line
 if (VbeatDelay > AbeatDelay && AbeatDelay > 900 && VstimDelay > VCaptureThresh)
 {
  if (VstimDelay == VCaptureThresh+1)
  {
#pragma empty_line
  }
#pragma empty_line
  *stim = 'v';
  }
}
