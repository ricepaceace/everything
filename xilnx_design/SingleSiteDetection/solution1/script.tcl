############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
open_project SingleSiteDetection
set_top singleDecision
add_files circularBuffer.h
add_files constants.h
add_files singleChannelDecision.cpp
add_files singleChannelDecision.h
add_files -tb good-ch2.h
add_files -tb SingleSiteDetection/solution1/test.cpp
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./SingleSiteDetection/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -evaluate verilog -format ip_catalog
