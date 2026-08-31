set moduleName inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ select_ln115_2 int 16 regular  }
	{ select_ln117_2 int 5 regular  }
	{ select_ln117 int 5 regular  }
	{ zext_ln115 int 8 regular  }
	{ cmp27_i431_not_mid1258 int 1 regular  }
	{ cmp29_i433_not_mid1260 int 1 regular  }
	{ zext_ln132_3 int 13 regular  }
	{ d int 16 regular {array 12544 { 1 1 } 1 1 }  }
	{ s_V_16_out int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "select_ln115_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln117_2", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln117", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln115", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "cmp27_i431_not_mid1258", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cmp29_i433_not_mid1260", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln132_3", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "d", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_V_16_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ select_ln115_2 sc_in sc_lv 16 signal 0 } 
	{ select_ln117_2 sc_in sc_lv 5 signal 1 } 
	{ select_ln117 sc_in sc_lv 5 signal 2 } 
	{ zext_ln115 sc_in sc_lv 8 signal 3 } 
	{ cmp27_i431_not_mid1258 sc_in sc_lv 1 signal 4 } 
	{ cmp29_i433_not_mid1260 sc_in sc_lv 1 signal 5 } 
	{ zext_ln132_3 sc_in sc_lv 13 signal 6 } 
	{ d_address0 sc_out sc_lv 14 signal 7 } 
	{ d_ce0 sc_out sc_logic 1 signal 7 } 
	{ d_q0 sc_in sc_lv 16 signal 7 } 
	{ d_address1 sc_out sc_lv 14 signal 7 } 
	{ d_ce1 sc_out sc_logic 1 signal 7 } 
	{ d_q1 sc_in sc_lv 16 signal 7 } 
	{ s_V_16_out sc_out sc_lv 16 signal 8 } 
	{ s_V_16_out_ap_vld sc_out sc_logic 1 outvld 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "select_ln115_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "select_ln115_2", "role": "default" }} , 
 	{ "name": "select_ln117_2", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "select_ln117_2", "role": "default" }} , 
 	{ "name": "select_ln117", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "select_ln117", "role": "default" }} , 
 	{ "name": "zext_ln115", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln115", "role": "default" }} , 
 	{ "name": "cmp27_i431_not_mid1258", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp27_i431_not_mid1258", "role": "default" }} , 
 	{ "name": "cmp29_i433_not_mid1260", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp29_i433_not_mid1260", "role": "default" }} , 
 	{ "name": "zext_ln132_3", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "zext_ln132_3", "role": "default" }} , 
 	{ "name": "d_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "d", "role": "address0" }} , 
 	{ "name": "d_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce0" }} , 
 	{ "name": "d_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "d", "role": "q0" }} , 
 	{ "name": "d_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "d", "role": "address1" }} , 
 	{ "name": "d_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce1" }} , 
 	{ "name": "d_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "d", "role": "q1" }} , 
 	{ "name": "s_V_16_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_V_16_out", "role": "default" }} , 
 	{ "name": "s_V_16_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_V_16_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "77", "EstimateLatencyMax" : "77",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln115_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln117_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln117", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln115", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp27_i431_not_mid1258", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp29_i433_not_mid1260", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln132_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "conv3_kernel_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_kh_3_loop_kw_3_loop_ic_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv3_kernel_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_12s_16s_26ns_26_4_1_U32", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_12s_16s_26ns_26_4_1_U33", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3 {
		select_ln115_2 {Type I LastRead 0 FirstWrite -1}
		select_ln117_2 {Type I LastRead 0 FirstWrite -1}
		select_ln117 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		cmp27_i431_not_mid1258 {Type I LastRead 0 FirstWrite -1}
		cmp29_i433_not_mid1260 {Type I LastRead 0 FirstWrite -1}
		zext_ln132_3 {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 1 FirstWrite -1}
		s_V_16_out {Type O LastRead -1 FirstWrite 3}
		conv3_kernel_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "77", "Max" : "77"}
	, {"Name" : "Interval", "Min" : "77", "Max" : "77"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	select_ln115_2 { ap_none {  { select_ln115_2 in_data 0 16 } } }
	select_ln117_2 { ap_none {  { select_ln117_2 in_data 0 5 } } }
	select_ln117 { ap_none {  { select_ln117 in_data 0 5 } } }
	zext_ln115 { ap_none {  { zext_ln115 in_data 0 8 } } }
	cmp27_i431_not_mid1258 { ap_none {  { cmp27_i431_not_mid1258 in_data 0 1 } } }
	cmp29_i433_not_mid1260 { ap_none {  { cmp29_i433_not_mid1260 in_data 0 1 } } }
	zext_ln132_3 { ap_none {  { zext_ln132_3 in_data 0 13 } } }
	d { ap_memory {  { d_address0 mem_address 1 14 }  { d_ce0 mem_ce 1 1 }  { d_q0 in_data 0 16 }  { d_address1 MemPortADDR2 1 14 }  { d_ce1 MemPortCE2 1 1 }  { d_q1 in_data 0 16 } } }
	s_V_16_out { ap_vld {  { s_V_16_out out_data 1 16 }  { s_V_16_out_ap_vld out_vld 1 1 } } }
}
