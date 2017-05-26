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
set TOP_LEVEL_NAME dircc_processing_counter_test_sys
#
# Set any elaboration options you require.
set USER_DEFINED_ELAB_OPTIONS ""
#
# Call command to elaborate your design and testbench.
elab
#
# Set up waves
# Clock
force -freeze sim:/dircc_processing_counter_test_sys/clk_clk 1 0, 0 {1ns} -r 2ns
# Reset_n
force -freeze sim:/dircc_processing_counter_test_sys/reset_reset_n 0 0, 1 10ns
force -freeze sim:/dircc_processing_counter_test_sys/node_0_mem_write 0 0
force -freeze sim:/dircc_processing_counter_test_sys/node_1_mem_write 0 0
force -freeze sim:/dircc_processing_counter_test_sys/node_65536_mem_write 0 0
force -freeze sim:/dircc_processing_counter_test_sys/node_65537_mem_write 0 0


# Write initial state

force -freeze sim:/dircc_processing_counter_test_sys/node_0_mem_address 100 20ns, 110 22ns, 1000 24ns, 1010 26ns
force -freeze sim:/dircc_processing_counter_test_sys/node_0_mem_write 1 20ns, 1 22ns, 1 24ns, 1 26ns
force -freeze sim:/dircc_processing_counter_test_sys/node_0_mem_writedata 0 20ns, 1 22ns, 0 24ns, 0 26ns

force -freeze sim:/dircc_processing_counter_test_sys/node_65537_mem_address 100 40ns, 110 42ns, 1000 44ns, 1010 46ns 
force -freeze sim:/dircc_processing_counter_test_sys/node_65537_mem_write 1 40ns, 1 42ns, 1 44ns, 1 46ns
force -freeze sim:/dircc_processing_counter_test_sys/node_65537_mem_writedata 0 40ns, 0 42ns, 0 44ns, 0 46ns

# Write launch state
force -freeze sim:/dircc_processing_counter_test_sys/node_0_mem_address 0 28ns
force -freeze sim:/dircc_processing_counter_test_sys/node_0_mem_write 1 28ns, 0 30ns
force -freeze sim:/dircc_processing_counter_test_sys/node_0_mem_writedata 100000 28ns, 0 30ns

force -freeze sim:/dircc_processing_counter_test_sys/node_1_mem_address 0 32ns
force -freeze sim:/dircc_processing_counter_test_sys/node_1_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_processing_counter_test_sys/node_1_mem_writedata 10 32ns, 0 34ns

force -freeze sim:/dircc_processing_counter_test_sys/node_65536_mem_address 0 36ns
force -freeze sim:/dircc_processing_counter_test_sys/node_65536_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_processing_counter_test_sys/node_65536_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_processing_counter_test_sys/node_65537_mem_address 0 48ns
force -freeze sim:/dircc_processing_counter_test_sys/node_65537_mem_write 1 48ns, 0 50ns
force -freeze sim:/dircc_processing_counter_test_sys/node_65537_mem_writedata 100000 48ns, 0 50ns

# Run the simulation.
run -a
#
# Report success to the shell.
# exit -code 0
#
# TOP-LEVEL TEMPLATE - END