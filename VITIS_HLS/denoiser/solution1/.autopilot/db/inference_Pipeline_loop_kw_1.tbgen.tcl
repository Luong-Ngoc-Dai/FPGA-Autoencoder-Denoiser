set moduleName inference_Pipeline_loop_kw_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {inference_Pipeline_loop_kw_1}
set C_modelType { int 1 }
set C_modelArgList {
	{ s_V_1 int 16 regular  }
	{ add_ln30 int 6 regular  }
	{ sub_ln32 int 10 regular  }
	{ input_r int 16 regular {array 784 { 1 1 } 1 1 }  }
	{ brmerge_not int 1 regular  }
	{ empty int 6 regular  }
	{ zext_ln21 int 5 regular  }
	{ s_V_13_out int 16 regular {pointer 1}  }
	{ s_V_14_out int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_V_1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln30", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "sub_ln32", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "brmerge_not", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln21", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "s_V_13_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_V_14_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_V_1 sc_in sc_lv 16 signal 0 } 
	{ add_ln30 sc_in sc_lv 6 signal 1 } 
	{ sub_ln32 sc_in sc_lv 10 signal 2 } 
	{ input_r_address0 sc_out sc_lv 10 signal 3 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 3 } 
	{ input_r_q0 sc_in sc_lv 16 signal 3 } 
	{ input_r_address1 sc_out sc_lv 10 signal 3 } 
	{ input_r_ce1 sc_out sc_logic 1 signal 3 } 
	{ input_r_q1 sc_in sc_lv 16 signal 3 } 
	{ brmerge_not sc_in sc_lv 1 signal 4 } 
	{ empty sc_in sc_lv 6 signal 5 } 
	{ zext_ln21 sc_in sc_lv 5 signal 6 } 
	{ s_V_13_out sc_out sc_lv 16 signal 7 } 
	{ s_V_13_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ s_V_14_out sc_out sc_lv 16 signal 8 } 
	{ s_V_14_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_V_1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_V_1", "role": "default" }} , 
 	{ "name": "add_ln30", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "add_ln30", "role": "default" }} , 
 	{ "name": "sub_ln32", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "sub_ln32", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "input_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "input_r", "role": "address1" }} , 
 	{ "name": "input_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce1" }} , 
 	{ "name": "input_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q1" }} , 
 	{ "name": "brmerge_not", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "brmerge_not", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "zext_ln21", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln21", "role": "default" }} , 
 	{ "name": "s_V_13_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_V_13_out", "role": "default" }} , 
 	{ "name": "s_V_13_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_V_13_out", "role": "ap_vld" }} , 
 	{ "name": "s_V_14_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_V_14_out", "role": "default" }} , 
 	{ "name": "s_V_14_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_V_14_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "inference_Pipeline_loop_kw_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_V_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln30", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln32", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "brmerge_not", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln21", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_V_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "s_V_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "conv1_kernel_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_kw_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state8", "ap_ST_fsm_state9"]}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv1_kernel_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_10s_16s_26ns_26_4_1_U4", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_10s_16s_26ns_26_4_1_U5", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	inference_Pipeline_loop_kw_1 {
		s_V_1 {Type I LastRead 0 FirstWrite -1}
		add_ln30 {Type I LastRead 0 FirstWrite -1}
		sub_ln32 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 2 FirstWrite -1}
		brmerge_not {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		zext_ln21 {Type I LastRead 0 FirstWrite -1}
		s_V_13_out {Type O LastRead -1 FirstWrite 2}
		s_V_14_out {Type O LastRead -1 FirstWrite 6}
		conv1_kernel_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "8", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_V_1 { ap_none {  { s_V_1 in_data 0 16 } } }
	add_ln30 { ap_none {  { add_ln30 in_data 0 6 } } }
	sub_ln32 { ap_none {  { sub_ln32 in_data 0 10 } } }
	input_r { ap_memory {  { input_r_address0 mem_address 1 10 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 in_data 0 16 }  { input_r_address1 MemPortADDR2 1 10 }  { input_r_ce1 MemPortCE2 1 1 }  { input_r_q1 in_data 0 16 } } }
	brmerge_not { ap_none {  { brmerge_not in_data 0 1 } } }
	empty { ap_none {  { empty in_data 0 6 } } }
	zext_ln21 { ap_none {  { zext_ln21 in_data 0 5 } } }
	s_V_13_out { ap_vld {  { s_V_13_out out_data 1 16 }  { s_V_13_out_ap_vld out_vld 1 1 } } }
	s_V_14_out { ap_vld {  { s_V_14_out out_data 1 16 }  { s_V_14_out_ap_vld out_vld 1 1 } } }
}
