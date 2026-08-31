vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_13
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_13
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/blk_mem_gen_v8_4_5
vlib modelsim_lib/msim/axi_bram_ctrl_v4_1_7
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_27
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/axi_data_fifo_v2_1_26
vlib modelsim_lib/msim/axi_crossbar_v2_1_28
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_27
vlib modelsim_lib/msim/axi_clock_converter_v2_1_26
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_27
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 modelsim_lib/msim/axi_vip_v1_1_13
vmap zynq_ultra_ps_e_vip_v1_0_13 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_13
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap blk_mem_gen_v8_4_5 modelsim_lib/msim/blk_mem_gen_v8_4_5
vmap axi_bram_ctrl_v4_1_7 modelsim_lib/msim/axi_bram_ctrl_v4_1_7
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_27 modelsim_lib/msim/axi_register_slice_v2_1_27
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 modelsim_lib/msim/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 modelsim_lib/msim/axi_crossbar_v2_1_28
vmap axi_protocol_converter_v2_1_27 modelsim_lib/msim/axi_protocol_converter_v2_1_27
vmap axi_clock_converter_v2_1_26 modelsim_lib/msim/axi_clock_converter_v2_1_26
vmap axi_dwidth_converter_v2_1_27 modelsim_lib/msim/axi_dwidth_converter_v2_1_27
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_13  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/sim/design_1_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_control_s_axi.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_d_RAM_AUTO_1R1W.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_denoiser_top_Pipeline_VITIS_LOOP_18_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_denoiser_top_Pipeline_VITIS_LOOP_25_2.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_flow_control_loop_pipe_sequential_init.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_gmem0_m_axi.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_gmem1_m_axi.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_in_buf_V_RAM_AUTO_1R1W.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_conv2_bias_V_ROM_AUTO_1R.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_exp_x_msb_1_table_V_ROM_AUTO_1R.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_f_x_msb_2_table_V_ROM_AUTO_1R.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_conv2_kernel_V_ROM_AUTO_1R.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_conv3_kernel_V_ROM_AUTO_1R.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_conv_out_kernel_V_ROM_bkb.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kw_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_loop_kw_1_conv1_kernel_V_ROM_AUTO_1R.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_mac_muladd_10s_16s_26ns_26_4_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_mac_muladd_11s_16s_26ns_26_4_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_mac_muladd_12s_16s_26ns_26_4_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_mul_50ns_50ns_100_1_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_mux_42_16_1_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_out_buf8_RAM_AUTO_1R1W.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top_sdiv_34ns_33s_34_38_seq_1.v" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/26fe/hdl/verilog/denoiser_top.v" \
"../../../bd/design_1/ip/design_1_denoiser_top_0_0/sim/design_1_denoiser_top_0_0.v" \

vlog -work blk_mem_gen_v8_4_5  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_1/sim/design_1_blk_mem_gen_0_1.v" \

vcom -work axi_bram_ctrl_v4_1_7  -93  \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/f80b/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_1/sim/design_1_axi_bram_ctrl_0_1.vhd" \

vlog -work generic_baseblocks_v2_1_0  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93  \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_27  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_26  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_27  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
"../../../bd/design_1/ip/design_1_auto_us_1/sim/design_1_auto_us_1.v" \
"../../../bd/design_1/ip/design_1_auto_ds_0/sim/design_1_auto_ds_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/ip/design_1_auto_ds_1/sim/design_1_auto_ds_1.v" \
"../../../bd/design_1/ip/design_1_auto_ds_2/sim/design_1_auto_ds_2.v" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93  \
"../../../../denoiser.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/design_1/ip/design_1_rst_ps8_0_99M_0/sim/design_1_rst_ps8_0_99M_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../../denoiser.gen/sources_1/bd/design_1/ip/design_1_denoiser_top_0_0/drivers/denoiser_top_v1_0/src" "+incdir+C:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

