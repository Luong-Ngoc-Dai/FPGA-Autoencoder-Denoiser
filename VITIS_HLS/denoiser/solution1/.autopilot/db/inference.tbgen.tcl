set moduleName inference
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
set C_modelName {inference}
set C_modelType { void 0 }
set C_modelArgList {
	{ d int 16 regular {array 12544 { 2 1 } 1 1 }  }
	{ input_r int 16 regular {array 784 { 1 1 } 1 1 }  }
	{ output_r int 16 regular {array 784 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "d", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "output_r", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ d_address0 sc_out sc_lv 14 signal 0 } 
	{ d_ce0 sc_out sc_logic 1 signal 0 } 
	{ d_we0 sc_out sc_lv 2 signal 0 } 
	{ d_d0 sc_out sc_lv 16 signal 0 } 
	{ d_q0 sc_in sc_lv 16 signal 0 } 
	{ d_address1 sc_out sc_lv 14 signal 0 } 
	{ d_ce1 sc_out sc_logic 1 signal 0 } 
	{ d_q1 sc_in sc_lv 16 signal 0 } 
	{ input_r_address0 sc_out sc_lv 10 signal 1 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 1 } 
	{ input_r_q0 sc_in sc_lv 16 signal 1 } 
	{ input_r_address1 sc_out sc_lv 10 signal 1 } 
	{ input_r_ce1 sc_out sc_logic 1 signal 1 } 
	{ input_r_q1 sc_in sc_lv 16 signal 1 } 
	{ output_r_address0 sc_out sc_lv 10 signal 2 } 
	{ output_r_ce0 sc_out sc_logic 1 signal 2 } 
	{ output_r_we0 sc_out sc_logic 1 signal 2 } 
	{ output_r_d0 sc_out sc_lv 16 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "d_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "d", "role": "address0" }} , 
 	{ "name": "d_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce0" }} , 
 	{ "name": "d_we0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "d", "role": "we0" }} , 
 	{ "name": "d_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "d", "role": "d0" }} , 
 	{ "name": "d_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "d", "role": "q0" }} , 
 	{ "name": "d_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "d", "role": "address1" }} , 
 	{ "name": "d_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce1" }} , 
 	{ "name": "d_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "d", "role": "q1" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "input_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "input_r", "role": "address1" }} , 
 	{ "name": "input_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce1" }} , 
 	{ "name": "input_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q1" }} , 
 	{ "name": "output_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "output_r", "role": "address0" }} , 
 	{ "name": "output_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "ce0" }} , 
 	{ "name": "output_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "we0" }} , 
 	{ "name": "output_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_r", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "6", "10", "12", "17", "22", "27", "28", "29", "30", "31", "32"],
		"CDFG" : "inference",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "510394", "EstimateLatencyMax" : "538618",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "d", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_fu_521", "Port" : "d", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "10", "SubInstance" : "grp_inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3_fu_498", "Port" : "d", "Inst_start_state" : "7", "Inst_end_state" : "11"},
					{"ID" : "4", "SubInstance" : "grp_inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3_fu_475", "Port" : "d", "Inst_start_state" : "2", "Inst_end_state" : "6"},
					{"ID" : "12", "SubInstance" : "grp_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_fu_504", "Port" : "d", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "22", "SubInstance" : "grp_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_fu_537", "Port" : "d", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_inference_Pipeline_loop_kw_1_fu_481", "Port" : "input_r", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv1_kernel_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_inference_Pipeline_loop_kw_1_fu_481", "Port" : "conv1_kernel_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "conv2_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv2_kernel_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_fu_504", "Port" : "conv2_kernel_V", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "conv3_kernel_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_fu_521", "Port" : "conv3_kernel_V", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "conv_out_kernel_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_fu_537", "Port" : "conv_out_kernel_V", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "f_x_msb_2_table_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_kh_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "58", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_oc_1_loop_h_1_loop_w_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "58", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_oc_2_loop_h_2_loop_w_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "58", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_oc_3_loop_h_3_loop_w_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "58", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state11"], "PostState" : ["ap_ST_fsm_state16"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_h_out_loop_w_out", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "58", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state58"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state12"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv2_bias_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.f_x_msb_2_table_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.exp_x_msb_1_table_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3_fu_475", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2354", "EstimateLatencyMax" : "2354",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "d", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3", "PipelineType" : "NotSupport"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3_fu_475.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kw_1_fu_481", "Parent" : "0", "Child" : ["7", "8", "9"],
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
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kw_1_fu_481.conv1_kernel_V_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kw_1_fu_481.mac_muladd_10s_16s_26ns_26_4_1_U4", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kw_1_fu_481.mac_muladd_10s_16s_26ns_26_4_1_U5", "Parent" : "6"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3_fu_498", "Parent" : "0", "Child" : ["11"],
		"CDFG" : "inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7842", "EstimateLatencyMax" : "7842",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "d", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3", "PipelineType" : "NotSupport"}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3_fu_498.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_fu_504", "Parent" : "0", "Child" : ["13", "14", "15", "16"],
		"CDFG" : "inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41", "EstimateLatencyMax" : "41",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln66", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln68_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln68", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln66", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp27_i_not_mid1115", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp29_i_not_mid1117", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln83_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "conv2_kernel_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_kh_2_loop_kw_2_loop_ic_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_fu_504.conv2_kernel_V_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_fu_504.mac_muladd_11s_16s_26ns_26_4_1_U18", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_fu_504.mac_muladd_11s_16s_26ns_26_4_1_U19", "Parent" : "12"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_fu_504.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_fu_521", "Parent" : "0", "Child" : ["18", "19", "20", "21"],
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
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_fu_521.conv3_kernel_V_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_fu_521.mac_muladd_12s_16s_26ns_26_4_1_U32", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_fu_521.mac_muladd_12s_16s_26ns_26_4_1_U33", "Parent" : "17"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_fu_521.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_fu_537", "Parent" : "0", "Child" : ["23", "24", "25", "26"],
		"CDFG" : "inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41", "EstimateLatencyMax" : "41",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln147_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln147", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp23_i72_not_mid1364", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp25_i74_not_mid1366", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln162_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "conv_out_kernel_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_kh_out_loop_kw_out_loop_ic_out", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_fu_537.conv_out_kernel_V_U", "Parent" : "22"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_fu_537.mac_muladd_11s_16s_26ns_26_4_1_U45", "Parent" : "22"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_fu_537.mac_muladd_11s_16s_26ns_26_4_1_U46", "Parent" : "22"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_fu_537.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U55", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U56", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U57", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U58", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_50ns_50ns_100_1_1_U59", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_34ns_33s_34_38_seq_1_U60", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	inference {
		d {Type IO LastRead 2 FirstWrite -1}
		input_r {Type I LastRead 2 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 48}
		conv1_kernel_V {Type I LastRead -1 FirstWrite -1}
		conv2_bias_V {Type I LastRead -1 FirstWrite -1}
		conv2_kernel_V {Type I LastRead -1 FirstWrite -1}
		conv3_kernel_V {Type I LastRead -1 FirstWrite -1}
		conv_out_kernel_V {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table_V {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table_V {Type I LastRead -1 FirstWrite -1}}
	inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3 {
		d {Type IO LastRead 2 FirstWrite 2}}
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
		conv1_kernel_V {Type I LastRead -1 FirstWrite -1}}
	inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3 {
		d {Type IO LastRead 0 FirstWrite 1}}
	inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2 {
		sext_ln66 {Type I LastRead 0 FirstWrite -1}
		select_ln68_2 {Type I LastRead 0 FirstWrite -1}
		select_ln68 {Type I LastRead 0 FirstWrite -1}
		zext_ln66 {Type I LastRead 0 FirstWrite -1}
		cmp27_i_not_mid1115 {Type I LastRead 0 FirstWrite -1}
		cmp29_i_not_mid1117 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_4 {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 1 FirstWrite -1}
		s_V_15_out {Type O LastRead -1 FirstWrite 3}
		conv2_kernel_V {Type I LastRead -1 FirstWrite -1}}
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
		conv3_kernel_V {Type I LastRead -1 FirstWrite -1}}
	inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out {
		select_ln147_1 {Type I LastRead 0 FirstWrite -1}
		select_ln147 {Type I LastRead 0 FirstWrite -1}
		cmp23_i72_not_mid1364 {Type I LastRead 0 FirstWrite -1}
		cmp25_i74_not_mid1366 {Type I LastRead 0 FirstWrite -1}
		sext_ln162_1 {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 1 FirstWrite -1}
		s_V_18_out {Type O LastRead -1 FirstWrite 3}
		conv_out_kernel_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "510394", "Max" : "538618"}
	, {"Name" : "Interval", "Min" : "510394", "Max" : "538618"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	d { ap_memory {  { d_address0 mem_address 1 14 }  { d_ce0 mem_ce 1 1 }  { d_we0 mem_we 1 2 }  { d_d0 mem_din 1 16 }  { d_q0 mem_dout 0 16 }  { d_address1 MemPortADDR2 1 14 }  { d_ce1 MemPortCE2 1 1 }  { d_q1 MemPortDOUT2 0 16 } } }
	input_r { ap_memory {  { input_r_address0 mem_address 1 10 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 16 }  { input_r_address1 MemPortADDR2 1 10 }  { input_r_ce1 MemPortCE2 1 1 }  { input_r_q1 MemPortDOUT2 0 16 } } }
	output_r { ap_memory {  { output_r_address0 mem_address 1 10 }  { output_r_ce0 mem_ce 1 1 }  { output_r_we0 mem_we 1 1 }  { output_r_d0 mem_din 1 16 } } }
}
