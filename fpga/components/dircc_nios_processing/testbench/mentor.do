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
# Copy generated memory initialization hex and dat file(s) to current directory
file_copy
file copy -force /home/patrick/Documents/Coursework/DiRCC/software/dircc_processing_testbench/mem_init/hdl_sim/dircc_nios_processing_mem.dat ./ 
file copy -force /home/patrick/Documents/Coursework/DiRCC/software/dircc_processing_testbench/mem_init/dircc_nios_processing_mem.hex ./ 
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
eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/dircc_nios_processing_tb/simulation/dircc_nios_processing_test.sv" -L altera_common_sv_packages                                                                                                                               
#
# Set the top-level simulation or testbench module/entity name, which is
# used by the elab command to elaborate the top level.
#
set TOP_LEVEL_NAME dircc_nios_processing_test
#
# Call command to elaborate your design and testbench.
elab
#
# Run the simulation.
run -a
#
# Report success to the shell.
# exit -code 0
#
# TOP-LEVEL TEMPLATE - END
