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
set USER_DEFINED_COMPILE_OPTIONS "+define+DIRCC_SCALING_COUNT_LIMIT=2500000 +define+DIRCC_SCALING_ACTIVE_THREADS=25"
#
# Call command to compile the Quartus EDA simulation library.
dev_com
#
# Call command to compile the Quartus-generated IP simulation files.
ensure_lib                            ./libraries/dircc_processing_scaling/
vmap       dircc_processing_scaling   ./libraries/dircc_processing_scaling/
com
#
# Add commands to compile all design files and testbench files, including
# the top level. (These are all the files required for simulation other
# than the files compiled by the Quartus-generated IP simulation script)
#
# vlog <compilation options> <design and testbench files>

eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_types.sv"                                                    -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_system_states_pkg.sv"                                        -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_application_pkg.sv.scaling"                               -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_scaling_compute_handler.sv"                                  -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_scaling_receive_handler.sv"                                  -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_scaling_rts_handler.sv"                                      -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_scaling_send_handler.sv"                                     -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_processing.sv"                                               -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_avalon_st_packet_sender.sv"                                  -work dircc_processing_scaling
eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                           -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_avalon_st_packet_receiver.sv"                                -work dircc_processing_scaling
eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dircc_status_register.sv"                                          -work dircc_processing_scaling
  
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
eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L router -L output_demux -L input_mux -L input_fifo_east -L routing -L dircc_processing_scaling -L dircc_address -L rst_controller -L terminal_east_0 -L node_8 -L node_7 -L node_65544 -L node_65543 -L node_65542 -L node_65541 -L node_65540 -L node_65539 -L node_65538 -L node_65537 -L node_65536 -L node_6 -L node_5 -L node_4 -L node_3 -L node_2 -L node_131080 -L node_131079 -L node_131078 -L node_131077 -L node_131076 -L node_131075 -L node_131074 -L node_131073 -L node_131072 -L node_1 -L node_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
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

force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_address 100 20ns, 110 22ns, 1000 24ns, 1010 26ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_write 1 20ns, 1 22ns, 1 24ns, 1 26ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_writedata 0 20ns, 0 22ns, 0 24ns, 0 26ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_address 100 32ns, 110 34ns, 1000 36ns, 1010 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 1 32ns, 1 34ns, 1 36ns, 1 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_writedata 0 32ns, 0 34ns, 0 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_address 100 44ns, 110 46ns, 1000 48ns, 1010 50ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 1 44ns, 1 46ns, 1 48ns, 1 50ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_writedata 0 44ns, 0 46ns, 0 48ns, 0 50ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_address 100 128ns, 110 130ns, 1000 132ns, 1010 134ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 1 128ns, 1 130ns, 1 132ns, 1 134ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_writedata 0 128ns, 0 130ns, 0 132ns, 0 134ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_address 100 164ns, 110 166ns, 1000 168ns, 1010 170ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 1 164ns, 1 166ns, 1 168ns, 1 170ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_writedata 0 164ns, 0 166ns, 0 168ns, 0 170ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_address 100 200ns, 110 202ns, 1000 204ns, 1010 206ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 1 200ns, 1 202ns, 1 204ns, 1 206ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_writedata 0 200ns, 0 202ns, 0 204ns, 0 206ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_address 100 214ns, 110 216ns, 1000 218ns, 1010 220ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 1 214ns, 1 216ns, 1 218ns, 1 220ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_writedata 0 214ns, 0 216ns, 0 218ns, 0 220ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_address 100 286ns, 110 288ns, 1000 290ns, 1010 292ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 1 286ns, 1 288ns, 1 290ns, 1 292ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_writedata 0 286ns, 0 288ns, 0 290ns, 0 292ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_address 100 298ns, 110 300ns, 1000 302ns, 1010 304ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 1 298ns, 1 300ns, 1 302ns, 1 304ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_writedata 0 298ns, 0 300ns, 0 302ns, 0 304ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 100 56ns, 110 58ns, 1000 60ns, 1010 62ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 56ns, 1 58ns, 1 60ns, 1 62ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 0 56ns, 0 58ns, 0 60ns, 0 62ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 100 68ns, 110 70ns, 1000 72ns, 1010 74ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 68ns, 1 70ns, 1 72ns, 1 74ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 0 68ns, 0 70ns, 0 72ns, 0 74ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 100 80ns, 110 82ns, 1000 84ns, 1010 86ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 80ns, 1 82ns, 1 84ns, 1 86ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 0 80ns, 0 82ns, 0 84ns, 0 86ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_address 100 140ns, 110 142ns, 1000 144ns, 1010 146ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 1 140ns, 1 142ns, 1 144ns, 1 146ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_writedata 0 140ns, 0 142ns, 0 144ns, 0 146ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_address 100 176ns, 110 178ns, 1000 180ns, 1010 182ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 1 176ns, 1 178ns, 1 180ns, 1 182ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_writedata 0 176ns, 0 178ns, 0 180ns, 0 182ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_address 100 226ns, 110 228ns, 1000 230ns, 1010 232ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 1 226ns, 1 228ns, 1 230ns, 1 232ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_writedata 0 226ns, 0 228ns, 0 230ns, 0 232ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_address 100 238ns, 110 240ns, 1000 242ns, 1010 244ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 1 238ns, 1 240ns, 1 242ns, 1 244ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_writedata 0 238ns, 0 240ns, 0 242ns, 0 244ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_address 100 310ns, 110 312ns, 1000 314ns, 1010 316ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_write 1 310ns, 1 312ns, 1 314ns, 1 316ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_writedata 0 310ns, 0 312ns, 0 314ns, 0 316ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_address 100 92ns, 110 94ns, 1000 96ns, 1010 98ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 1 92ns, 1 94ns, 1 96ns, 1 98ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_writedata 0 92ns, 0 94ns, 0 96ns, 0 98ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_address 100 104ns, 110 106ns, 1000 108ns, 1010 110ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 1 104ns, 1 106ns, 1 108ns, 1 110ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 0 104ns, 0 106ns, 0 108ns, 0 110ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 100 116ns, 110 118ns, 1000 120ns, 1010 122ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 116ns, 1 118ns, 1 120ns, 1 122ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 0 116ns, 0 118ns, 0 120ns, 0 122ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_address 100 152ns, 110 154ns, 1000 156ns, 1010 158ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 1 152ns, 1 154ns, 1 156ns, 1 158ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_writedata 0 152ns, 0 154ns, 0 156ns, 0 158ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_address 100 188ns, 110 190ns, 1000 192ns, 1010 194ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 1 188ns, 1 190ns, 1 192ns, 1 194ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_writedata 0 188ns, 0 190ns, 0 192ns, 0 194ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_address 100 250ns, 110 252ns, 1000 254ns, 1010 256ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 1 250ns, 1 252ns, 1 254ns, 1 256ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_writedata 0 250ns, 0 252ns, 0 254ns, 0 256ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_address 100 262ns, 110 264ns, 1000 266ns, 1010 268ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_write 1 262ns, 1 264ns, 1 266ns, 1 268ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_writedata 0 262ns, 0 264ns, 0 266ns, 0 268ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_address 100 262ns, 110 264ns, 1000 266ns, 1010 268ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_write 1 262ns, 1 264ns, 1 266ns, 1 268ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_writedata 0 262ns, 0 264ns, 0 266ns, 0 268ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_address 100 274ns, 110 276ns, 1000 278ns, 1010 280ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_write 1 274ns, 1 276ns, 1 278ns, 1 280ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_writedata 0 274ns, 0 276ns, 0 278ns, 0 280ns


