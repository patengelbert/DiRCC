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

force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_writedata 0 24ns, 10000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_writedata 0 24ns, 10000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_writedata 0 24ns, 10000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_writedata 0 24ns, 1000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_writedata 0 24ns, 10000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns


force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 0 24ns, 1000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_writedata 0 24ns, 1000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_writedata 0 24ns, 1000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_writedata 0 24ns, 10000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65543_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65544_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns


force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131072_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131078_mem_writedata 0 24ns, 10000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131079_mem_writedata 0 24ns, 10000 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131080_mem_writedata 0 24ns, 1100 26ns, 0 28ns, 0 30ns



# Write launch state
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_0_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_1_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_2_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_3_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_4_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_5_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_6_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_7_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_8_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65536_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65537_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65538_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65539_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65540_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65541_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_65542_mem_writedata 100000 32ns, 0 34ns

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
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131073_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131074_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131075_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131076_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals_test_version/node_131077_mem_writedata 100000 32ns, 0 34ns

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
run -a
#
# Report success to the shell.
# exit -code 0
#
# TOP-LEVEL TEMPLATE - END