
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
#     dircc_system_rtl_gals_test_version
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
# If dircc_system_rtl_gals_test_version is one of several IP cores in your
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
# ACDS 16.1 203 linux 2017.06.06.12:47:22

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "dircc_system_rtl_gals_test_version"
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
ensure_lib                            ./libraries/router/                    
vmap       router                     ./libraries/router/                    
ensure_lib                            ./libraries/output_demux/              
vmap       output_demux               ./libraries/output_demux/              
ensure_lib                            ./libraries/input_mux/                 
vmap       input_mux                  ./libraries/input_mux/                 
ensure_lib                            ./libraries/input_fifo_east/           
vmap       input_fifo_east            ./libraries/input_fifo_east/           
ensure_lib                            ./libraries/routing/                   
vmap       routing                    ./libraries/routing/                   
ensure_lib                            ./libraries/dircc_processing_gals_heat/
vmap       dircc_processing_gals_heat ./libraries/dircc_processing_gals_heat/
ensure_lib                            ./libraries/dircc_address/             
vmap       dircc_address              ./libraries/dircc_address/             
ensure_lib                            ./libraries/rst_controller/            
vmap       rst_controller             ./libraries/rst_controller/            
ensure_lib                            ./libraries/terminal_east_0/           
vmap       terminal_east_0            ./libraries/terminal_east_0/           
ensure_lib                            ./libraries/node_8/                    
vmap       node_8                     ./libraries/node_8/                    
ensure_lib                            ./libraries/node_7/                    
vmap       node_7                     ./libraries/node_7/                    
ensure_lib                            ./libraries/node_65544/                
vmap       node_65544                 ./libraries/node_65544/                
ensure_lib                            ./libraries/node_65543/                
vmap       node_65543                 ./libraries/node_65543/                
ensure_lib                            ./libraries/node_65542/                
vmap       node_65542                 ./libraries/node_65542/                
ensure_lib                            ./libraries/node_65541/                
vmap       node_65541                 ./libraries/node_65541/                
ensure_lib                            ./libraries/node_65540/                
vmap       node_65540                 ./libraries/node_65540/                
ensure_lib                            ./libraries/node_65539/                
vmap       node_65539                 ./libraries/node_65539/                
ensure_lib                            ./libraries/node_65538/                
vmap       node_65538                 ./libraries/node_65538/                
ensure_lib                            ./libraries/node_65537/                
vmap       node_65537                 ./libraries/node_65537/                
ensure_lib                            ./libraries/node_65536/                
vmap       node_65536                 ./libraries/node_65536/                
ensure_lib                            ./libraries/node_6/                    
vmap       node_6                     ./libraries/node_6/                    
ensure_lib                            ./libraries/node_5/                    
vmap       node_5                     ./libraries/node_5/                    
ensure_lib                            ./libraries/node_4/                    
vmap       node_4                     ./libraries/node_4/                    
ensure_lib                            ./libraries/node_3/                    
vmap       node_3                     ./libraries/node_3/                    
ensure_lib                            ./libraries/node_2/                    
vmap       node_2                     ./libraries/node_2/                    
ensure_lib                            ./libraries/node_131080/               
vmap       node_131080                ./libraries/node_131080/               
ensure_lib                            ./libraries/node_131079/               
vmap       node_131079                ./libraries/node_131079/               
ensure_lib                            ./libraries/node_131078/               
vmap       node_131078                ./libraries/node_131078/               
ensure_lib                            ./libraries/node_131077/               
vmap       node_131077                ./libraries/node_131077/               
ensure_lib                            ./libraries/node_131076/               
vmap       node_131076                ./libraries/node_131076/               
ensure_lib                            ./libraries/node_131075/               
vmap       node_131075                ./libraries/node_131075/               
ensure_lib                            ./libraries/node_131074/               
vmap       node_131074                ./libraries/node_131074/               
ensure_lib                            ./libraries/node_131073/               
vmap       node_131073                ./libraries/node_131073/               
ensure_lib                            ./libraries/node_131072/               
vmap       node_131072                ./libraries/node_131072/               
ensure_lib                            ./libraries/node_1/                    
vmap       node_1                     ./libraries/node_1/                    
ensure_lib                            ./libraries/node_0/                    
vmap       node_0                     ./libraries/node_0/                    

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
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_router.sv"                                                   -work router                    
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_0_routing_output_demux.sv" -work output_demux              
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_0_routing_input_mux.sv"    -work input_mux                 
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                           -work input_fifo_east           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_8_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_7_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65544_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65543_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65542_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65541_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65540_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65539_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65538_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65537_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65536_routing.v"           -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_6_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_5_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_4_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_3_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_2_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131080_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131079_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131078_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131077_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131076_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131075_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131074_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131073_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131072_routing.v"          -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_1_routing.v"               -work routing                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_0_routing.v"               -work routing                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_types.sv"                                                    -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_system_states_pkg.sv"                                        -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_application_pkg.sv"                                          -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_gals_compute_handler.sv"                                     -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_gals_receive_handler.sv"                                     -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_gals_rts_handler.sv"                                         -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_gals_send_handler.sv"                                        -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_processing.sv"                                               -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_avalon_st_packet_sender.sv"                                  -work dircc_processing_gals_heat
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                           -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_avalon_st_packet_receiver.sv"                                -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_status_register.sv"                                          -work dircc_processing_gals_heat
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_address_gen.sv"                                              -work dircc_address             
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                         -work rst_controller            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                       -work rst_controller            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_avalon_st_terminal.v"                                        -work terminal_east_0           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_8.v"                       -work node_8                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_7.v"                       -work node_7                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65544.v"                   -work node_65544                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65543.v"                   -work node_65543                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65542.v"                   -work node_65542                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65541.v"                   -work node_65541                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65540.v"                   -work node_65540                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65539.v"                   -work node_65539                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65538.v"                   -work node_65538                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65537.v"                   -work node_65537                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_65536.v"                   -work node_65536                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_6.v"                       -work node_6                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_5.v"                       -work node_5                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_4.v"                       -work node_4                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_3.v"                       -work node_3                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_2.v"                       -work node_2                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131080.v"                  -work node_131080               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131079.v"                  -work node_131079               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131078.v"                  -work node_131078               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131077.v"                  -work node_131077               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131076.v"                  -work node_131076               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131075.v"                  -work node_131075               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131074.v"                  -work node_131074               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131073.v"                  -work node_131073               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_131072.v"                  -work node_131072               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_1.v"                       -work node_1                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/dircc_system_rtl_gals_test_version_node_0.v"                       -work node_0                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/dircc_system_rtl_gals_test_version.v"                                                                         
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L router -L output_demux -L input_mux -L input_fifo_east -L routing -L dircc_processing_gals_heat -L dircc_address -L rst_controller -L terminal_east_0 -L node_8 -L node_7 -L node_65544 -L node_65543 -L node_65542 -L node_65541 -L node_65540 -L node_65539 -L node_65538 -L node_65537 -L node_65536 -L node_6 -L node_5 -L node_4 -L node_3 -L node_2 -L node_131080 -L node_131079 -L node_131078 -L node_131077 -L node_131076 -L node_131075 -L node_131074 -L node_131073 -L node_131072 -L node_1 -L node_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L router -L output_demux -L input_mux -L input_fifo_east -L routing -L dircc_processing_gals_heat -L dircc_address -L rst_controller -L terminal_east_0 -L node_8 -L node_7 -L node_65544 -L node_65543 -L node_65542 -L node_65541 -L node_65540 -L node_65539 -L node_65538 -L node_65537 -L node_65536 -L node_6 -L node_5 -L node_4 -L node_3 -L node_2 -L node_131080 -L node_131079 -L node_131078 -L node_131077 -L node_131076 -L node_131075 -L node_131074 -L node_131073 -L node_131072 -L node_1 -L node_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
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
