set_global_assignment -entity "dircc_routing" -library "lib_dircc_routing" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "dircc_routing" -library "lib_dircc_routing" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "dircc_routing" -library "lib_dircc_routing" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_dircc_routing" -name SPD_FILE [file join $::quartus(sip_path) "../dircc_routing.spd"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "../../dircc_routing.qsys"]

set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "dircc_routing.v"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dircc_routing_avalon_st_adapter_001.v"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dircc_routing_avalon_st_adapter_001_channel_adapter_0.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dircc_routing_avalon_st_adapter.v"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dircc_routing_avalon_st_adapter_channel_adapter_0.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/interface.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/test_read_write.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/top.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dircc_router.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dircc_routing_output_demux.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dircc_routing_input_mux.sv"]
set_global_assignment -library "lib_dircc_routing" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_sc_fifo.v"]
