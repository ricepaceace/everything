set moduleName singleDecision
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName singleDecision
set C_modelType { void 0 }
set C_modelArgList { 
	{ A_stim_reset int 16 regular  }
	{ V_stim_reset int 16 regular  }
	{ set_thresh int 16 regular  }
	{ v_thresh int 32 regular  }
	{ a_thresh int 32 regular  }
	{ a_flip int 32 regular  }
	{ v_flip int 32 regular  }
	{ datapoint int 16 regular {pointer 0}  }
	{ out_r int 16 regular {pointer 1}  }
	{ stim int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "A_stim_reset", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "A_stim_reset","cData": "short","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "V_stim_reset", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "V_stim_reset","cData": "short","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "set_thresh", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "set_thresh","cData": "short","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "v_thresh", "interface" : "wire", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "v_thresh","cData": "int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "a_thresh", "interface" : "wire", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "a_thresh","cData": "int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "a_flip", "interface" : "wire", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "a_flip","cData": "int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "v_flip", "interface" : "wire", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "v_flip","cData": "int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "datapoint", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "datapoint","cData": "short","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_r", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out","cData": "short","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "stim", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "stim","cData": "short","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_stim_reset sc_in sc_lv 16 signal 0 } 
	{ V_stim_reset sc_in sc_lv 16 signal 1 } 
	{ set_thresh sc_in sc_lv 16 signal 2 } 
	{ v_thresh sc_in sc_lv 32 signal 3 } 
	{ a_thresh sc_in sc_lv 32 signal 4 } 
	{ a_flip sc_in sc_lv 32 signal 5 } 
	{ v_flip sc_in sc_lv 32 signal 6 } 
	{ datapoint sc_in sc_lv 16 signal 7 } 
	{ out_r sc_out sc_lv 16 signal 8 } 
	{ out_r_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ stim sc_out sc_lv 16 signal 9 } 
	{ stim_ap_vld sc_out sc_logic 1 outvld 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_stim_reset", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "A_stim_reset", "role": "default" }} , 
 	{ "name": "V_stim_reset", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_stim_reset", "role": "default" }} , 
 	{ "name": "set_thresh", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "set_thresh", "role": "default" }} , 
 	{ "name": "v_thresh", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_thresh", "role": "default" }} , 
 	{ "name": "a_thresh", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_thresh", "role": "default" }} , 
 	{ "name": "a_flip", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_flip", "role": "default" }} , 
 	{ "name": "v_flip", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_flip", "role": "default" }} , 
 	{ "name": "datapoint", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "datapoint", "role": "default" }} , 
 	{ "name": "out_r", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_r", "role": "default" }} , 
 	{ "name": "out_r_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r", "role": "ap_vld" }} , 
 	{ "name": "stim", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "stim", "role": "default" }} , 
 	{ "name": "stim_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stim", "role": "ap_vld" }}  ]}
set Spec2ImplPortList { 
	A_stim_reset { ap_none {  { A_stim_reset in_data 0 16 } } }
	V_stim_reset { ap_none {  { V_stim_reset in_data 0 16 } } }
	set_thresh { ap_none {  { set_thresh in_data 0 16 } } }
	v_thresh { ap_none {  { v_thresh in_data 0 32 } } }
	a_thresh { ap_none {  { a_thresh in_data 0 32 } } }
	a_flip { ap_none {  { a_flip in_data 0 32 } } }
	v_flip { ap_none {  { v_flip in_data 0 32 } } }
	datapoint { ap_none {  { datapoint in_data 0 16 } } }
	out_r { ap_vld {  { out_r out_data 1 16 }  { out_r_ap_vld out_vld 1 1 } } }
	stim { ap_vld {  { stim out_data 1 16 }  { stim_ap_vld out_vld 1 1 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
