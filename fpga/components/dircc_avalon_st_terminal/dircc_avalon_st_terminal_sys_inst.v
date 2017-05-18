	dircc_avalon_st_terminal_sys u0 (
		.clk_clk          (<connected-to-clk_clk>),          //    clk.clk
		.reset_reset_n    (<connected-to-reset_reset_n>),    //  reset.reset_n
		.s1_data          (<connected-to-s1_data>),          //     s1.data
		.s1_empty         (<connected-to-s1_empty>),         //       .empty
		.s1_endofpacket   (<connected-to-s1_endofpacket>),   //       .endofpacket
		.s1_ready         (<connected-to-s1_ready>),         //       .ready
		.s1_startofpacket (<connected-to-s1_startofpacket>), //       .startofpacket
		.s1_valid         (<connected-to-s1_valid>),         //       .valid
		.status_readdata  (<connected-to-status_readdata>),  // status.readdata
		.status_address   (<connected-to-status_address>),   //       .address
		.status_read_n    (<connected-to-status_read_n>)     //       .read_n
	);

