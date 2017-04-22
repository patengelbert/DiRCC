	dircc_nios_processing u0 (
		.address_address          (<connected-to-address_address>),          //          address.address
		.clk_processing_clk       (<connected-to-clk_processing_clk>),       //   clk_processing.clk
		.clk_routing_clk          (<connected-to-clk_routing_clk>),          //      clk_routing.clk
		.mem_address              (<connected-to-mem_address>),              //              mem.address
		.mem_chipselect           (<connected-to-mem_chipselect>),           //                 .chipselect
		.mem_clken                (<connected-to-mem_clken>),                //                 .clken
		.mem_write                (<connected-to-mem_write>),                //                 .write
		.mem_readdata             (<connected-to-mem_readdata>),             //                 .readdata
		.mem_writedata            (<connected-to-mem_writedata>),            //                 .writedata
		.mem_byteenable           (<connected-to-mem_byteenable>),           //                 .byteenable
		.reset_processing_reset_n (<connected-to-reset_processing_reset_n>), // reset_processing.reset_n
		.reset_routing_reset_n    (<connected-to-reset_routing_reset_n>),    //    reset_routing.reset_n
		.stream_in_valid          (<connected-to-stream_in_valid>),          //        stream_in.valid
		.stream_in_data           (<connected-to-stream_in_data>),           //                 .data
		.stream_in_startofpacket  (<connected-to-stream_in_startofpacket>),  //                 .startofpacket
		.stream_in_endofpacket    (<connected-to-stream_in_endofpacket>),    //                 .endofpacket
		.stream_in_empty          (<connected-to-stream_in_empty>),          //                 .empty
		.stream_in_ready          (<connected-to-stream_in_ready>),          //                 .ready
		.stream_out_valid         (<connected-to-stream_out_valid>),         //       stream_out.valid
		.stream_out_data          (<connected-to-stream_out_data>),          //                 .data
		.stream_out_startofpacket (<connected-to-stream_out_startofpacket>), //                 .startofpacket
		.stream_out_endofpacket   (<connected-to-stream_out_endofpacket>),   //                 .endofpacket
		.stream_out_empty         (<connected-to-stream_out_empty>),         //                 .empty
		.stream_out_ready         (<connected-to-stream_out_ready>)          //                 .ready
	);

