#1 "singleChannelDecision.cpp"
#1 "singleChannelDecision.cpp" 1
#1 "<built-in>" 1
#1 "<built-in>" 3
#155 "<built-in>" 3
#1 "<command line>" 1






#1 "/opt/Xilinx/Vivado_HLS/2014.2/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
/* autopilot_ssdm_op.h*/
/*
#-  (c) Copyright 2011-2014 Xilinx, Inc. All rights reserved.
#-
#-  This file contains confidential and proprietary information
#-  of Xilinx, Inc. and is protected under U.S. and
#-  international copyright and other intellectual property
#-  laws.
#-
#-  DISCLAIMER
#-  This disclaimer is not a license and does not grant any
#-  rights to the materials distributed herewith. Except as
#-  otherwise provided in a valid license issued to you by
#-  Xilinx, and to the maximum extent permitted by applicable
#-  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#-  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#-  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#-  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#-  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#-  (2) Xilinx shall not be liable (whether in contract or tort,
#-  including negligence, or under any other theory of
#-  liability) for any loss or damage of any kind or nature
#-  related to, arising under or in connection with these
#-  materials, including for any direct, or any indirect,
#-  special, incidental, or consequential loss or damage
#-  (including loss of data, profits, goodwill, or any type of
#-  loss or damage suffered as a result of any action brought
#-  by a third party) even if such damage or loss was
#-  reasonably foreseeable or Xilinx had been advised of the
#-  possibility of the same.
#-
#-  CRITICAL APPLICATIONS
#-  Xilinx products are not designed or intended to be fail-
#-  safe, or for use in any application requiring fail-safe
#-  performance, such as life-support or safety devices or
#-  systems, Class III medical devices, nuclear facilities,
#-  applications related to the deployment of airbags, or any
#-  other applications that could lead to death, personal
#-  injury, or severe property or environmental damage
#-  (individually and collectively, "Critical
#-  Applications"). Customer assumes the sole risk and
#-  liability of any use of Xilinx products in Critical
#-  Applications, subject only to applicable laws and
#-  regulations governing limitations on product liability.
#-
#-  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#-  PART OF THIS FILE AT ALL TIMES. 
#- ************************************************************************

 *
 * $Id$
 */
#145 "/opt/Xilinx/Vivado_HLS/2014.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
/*#define AP_SPEC_ATTR __attribute__ ((pure))*/




