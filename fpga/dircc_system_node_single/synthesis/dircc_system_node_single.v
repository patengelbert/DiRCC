// dircc_system_node_single.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module dircc_system_node_single (
		input  wire  clk_clk,       //   clk.clk
		input  wire  reset_reset_n  // reset.reset_n
	);

	dircc_system_node_single_node_0 node_0 (
		.clk_processing_clk         (clk_clk),       //   clk_processing.clk
		.clk_routing_clk            (clk_clk),       //      clk_routing.clk
		.input_east_data            (),              //       input_east.data
		.input_east_valid           (),              //                 .valid
		.input_east_ready           (),              //                 .ready
		.input_east_startofpacket   (),              //                 .startofpacket
		.input_east_endofpacket     (),              //                 .endofpacket
		.input_east_empty           (),              //                 .empty
		.input_north_data           (),              //      input_north.data
		.input_north_valid          (),              //                 .valid
		.input_north_ready          (),              //                 .ready
		.input_north_startofpacket  (),              //                 .startofpacket
		.input_north_endofpacket    (),              //                 .endofpacket
		.input_north_empty          (),              //                 .empty
		.input_south_data           (),              //      input_south.data
		.input_south_valid          (),              //                 .valid
		.input_south_ready          (),              //                 .ready
		.input_south_startofpacket  (),              //                 .startofpacket
		.input_south_endofpacket    (),              //                 .endofpacket
		.input_south_empty          (),              //                 .empty
		.input_west_data            (),              //       input_west.data
		.input_west_valid           (),              //                 .valid
		.input_west_ready           (),              //                 .ready
		.input_west_startofpacket   (),              //                 .startofpacket
		.input_west_endofpacket     (),              //                 .endofpacket
		.input_west_empty           (),              //                 .empty
		.output_east_data           (),              //      output_east.data
		.output_east_valid          (),              //                 .valid
		.output_east_ready          (),              //                 .ready
		.output_east_startofpacket  (),              //                 .startofpacket
		.output_east_endofpacket    (),              //                 .endofpacket
		.output_east_empty          (),              //                 .empty
		.output_north_data          (),              //     output_north.data
		.output_north_valid         (),              //                 .valid
		.output_north_ready         (),              //                 .ready
		.output_north_startofpacket (),              //                 .startofpacket
		.output_north_endofpacket   (),              //                 .endofpacket
		.output_north_empty         (),              //                 .empty
		.output_south_data          (),              //     output_south.data
		.output_south_valid         (),              //                 .valid
		.output_south_ready         (),              //                 .ready
		.output_south_startofpacket (),              //                 .startofpacket
		.output_south_endofpacket   (),              //                 .endofpacket
		.output_south_empty         (),              //                 .empty
		.output_west_data           (),              //      output_west.data
		.output_west_valid          (),              //                 .valid
		.output_west_ready          (),              //                 .ready
		.output_west_startofpacket  (),              //                 .startofpacket
		.output_west_endofpacket    (),              //                 .endofpacket
		.output_west_empty          (),              //                 .empty
		.processing_mem_address     (),              //   processing_mem.address
		.processing_mem_chipselect  (),              //                 .chipselect
		.processing_mem_clken       (),              //                 .clken
		.processing_mem_write       (),              //                 .write
		.processing_mem_readdata    (),              //                 .readdata
		.processing_mem_writedata   (),              //                 .writedata
		.processing_mem_byteenable  (),              //                 .byteenable
		.reset_processing_reset_n   (reset_reset_n), // reset_processing.reset_n
		.reset_routing_reset_n      (reset_reset_n)  //    reset_routing.reset_n
	);

endmodule
