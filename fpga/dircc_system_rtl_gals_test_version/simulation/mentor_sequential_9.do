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
com
#
# Add commands to compile all design files and testbench files, including
# the top level. (These are all the files required for simulation other
# than the files compiled by the Quartus-generated IP simulation script)
#
# vlog <compilation options> <design and testbench files>
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
elab
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
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_writedata 0 20ns, 1000 22ns, 0 24ns, 0 26ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_address 100 32ns, 110 34ns, 1000 36ns, 1010 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 1 32ns, 1 34ns, 1 36ns, 1 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_writedata 0 32ns, 1100 34ns, 0 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_address 100 44ns, 110 46ns, 1000 48ns, 1010 50ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 1 44ns, 1 46ns, 1 48ns, 1 50ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_writedata 0 44ns, 1000 46ns, 0 48ns, 0 50ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 100 56ns, 110 58ns, 1000 60ns, 1010 62ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 56ns, 1 58ns, 1 60ns, 1 62ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 0 56ns, 1100 58ns, 0 60ns, 0 62ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 100 68ns, 110 70ns, 1000 72ns, 1010 74ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 68ns, 1 70ns, 1 72ns, 1 74ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 0 68ns, 10000 70ns, 0 72ns, 0 74ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 100 80ns, 110 82ns, 1000 84ns, 1010 86ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 80ns, 1 82ns, 1 84ns, 1 86ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 0 80ns, 1100 82ns, 0 84ns, 0 86ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_address 100 92ns, 110 94ns, 1000 96ns, 1010 98ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 1 92ns, 1 94ns, 1 96ns, 1 98ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_writedata 0 92ns, 1000 94ns, 0 96ns, 0 98ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_address 100 104ns, 110 106ns, 1000 108ns, 1010 110ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 1 104ns, 1 106ns, 1 108ns, 1 110ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 0 104ns, 1100 106ns, 0 108ns, 0 110ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 100 116ns, 110 118ns, 1000 120ns, 1010 122ns 
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 116ns, 1 118ns, 1 120ns, 1 122ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 0 116ns, 1000 118ns, 0 120ns, 0 122ns


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

force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 0 64ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 64ns, 0 66ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 100000 64ns, 0 66ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 0 76ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 76ns, 0 78ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 100000 76ns, 0 78ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 0 88ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 88ns, 0 90ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 100000 88ns, 0 90ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_address 0 100ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 1 100ns, 0 102ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_writedata 100000 100ns, 0 102ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_address 0 112ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 1 112ns, 0 114ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 100000 112ns, 0 114ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 0 124ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 124ns, 0 126ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 100000 124ns, 0 126ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_address 0 92ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 1 92ns, 0 94ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_writedata 10 92ns, 0 94ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_address 0 92ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 1 92ns, 0 94ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_writedata 10 92ns, 0 94ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_address 0 92ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 1 92ns, 0 94ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_writedata 10 92ns, 0 94ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_address 0 92ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_write 1 92ns, 0 94ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_writedata 10 92ns, 0 94ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_address 0 92ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_write 1 92ns, 0 94ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_writedata 10 92ns, 0 94ns

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