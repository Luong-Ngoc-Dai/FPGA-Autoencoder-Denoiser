set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {denoiser_top} -view {{denoiser_top_dataflow_ana.wcfg}} -tclbatch {denoiser_top.tcl} -protoinst {denoiser_top.protoinst}
