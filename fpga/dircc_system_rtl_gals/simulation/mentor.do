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
set TOP_LEVEL_NAME dircc_system_rtl_gals
#
# Set any elaboration options you require.
set USER_DEFINED_ELAB_OPTIONS ""
#
# Call command to elaborate your design and testbench.
elab
#
# Set up waves
# Clock
force -freeze sim:/dircc_system_rtl_gals/clk_clk 1 0, 0 {1ns} -r 2ns
# Reset_n
force -freeze sim:/dircc_system_rtl_gals/reset_reset_n 0 0, 1 10ns
force -freeze sim:/dircc_system_rtl_gals/node_0_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_1_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_2_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_65536_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_65537_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_65538_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_131072_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_131073_mem_write 0 0
force -freeze sim:/dircc_system_rtl_gals/node_131074_mem_write 0 0

# Write initial state

force -freeze sim:/dircc_system_rtl_gals/node_1_mem_address 100 24ns, 110 26ns, 1000 28ns, 1010 30ns
force -freeze sim:/dircc_system_rtl_gals/node_1_mem_write 1 24ns, 1 26ns, 1 28ns, 1 30ns
force -freeze sim:/dircc_system_rtl_gals/node_1_mem_writedata 0 24ns, 100 26ns, 0 28ns, 0 30ns

force -freeze sim:/dircc_system_rtl_gals/node_65536_mem_address 100 40ns, 110 42ns, 1000 44ns, 1010 46ns 
force -freeze sim:/dircc_system_rtl_gals/node_65536_mem_write 1 40ns, 1 42ns, 1 44ns, 1 46ns
force -freeze sim:/dircc_system_rtl_gals/node_65536_mem_writedata 0 40ns, 100 42ns, 0 44ns, 0 46ns

force -freeze sim:/dircc_system_rtl_gals/node_65537_mem_address 100 52ns, 110 54ns, 1000 56ns, 1010 58ns
force -freeze sim:/dircc_system_rtl_gals/node_65537_mem_write 1 52ns, 1 54ns, 1 56ns, 1 58ns
force -freeze sim:/dircc_system_rtl_gals/node_65537_mem_writedata 0 52ns, 10000 54ns, 0 56ns, 0 58ns

force -freeze sim:/dircc_system_rtl_gals/node_65538_mem_address 100 64ns, 110 66ns, 1000 68ns, 1010 70ns 
force -freeze sim:/dircc_system_rtl_gals/node_65538_mem_write 1 64ns, 1 66ns, 1 68ns, 1 70ns
force -freeze sim:/dircc_system_rtl_gals/node_65538_mem_writedata 0 64ns, 100 66ns, 0 68ns, 0 70ns

force -freeze sim:/dircc_system_rtl_gals/node_131073_mem_address 100 80ns, 110 82ns, 1000 84ns, 1010 86ns 
force -freeze sim:/dircc_system_rtl_gals/node_131073_mem_write 1 80ns, 1 82ns, 1 84ns, 1 86ns
force -freeze sim:/dircc_system_rtl_gals/node_131073_mem_writedata 0 80ns, 100 82ns, 0 84ns, 0 86ns


# Write launch state
force -freeze sim:/dircc_system_rtl_gals/node_0_mem_address 0 20ns
force -freeze sim:/dircc_system_rtl_gals/node_0_mem_write 1 20ns, 0 22ns
force -freeze sim:/dircc_system_rtl_gals/node_0_mem_writedata 10 20ns, 0 22ns

force -freeze sim:/dircc_system_rtl_gals/node_1_mem_address 0 32ns
force -freeze sim:/dircc_system_rtl_gals/node_1_mem_write 1 32ns, 0 34ns
force -freeze sim:/dircc_system_rtl_gals/node_1_mem_writedata 100000 32ns, 0 34ns

force -freeze sim:/dircc_system_rtl_gals/node_2_mem_address 0 36ns
force -freeze sim:/dircc_system_rtl_gals/node_2_mem_write 1 36ns, 0 38ns
force -freeze sim:/dircc_system_rtl_gals/node_2_mem_writedata 10 36ns, 0 38ns

force -freeze sim:/dircc_system_rtl_gals/node_65536_mem_address 0 48ns
force -freeze sim:/dircc_system_rtl_gals/node_65536_mem_write 1 48ns, 0 50ns
force -freeze sim:/dircc_system_rtl_gals/node_65536_mem_writedata 100000 48ns, 0 50ns

force -freeze sim:/dircc_system_rtl_gals/node_65537_mem_address 0 60ns
force -freeze sim:/dircc_system_rtl_gals/node_65537_mem_write 1 60ns, 0 62ns
force -freeze sim:/dircc_system_rtl_gals/node_65537_mem_writedata 100000 60ns, 0 62ns

force -freeze sim:/dircc_system_rtl_gals/node_65538_mem_address 0 72ns
force -freeze sim:/dircc_system_rtl_gals/node_65538_mem_write 1 72ns, 0 74ns
force -freeze sim:/dircc_system_rtl_gals/node_65538_mem_writedata 100000 72ns, 0 74ns

force -freeze sim:/dircc_system_rtl_gals/node_131072_mem_address 0 76ns
force -freeze sim:/dircc_system_rtl_gals/node_131072_mem_write 1 76ns, 0 78ns
force -freeze sim:/dircc_system_rtl_gals/node_131072_mem_writedata 10 76ns, 0 78ns

force -freeze sim:/dircc_system_rtl_gals/node_131073_mem_address 0 88ns
force -freeze sim:/dircc_system_rtl_gals/node_131073_mem_write 1 88ns, 0 90ns
force -freeze sim:/dircc_system_rtl_gals/node_131073_mem_writedata 100000 88ns, 0 90ns

force -freeze sim:/dircc_system_rtl_gals/node_131074_mem_address 0 92ns
force -freeze sim:/dircc_system_rtl_gals/node_131074_mem_write 1 92ns, 0 94ns
force -freeze sim:/dircc_system_rtl_gals/node_131074_mem_writedata 10 92ns, 0 94ns

# Run the simulation.
run -a
#
# Report success to the shell.
# exit -code 0
#
# TOP-LEVEL TEMPLATE - END