############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project denoiser
set_top denoiser_top
add_files ../denoiser_c_to_hls/top.cpp
add_files ../denoiser_c_to_hls/denoiser.h
add_files ../denoiser_c_to_hls/denoiser.cpp
add_files ../denoiser_c_to_hls/conv_out_weights.h
add_files ../denoiser_c_to_hls/conv3_weights.h
add_files ../denoiser_c_to_hls/conv2_weights.h
add_files ../denoiser_c_to_hls/conv1_weights.h
add_files -tb ../hls_test_data -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../denoiser_c_to_hls/main.cpp -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xck26-sfvc784-2LV-c}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./denoiser/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -trace_level all
export_design -rtl verilog -format ip_catalog
