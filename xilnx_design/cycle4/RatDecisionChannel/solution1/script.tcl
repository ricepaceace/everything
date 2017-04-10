############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project RatDecisionChannel
set_top ratDecision
add_files ../cycle3/src/hls/ratConstants.h
add_files ../cycle3/src/hls/ratChannel.h
add_files ../cycle3/src/hls/ratChannel.cpp
add_files ../cycle3/src/hls/circularBuffer.h
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
#source "./RatDecisionChannel/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog -description "Decision Channel for Langendorff" -vendor "PaceAce"
