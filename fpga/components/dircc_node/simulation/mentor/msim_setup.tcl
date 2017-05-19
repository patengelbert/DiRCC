
# (C) 2001-2017 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     dircc_node
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "mentor.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/mentor/msim_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog <compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If dircc_node is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 16.1 196 linux 2017.04.11.18:05:44

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "dircc_node"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "/media/DATA_LINUX/opt/intelFPGA_lite/16.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_rf_ram_b.mif ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/submodules/dircc_node_processing_mem.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                       ./libraries/altera_ver/           
  vmap       altera_ver            ./libraries/altera_ver/           
  ensure_lib                       ./libraries/lpm_ver/              
  vmap       lpm_ver               ./libraries/lpm_ver/              
  ensure_lib                       ./libraries/sgate_ver/            
  vmap       sgate_ver             ./libraries/sgate_ver/            
  ensure_lib                       ./libraries/altera_mf_ver/        
  vmap       altera_mf_ver         ./libraries/altera_mf_ver/        
  ensure_lib                       ./libraries/altera_lnsim_ver/     
  vmap       altera_lnsim_ver      ./libraries/altera_lnsim_ver/     
  ensure_lib                       ./libraries/cyclonev_ver/         
  vmap       cyclonev_ver          ./libraries/cyclonev_ver/         
  ensure_lib                       ./libraries/cyclonev_hssi_ver/    
  vmap       cyclonev_hssi_ver     ./libraries/cyclonev_hssi_ver/    
  ensure_lib                       ./libraries/cyclonev_pcie_hip_ver/
  vmap       cyclonev_pcie_hip_ver ./libraries/cyclonev_pcie_hip_ver/
}
ensure_lib                                        ./libraries/error_adapter_0/                       
vmap       error_adapter_0                        ./libraries/error_adapter_0/                       
ensure_lib                                        ./libraries/channel_adapter_0/                     
vmap       channel_adapter_0                      ./libraries/channel_adapter_0/                     
ensure_lib                                        ./libraries/avalon_st_adapter/                     
vmap       avalon_st_adapter                      ./libraries/avalon_st_adapter/                     
ensure_lib                                        ./libraries/crosser/                               
vmap       crosser                                ./libraries/crosser/                               
ensure_lib                                        ./libraries/rsp_mux_001/                           
vmap       rsp_mux_001                            ./libraries/rsp_mux_001/                           
ensure_lib                                        ./libraries/rsp_mux/                               
vmap       rsp_mux                                ./libraries/rsp_mux/                               
ensure_lib                                        ./libraries/rsp_demux/                             
vmap       rsp_demux                              ./libraries/rsp_demux/                             
ensure_lib                                        ./libraries/cmd_mux_001/                           
vmap       cmd_mux_001                            ./libraries/cmd_mux_001/                           
ensure_lib                                        ./libraries/cmd_mux/                               
vmap       cmd_mux                                ./libraries/cmd_mux/                               
ensure_lib                                        ./libraries/cmd_demux_001/                         
vmap       cmd_demux_001                          ./libraries/cmd_demux_001/                         
ensure_lib                                        ./libraries/cmd_demux/                             
vmap       cmd_demux                              ./libraries/cmd_demux/                             
ensure_lib                                        ./libraries/router_003/                            
vmap       router_003                             ./libraries/router_003/                            
ensure_lib                                        ./libraries/router_002/                            
vmap       router_002                             ./libraries/router_002/                            
ensure_lib                                        ./libraries/router_001/                            
vmap       router_001                             ./libraries/router_001/                            
ensure_lib                                        ./libraries/router/                                
vmap       router                                 ./libraries/router/                                
ensure_lib                                        ./libraries/jtag_uart_avalon_jtag_slave_agent/     
vmap       jtag_uart_avalon_jtag_slave_agent      ./libraries/jtag_uart_avalon_jtag_slave_agent/     
ensure_lib                                        ./libraries/cpu_data_master_agent/                 
vmap       cpu_data_master_agent                  ./libraries/cpu_data_master_agent/                 
ensure_lib                                        ./libraries/jtag_uart_avalon_jtag_slave_translator/
vmap       jtag_uart_avalon_jtag_slave_translator ./libraries/jtag_uart_avalon_jtag_slave_translator/
ensure_lib                                        ./libraries/cpu_data_master_translator/            
vmap       cpu_data_master_translator             ./libraries/cpu_data_master_translator/            
ensure_lib                                        ./libraries/cpu/                                   
vmap       cpu                                    ./libraries/cpu/                                   
ensure_lib                                        ./libraries/timing_adapter_0/                      
vmap       timing_adapter_0                       ./libraries/timing_adapter_0/                      
ensure_lib                                        ./libraries/avalon_st_adapter_001/                 
vmap       avalon_st_adapter_001                  ./libraries/avalon_st_adapter_001/                 
ensure_lib                                        ./libraries/output_demux/                          
vmap       output_demux                           ./libraries/output_demux/                          
ensure_lib                                        ./libraries/input_mux/                             
vmap       input_mux                              ./libraries/input_mux/                             
ensure_lib                                        ./libraries/input_fifo_east/                       
vmap       input_fifo_east                        ./libraries/input_fifo_east/                       
ensure_lib                                        ./libraries/rst_controller/                        
vmap       rst_controller                         ./libraries/rst_controller/                        
ensure_lib                                        ./libraries/irq_mapper/                            
vmap       irq_mapper                             ./libraries/irq_mapper/                            
ensure_lib                                        ./libraries/mm_interconnect_0/                     
vmap       mm_interconnect_0                      ./libraries/mm_interconnect_0/                     
ensure_lib                                        ./libraries/timer/                                 
vmap       timer                                  ./libraries/timer/                                 
ensure_lib                                        ./libraries/mem/                                   
vmap       mem                                    ./libraries/mem/                                   
ensure_lib                                        ./libraries/jtag_uart/                             
vmap       jtag_uart                              ./libraries/jtag_uart/                             
ensure_lib                                        ./libraries/fifo_out/                              
vmap       fifo_out                               ./libraries/fifo_out/                              
ensure_lib                                        ./libraries/fifo_in/                               
vmap       fifo_in                                ./libraries/fifo_in/                               
ensure_lib                                        ./libraries/conduit_avalon_mm_bridge_0/            
vmap       conduit_avalon_mm_bridge_0             ./libraries/conduit_avalon_mm_bridge_0/            
ensure_lib                                        ./libraries/routing/                               
vmap       routing                                ./libraries/routing/                               
ensure_lib                                        ./libraries/processing/                            
vmap       processing                             ./libraries/processing/                            
ensure_lib                                        ./libraries/dircc_address/                         
vmap       dircc_address                          ./libraries/dircc_address/                         

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                     -work altera_ver           
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                              -work lpm_ver              
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                 -work sgate_ver            
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                             -work altera_mf_ver        
    eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                         -work altera_lnsim_ver     
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v"          -work cyclonev_ver         
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                        -work cyclonev_ver         
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                   -work cyclonev_hssi_ver    
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"               -work cyclonev_pcie_hip_ver
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0                       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_routing_avalon_st_adapter_001_channel_adapter_0.sv"                -work channel_adapter_0                     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_routing_avalon_st_adapter_channel_adapter_0.sv"                    -work channel_adapter_0                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter                     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                   -work crosser                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                             -work crosser                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                             -work crosser                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                              -work crosser                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_rsp_mux_001.sv"                       -work rsp_mux_001                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux_001                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                             
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_cmd_mux_001.sv"                       -work cmd_mux_001                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work cmd_mux_001                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work cmd_mux                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_cmd_demux_001.sv"                     -work cmd_demux_001                         
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                             
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_router_003.sv"                        -work router_003                            
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_router_002.sv"                        -work router_002                            
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_router_001.sv"                        -work router_001                            
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0_router.sv"                            -work router                                
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                 -work jtag_uart_avalon_jtag_slave_agent     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                          -work jtag_uart_avalon_jtag_slave_agent     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                -work cpu_data_master_agent                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                            -work jtag_uart_avalon_jtag_slave_translator
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                           -work cpu_data_master_translator            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_debug_slave_sysclk.v"                           -work cpu                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_test_bench.v"                                   -work cpu                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_debug_slave_wrapper.v"                          -work cpu                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu_debug_slave_tck.v"                              -work cpu                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_cpu_cpu.v"                                              -work cpu                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_avalon_st_adapter_001_timing_adapter_0.sv"                         -work timing_adapter_0                      
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_avalon_st_adapter_001_timing_adapter_0_fifo.sv"                    -work timing_adapter_0                      
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_avalon_st_adapter_timing_adapter_0.sv"                             -work timing_adapter_0                      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_routing_avalon_st_adapter_001.v"                                   -work avalon_st_adapter_001                 
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_routing_avalon_st_adapter.v"                                       -work avalon_st_adapter                     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_router.sv"                                                              -work router                                
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_routing_output_demux.sv"                                           -work output_demux                          
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_routing_input_mux.sv"                                              -work input_mux                             
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                      -work input_fifo_east                       
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                    -work rst_controller                        
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                  -work rst_controller                        
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_node_processing_irq_mapper.sv"                                          -work irq_mapper                            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_mm_interconnect_0.v"                                    -work mm_interconnect_0                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_timer.v"                                                -work timer                                 
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_mem.v"                                                  -work mem                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_jtag_uart.v"                                            -work jtag_uart                             
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_fifo_out.v"                                             -work fifo_out                              
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_fifo_in.v"                                              -work fifo_in                               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing_cpu.v"                                                  -work cpu                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/conduit_avalon_mm_bridge.v"                                                   -work conduit_avalon_mm_bridge_0            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_avalon_st_adapter_001.v"                                           -work avalon_st_adapter_001                 
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_avalon_st_adapter.v"                                               -work avalon_st_adapter                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_routing.v"                                                         -work routing                               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_node_processing.v"                                                      -work processing                            
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_address_gen.sv"                                                         -work dircc_address                         
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/dircc_node.v"                                                                                                                        
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L error_adapter_0 -L channel_adapter_0 -L avalon_st_adapter -L crosser -L rsp_mux_001 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_001 -L cmd_demux -L router_003 -L router_002 -L router_001 -L router -L jtag_uart_avalon_jtag_slave_agent -L cpu_data_master_agent -L jtag_uart_avalon_jtag_slave_translator -L cpu_data_master_translator -L cpu -L timing_adapter_0 -L avalon_st_adapter_001 -L output_demux -L input_mux -L input_fifo_east -L rst_controller -L irq_mapper -L mm_interconnect_0 -L timer -L mem -L jtag_uart -L fifo_out -L fifo_in -L conduit_avalon_mm_bridge_0 -L routing -L processing -L dircc_address -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L error_adapter_0 -L channel_adapter_0 -L avalon_st_adapter -L crosser -L rsp_mux_001 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_001 -L cmd_demux -L router_003 -L router_002 -L router_001 -L router -L jtag_uart_avalon_jtag_slave_agent -L cpu_data_master_agent -L jtag_uart_avalon_jtag_slave_translator -L cpu_data_master_translator -L cpu -L timing_adapter_0 -L avalon_st_adapter_001 -L output_demux -L input_mux -L input_fifo_east -L rst_controller -L irq_mapper -L mm_interconnect_0 -L timer -L mem -L jtag_uart -L fifo_out -L fifo_in -L conduit_avalon_mm_bridge_0 -L routing -L processing -L dircc_address -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h