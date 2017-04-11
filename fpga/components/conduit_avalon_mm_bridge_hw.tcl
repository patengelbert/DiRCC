# TCL File Generated by Component Editor 16.1
# Tue Apr 11 18:19:14 BST 2017
# DO NOT MODIFY


# 
# conduit_avalon_mm_bridge "Conduit To Avalon MM Bridge" v1.0
#  2017.04.11.18:19:14
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module conduit_avalon_mm_bridge
# 
set_module_property DESCRIPTION ""
set_module_property NAME conduit_avalon_mm_bridge
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "Conduit To Avalon MM Bridge"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL conduit_avalon_mm_bridge
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file conduit_avalon_mm_bridge.v VERILOG PATH conduit_avalon_mm_bridge/conduit_avalon_mm_bridge.v TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL conduit_avalon_mm_bridge
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file conduit_avalon_mm_bridge.v VERILOG PATH conduit_avalon_mm_bridge/conduit_avalon_mm_bridge.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk_in clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_in reset Input 1


# 
# connection point out
# 
add_interface out avalon end
set_interface_property out addressUnits WORDS
set_interface_property out associatedClock clock
set_interface_property out associatedReset reset
set_interface_property out bitsPerSymbol 8
set_interface_property out burstOnBurstBoundariesOnly false
set_interface_property out burstcountUnits WORDS
set_interface_property out explicitAddressSpan 0
set_interface_property out holdTime 0
set_interface_property out linewrapBursts false
set_interface_property out maximumPendingReadTransactions 0
set_interface_property out maximumPendingWriteTransactions 0
set_interface_property out readLatency 0
set_interface_property out readWaitTime 1
set_interface_property out setupTime 0
set_interface_property out timingUnits Cycles
set_interface_property out writeWaitTime 0
set_interface_property out ENABLED true
set_interface_property out EXPORT_OF ""
set_interface_property out PORT_NAME_MAP ""
set_interface_property out CMSIS_SVD_VARIABLES ""
set_interface_property out SVD_ADDRESS_GROUP ""

add_interface_port out out_address address Input 1
add_interface_port out out_read read Input 1
add_interface_port out out_readdata readdata Output 32
set_interface_assignment out embeddedsw.configuration.isFlash 0
set_interface_assignment out embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment out embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment out embeddedsw.configuration.isPrintableDevice 0


# 
# connection point address
# 
add_interface address conduit end
set_interface_property address associatedClock ""
set_interface_property address associatedReset ""
set_interface_property address ENABLED true
set_interface_property address EXPORT_OF ""
set_interface_property address PORT_NAME_MAP ""
set_interface_property address CMSIS_SVD_VARIABLES ""
set_interface_property address SVD_ADDRESS_GROUP ""

add_interface_port address in_data address Input 32