extern "C" {

    /****** SSDM Intrinsics: OPERATIONS ***/
    // Interface operations

    //typedef unsigned int __attribute__ ((bitwidth(1))) _uint1_;
    typedef bool _uint1_;

    void _ssdm_op_IfRead(...) __attribute__ ((nothrow));
    void _ssdm_op_IfWrite(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_op_IfNbRead(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_op_IfNbWrite(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_op_IfCanRead(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_op_IfCanWrite(...) __attribute__ ((nothrow));

    // Stream Intrinsics
    void _ssdm_StreamRead(...) __attribute__ ((nothrow));
    void _ssdm_StreamWrite(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_StreamNbRead(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_StreamNbWrite(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_StreamCanRead(...) __attribute__ ((nothrow));
    _uint1_ _ssdm_StreamCanWrite(...) __attribute__ ((nothrow));

    // Misc
    void _ssdm_op_MemShiftRead(...) __attribute__ ((nothrow));

    void _ssdm_op_Wait(...) __attribute__ ((nothrow));
    void _ssdm_op_Poll(...) __attribute__ ((nothrow));

    void _ssdm_op_Return(...) __attribute__ ((nothrow));

    /* SSDM Intrinsics: SPECIFICATIONS */
    void _ssdm_op_SpecSynModule(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecTopModule(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDecl(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDef(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecPort(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecConnection(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecChannel(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecSensitive(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecModuleInst(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecPortMap(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecReset(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecPlatform(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecClockDomain(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecPowerDomain(...) __attribute__ ((nothrow));

    int _ssdm_op_SpecRegionBegin(...) __attribute__ ((nothrow));
    int _ssdm_op_SpecRegionEnd(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopName(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopTripCount(...) __attribute__ ((nothrow));

    int _ssdm_op_SpecStateBegin(...) __attribute__ ((nothrow));
    int _ssdm_op_SpecStateEnd(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecInterface(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecPipeline(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecDataflowPipeline(...) __attribute__ ((nothrow));


    void _ssdm_op_SpecLatency(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecParallel(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecProtocol(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecOccurrence(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecResource(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecResourceLimit(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecCHCore(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecFUCore(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecIFCore(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecIPCore(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecKeepValue(...) __attribute__ ((nothrow));
    void _ssdm_op_SpecMemCore(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecExt(...) __attribute__ ((nothrow));
    /*void* _ssdm_op_SpecProcess(...) SSDM_SPEC_ATTR;
    void* _ssdm_op_SpecEdge(...) SSDM_SPEC_ATTR; */

    /* Presynthesis directive functions */
    void _ssdm_SpecArrayDimSize(...) __attribute__ ((nothrow));

    void _ssdm_RegionBegin(...) __attribute__ ((nothrow));
    void _ssdm_RegionEnd(...) __attribute__ ((nothrow));

    void _ssdm_Unroll(...) __attribute__ ((nothrow));
    void _ssdm_UnrollRegion(...) __attribute__ ((nothrow));

    void _ssdm_InlineAll(...) __attribute__ ((nothrow));
    void _ssdm_InlineLoop(...) __attribute__ ((nothrow));
    void _ssdm_Inline(...) __attribute__ ((nothrow));
    void _ssdm_InlineSelf(...) __attribute__ ((nothrow));
    void _ssdm_InlineRegion(...) __attribute__ ((nothrow));

    void _ssdm_SpecArrayMap(...) __attribute__ ((nothrow));
    void _ssdm_SpecArrayPartition(...) __attribute__ ((nothrow));
    void _ssdm_SpecArrayReshape(...) __attribute__ ((nothrow));

    void _ssdm_SpecStream(...) __attribute__ ((nothrow));

    void _ssdm_SpecExpr(...) __attribute__ ((nothrow));
    void _ssdm_SpecExprBalance(...) __attribute__ ((nothrow));

    void _ssdm_SpecDependence(...) __attribute__ ((nothrow));

    void _ssdm_SpecLoopMerge(...) __attribute__ ((nothrow));
    void _ssdm_SpecLoopFlatten(...) __attribute__ ((nothrow));
    void _ssdm_SpecLoopRewind(...) __attribute__ ((nothrow));

    void _ssdm_SpecFuncInstantiation(...) __attribute__ ((nothrow));
    void _ssdm_SpecFuncBuffer(...) __attribute__ ((nothrow));
    void _ssdm_SpecFuncExtract(...) __attribute__ ((nothrow));
    void _ssdm_SpecConstant(...) __attribute__ ((nothrow));

    void _ssdm_DataPack(...) __attribute__ ((nothrow));
    void _ssdm_SpecDataPack(...) __attribute__ ((nothrow));

    void _ssdm_op_SpecBitsMap(...) __attribute__ ((nothrow));

}
#401 "/opt/Xilinx/Vivado_HLS/2014.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
/*#define _ssdm_op_WaitUntil(X) while (!(X)) _ssdm_op_Wait(1);
#define _ssdm_op_Delayed(X) X */
#8 "<command line>" 2
#1 "<built-in>" 2
#1 "singleChannelDecision.cpp" 2
#1 "./constants.h" 1
#11 "./constants.h"
// Constants used for CountPeaks:
// Used to punish when the threshold is too low so large blocks of the data are above the threshold
// This is sample-rate dependent. It was 150 in the Matlab code, but dividing by 128 can be done with
// a bitshift instead of a division

// over 1/inverse_filter_threshold samples in min_length need to be high for it to count as a peak





// Constants used for BinarySearch
// Number of points to use in each round of flat finding

// Max number of rounds of recursive flat finding to do
#38 "./constants.h"
//The above two constants are used to help the binary search find minimum and maximum heart rates that thresholding can return.
#2 "singleChannelDecision.cpp" 2
#1 "./circularBuffer.h" 1

template<typename T, int maxsize>
struct CircularBuffer {
 int sum;
 T data[maxsize];
 int head_i;
 int len;
 CircularBuffer()
  : sum(0), head_i(0), len(0) {
 }
 // adds a value and removes one if necessary
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
 // returns the most recently added element
 T head() {
  if (len == 0)
   return 0;
  int i = head_i - 1;
  if (i < 0)
   i += maxsize;
  return data[i];
 }
 // returns the oldest element still in the circular buffer
 T tail() {
  if (len == 0)
   return 0;
  int i = head_i - len;
  if (i < 0)
   i += maxsize;
  return data[i];
 }

 // Returns the element that is exactly maxsize back from the current one or 0 if there isn't an element.
 // It's the same as tail() when the buffer is full and returns 0 when it's not.
 T ftail() {
  if (len == maxsize)
   return data[head_i];
  else
   return 0;
 }
};
#3 "singleChannelDecision.cpp" 2


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

void singleDecision(short A_stim_reset, short V_stim_reset, short set_thresh, int v_thresh, int a_thresh, int a_flip, int v_flip, short * datapoint, short * out, short * stim)
{
 if(A_stim_reset)
  AstimDelay = 0;

 if(V_stim_reset)
  VstimDelay = 0;

 if(set_thresh)
 {
     vthresh = v_thresh;
     athresh = a_thresh;
     aflip = a_flip;
     vflip = v_flip;
 }

 recentdatapoints.push(*datapoint);

 AbeatDelay++;
 VbeatDelay++;
 VbeatFallDelay++;
 AstimDelay++;
 VstimDelay++;

 //VENTRICAL
 int datapointV = recentdatapoints.head();
 int i;
 int sum = recentVBools.sum;
 recentVBools.push((vflip * datapointV) > vthresh);
 sum += recentVBools.head();

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

 // ATRIAL
 int datapointA = recentdatapoints.ftail();
 sum = recentABools.sum;

 recentABools.push((aflip * datapointA) > athresh);
 sum += recentABools.head();

 if(sum > 30/2 && VbeatDelay > VbeatFallDelay)
 {
  if(!last_sample_is_A)
  {
   AbeatDelay = 0;
   last_sample_is_A = 1;
  }
 }

 else if(last_sample_is_A)
  last_sample_is_A = 0;

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

 *stim = 0;
 if (AbeatDelay > 1000 && AstimDelay > ACaptureThresh)
 {
  if (AstimDelay == ACaptureThresh+1)
  {
   //TODO: Increse Atrial Stimulation voltage
  }

  *stim = 'a';
 }

 if (VbeatDelay > AbeatDelay && AbeatDelay > 900 && VstimDelay > VCaptureThresh)
 {
  if (VstimDelay == VCaptureThresh+1)
  {
   //TODO: increase ventricular stim voltage
  }

  *stim = 'v';
  }
}
