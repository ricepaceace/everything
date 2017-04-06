############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project DecisionChannel
set_top Decision
add_files src/hls/channel.cpp
add_files src/hls/channel.h
add_files src/hls/circularBuffer.h
add_files src/hls/constants.h
add_files -tb src/hls/channel_tb.cpp
add_files -tb src/hls/good-ch2.h
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
#source "./DecisionChannel/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -format ip_catalog -description "Single channel detection and decision AXI-lite module" -vendor "PaceAce" -library "PaceAce" -display_name "channel"
