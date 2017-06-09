# TOP-LEVEL TEMPLATE - BEGIN
#
# QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# construct paths to the files required to simulate the IP in your Quartus
# project. By default, the IP script assumes that you are launching the
# simulator from the IP script location. If launching from another
# location, set QSYS_SIMDIR to the output directory you specified when you
# generated the IP script, relative to the directory from which you launch
# the simulator.
#
set QSYS_SIMDIR ./
#
# Source the generated IP simulation script.
source $QSYS_SIMDIR/mentor/msim_setup.tcl
#
# Set any compilation options you require (this is unusual).
set USER_DEFINED_COMPILE_OPTIONS ""
#
# Call command to compile the Quartus EDA simulation library.
dev_com
#
# Call command to compile the Quartus-generated IP simulation files.
ensure_lib                            ./libraries/dircc_processing_latency/
vmap       dircc_processing_latency ./libraries/dircc_processing_latency/
com
#
# Add commands to compile all design files and testbench files, including
# the top level. (These are all the files required for simulation other
# than the files compiled by the Quartus-generated IP simulation script)
#
# vlog <compilation options> <design and testbench files>

eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_types.sv"                                                    -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_system_states_pkg.sv"                                        -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_application_pkg.sv.throughput"                               -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_spammer_compute_handler.sv"                                  -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_spammer_receive_handler.sv"                                  -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_spammer_rts_handler.sv"                                      -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_spammer_send_handler.sv"                                     -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_processing.sv"                                               -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_avalon_st_packet_sender.sv"                                  -work dircc_processing_latency
eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                           -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_avalon_st_packet_receiver.sv"                                -work dircc_processing_latency
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_status_register.sv"                                          -work dircc_processing_latency
  
#
# Set the top-level simulation or testbench module/entity name, which is
# used by the elab command to elaborate the top level.
#
set TOP_LEVEL_NAME dircc_system_rtl_gals_test_version
#
# Set any elaboration options you require.
set USER_DEFINED_ELAB_OPTIONS ""
#
# Call command to elaborate your design and testbench.
eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L router -L output_demux -L input_mux -L input_fifo_east -L routing -L dircc_processing_latency -L dircc_address -L rst_controller -L terminal_east_0 -L node_8 -L node_7 -L node_65544 -L node_65543 -L node_65542 -L node_65541 -L node_65540 -L node_65539 -L node_65538 -L node_65537 -L node_65536 -L node_6 -L node_5 -L node_4 -L node_3 -L node_2 -L node_131080 -L node_131079 -L node_131078 -L node_131077 -L node_131076 -L node_131075 -L node_131074 -L node_131073 -L node_131072 -L node_1 -L node_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
#
# Set up waves
# Clock
force -freeze sim:/dircc_system_rtl_gals_test_version/clk_clk 1 0, 0 {1ns} -r 2ns
# Reset_n
force -freeze sim:/dircc_system_rtl_gals_test_version/reset_reset_n 0 0, 1 10ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_write 0 0

# Write initial state

force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns


force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns


force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_writedata 0 24ns, 0 26ns, 0 28ns, 0 30ns



# Write launch state
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_writedata 10 32ns, 0 34ns

# Run the simulation.
run 1ms
#
# Report success to the shell.
# exit -code 0
#
# TOP-LEVEL TEMPLATE - END