# Write launch state
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_address 0 28ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_write 1 28ns, 0 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_writedata 100000 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_address 0 40ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 1 40ns, 0 42ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_writedata 100000 40ns, 0 42ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_address 0 52ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 1 52ns, 0 54ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_writedata 100000 52ns, 0 54ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_address 0 136ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 1 136ns, 0 138ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_writedata 100000 136ns, 0 138ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_address 0 172ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 1 172ns, 0 174ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_writedata 100000 172ns, 0 174ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_address 0 210ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 1 210ns, 0 212ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_writedata 100000 210ns, 0 212ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_address 0 222ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 1 222ns, 0 224ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_writedata 100000 222ns, 0 224ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_address 0 294ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 1 294ns, 0 296ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_writedata 100000 294ns, 0 296ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_address 0 306ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 1 306ns, 0 308ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_writedata 100000 306ns, 0 308ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 0 64ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 64ns, 0 66ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 100000 64ns, 0 66ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 0 76ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 76ns, 0 78ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 100000 76ns, 0 78ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 0 88ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 88ns, 0 90ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 100000 88ns, 0 90ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_address 0 148ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 1 148ns, 0 150ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_writedata 100000 148ns, 0 150ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_address 0 184ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 1 184ns, 0 186ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_writedata 100000 184ns, 0 186ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_address 0 234ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 1 234ns, 0 236ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_writedata 100000 234ns, 0 236ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_address 0 246ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 1 246ns, 0 248ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_writedata 100000 246ns, 0 248ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_address 0 318ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_write 1 318ns, 0 320ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_writedata 100000 318ns, 0 320ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_writedata 100000 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_address 0 100ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 1 100ns, 0 102ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_writedata 100000 100ns, 0 102ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_address 0 112ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 1 112ns, 0 114ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 100000 112ns, 0 114ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 0 124ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 124ns, 0 126ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 100000 124ns, 0 126ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_address 0 160ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 1 160ns, 0 162ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_writedata 100000 160ns, 0 162ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_address 0 196ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 1 196ns, 0 198ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_writedata 100000 196ns, 0 198ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_address 0 258ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 1 258ns, 0 260ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_writedata 100000 258ns, 0 260ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_address 0 270ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_write 1 270ns, 0 272ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_writedata 100000 270ns, 0 272ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_address 0 282ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_write 1 282ns, 0 284ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_writedata 10 282ns, 0 284ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_address 0 92ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_write 1 92ns, 0 94ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_writedata 10 92ns, 0 94ns

# Run the simulation.
run -a
#
# Report success to the shell.
# exit -code 0
#
# TOP-LEVEL TEMPLATE - END