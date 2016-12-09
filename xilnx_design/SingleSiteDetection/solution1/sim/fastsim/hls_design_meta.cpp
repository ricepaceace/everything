#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("A_stim_reset", 16, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("V_stim_reset", 16, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("set_thresh", 16, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("v_thresh", 32, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("a_thresh", 32, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("a_flip", 32, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("v_flip", 32, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("datapoint", 16, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("out_r", 16, hls_out, 8, "ap_vld", "out_data", 1),
	Port_Property("out_r_ap_vld", 1, hls_out, 8, "ap_vld", "out_vld", 1),
	Port_Property("stim", 16, hls_out, 9, "ap_vld", "out_data", 1),
	Port_Property("stim_ap_vld", 1, hls_out, 9, "ap_vld", "out_vld", 1),
};
const char* HLS_Design_Meta::dut_name = "singleDecision";
