set SynModuleInfo {
  {SRCNAME denoiser_top_Pipeline_VITIS_LOOP_18_1 MODELNAME denoiser_top_Pipeline_VITIS_LOOP_18_1 RTLNAME denoiser_top_denoiser_top_Pipeline_VITIS_LOOP_18_1
    SUBMODULES {
      {MODELNAME denoiser_top_flow_control_loop_pipe_sequential_init RTLNAME denoiser_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME denoiser_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME inference_Pipeline_loop_kw_1 MODELNAME inference_Pipeline_loop_kw_1 RTLNAME denoiser_top_inference_Pipeline_loop_kw_1
    SUBMODULES {
      {MODELNAME denoiser_top_mac_muladd_10s_16s_26ns_26_4_1 RTLNAME denoiser_top_mac_muladd_10s_16s_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_inference_Pipeline_loop_kw_1_conv1_kernel_V_ROM_AUTO_1R RTLNAME denoiser_top_inference_Pipeline_loop_kw_1_conv1_kernel_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3 MODELNAME inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3 RTLNAME denoiser_top_inference_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2_VITIS_LOOP_47_3}
  {SRCNAME inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2 MODELNAME inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2 RTLNAME denoiser_top_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2
    SUBMODULES {
      {MODELNAME denoiser_top_mac_muladd_11s_16s_26ns_26_4_1 RTLNAME denoiser_top_mac_muladd_11s_16s_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_conv2_kernel_V_ROM_AUTO_1R RTLNAME denoiser_top_inference_Pipeline_loop_kh_2_loop_kw_2_loop_ic_2_conv2_kernel_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3 MODELNAME inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3 RTLNAME denoiser_top_inference_Pipeline_VITIS_LOOP_97_1_VITIS_LOOP_98_2_VITIS_LOOP_99_3}
  {SRCNAME inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3 MODELNAME inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3 RTLNAME denoiser_top_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3
    SUBMODULES {
      {MODELNAME denoiser_top_mac_muladd_12s_16s_26ns_26_4_1 RTLNAME denoiser_top_mac_muladd_12s_16s_26ns_26_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_conv3_kernel_V_ROM_AUTO_1R RTLNAME denoiser_top_inference_Pipeline_loop_kh_3_loop_kw_3_loop_ic_3_conv3_kernel_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out MODELNAME inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out RTLNAME denoiser_top_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out
    SUBMODULES {
      {MODELNAME denoiser_top_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_conv_out_kernel_V_ROM_bkb RTLNAME denoiser_top_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_conv_out_kernel_V_ROM_bkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME inference MODELNAME inference RTLNAME denoiser_top_inference
    SUBMODULES {
      {MODELNAME denoiser_top_mux_42_16_1_1 RTLNAME denoiser_top_mux_42_16_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_mul_50ns_50ns_100_1_1 RTLNAME denoiser_top_mul_50ns_50ns_100_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_sdiv_34ns_33s_34_38_seq_1 RTLNAME denoiser_top_sdiv_34ns_33s_34_38_seq_1 BINDTYPE op TYPE sdiv IMPL auto_seq LATENCY 37 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_inference_conv2_bias_V_ROM_AUTO_1R RTLNAME denoiser_top_inference_conv2_bias_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_inference_f_x_msb_2_table_V_ROM_AUTO_1R RTLNAME denoiser_top_inference_f_x_msb_2_table_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_inference_exp_x_msb_1_table_V_ROM_AUTO_1R RTLNAME denoiser_top_inference_exp_x_msb_1_table_V_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME denoiser_top_Pipeline_VITIS_LOOP_25_2 MODELNAME denoiser_top_Pipeline_VITIS_LOOP_25_2 RTLNAME denoiser_top_denoiser_top_Pipeline_VITIS_LOOP_25_2}
  {SRCNAME denoiser_top MODELNAME denoiser_top RTLNAME denoiser_top IS_TOP 1
    SUBMODULES {
      {MODELNAME denoiser_top_d_RAM_AUTO_1R1W RTLNAME denoiser_top_d_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_in_buf_V_RAM_AUTO_1R1W RTLNAME denoiser_top_in_buf_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_out_buf8_RAM_AUTO_1R1W RTLNAME denoiser_top_out_buf8_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME denoiser_top_gmem0_m_axi RTLNAME denoiser_top_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME denoiser_top_gmem1_m_axi RTLNAME denoiser_top_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME denoiser_top_control_s_axi RTLNAME denoiser_top_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
