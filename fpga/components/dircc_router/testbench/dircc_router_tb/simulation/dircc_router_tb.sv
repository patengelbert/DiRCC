

`timescale 1 ps / 1 ps
module dircc_router_tb (
	);

	wire         dircc_router_inst_clk_bfm_clk_clk;          
	wire         dircc_router_inst_reset_bfm_reset_reset;

    wire [31:0]  dircc_router_inst_input_data;
    wire [1:0]   dircc_router_inst_input_empty;
    wire         dircc_router_inst_input_startofpacket;
    wire         dircc_router_inst_input_endofpacket;
    wire         dircc_router_inst_input_ready;
    wire         dircc_router_inst_input_valid;
	wire [2:0]	 dircc_router_inst_input_channel;

    wire [31:0]  dircc_router_inst_output_data;
    wire [1:0]   dircc_router_inst_output_empty;
    wire         dircc_router_inst_output_startofpacket;
    wire         dircc_router_inst_output_endofpacket;
    wire         dircc_router_inst_output_ready;
    wire         dircc_router_inst_output_valid;
	wire [2:0]	 dircc_router_inst_output_channel;

	logic [31:0]  dircc_router_inst_address;

	dircc_router #(
		.SYMBOLS_PER_BEAT(4),
		.BITS_PER_SYMBOL(8),
		.CHANNEL_WIDTH(3)
	)	dircc_router_inst (
		.clk          	  				(dircc_router_inst_clk_bfm_clk_clk),          		   //          clk.clk
		.reset_n    	  				(dircc_router_inst_reset_bfm_reset_reset),    		   //        reset.reset_n

        .in_data                     (dircc_router_inst_input_data),
        .in_empty                    (dircc_router_inst_input_empty),
        .in_startofpacket            (dircc_router_inst_input_startofpacket),
        .in_endofpacket              (dircc_router_inst_input_endofpacket), 
        .in_ready                    (dircc_router_inst_input_ready),
        .in_valid                    (dircc_router_inst_input_valid),
		.in_channel					 (dircc_router_inst_input_channel),

        .out_data                    (dircc_router_inst_output_data),
        .out_empty                   (dircc_router_inst_output_empty),
        .out_startofpacket           (dircc_router_inst_output_startofpacket),
        .out_endofpacket             (dircc_router_inst_output_endofpacket),
        .out_ready                   (dircc_router_inst_output_ready),
        .out_valid                   (dircc_router_inst_output_valid),
		.out_channel				 (dircc_router_inst_output_channel),

		.address						(dircc_router_inst_address)
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) dircc_router_inst_clk_bfm (
		.clk (dircc_router_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) dircc_router_inst_reset_bfm (
		.reset (dircc_router_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (dircc_router_inst_clk_bfm_clk_clk)        //   clk.clk
	);

    altera_avalon_st_sink_bfm #(
		.USE_PACKET       (1),
		.USE_CHANNEL      (1),
		.USE_ERROR        (0),
		.USE_READY        (1),
		.USE_VALID        (1),
		.USE_EMPTY        (1),
		.ST_SYMBOL_W      (8),
		.ST_NUMSYMBOLS    (4),
		.ST_CHANNEL_W     (3),
		.ST_ERROR_W       (1),
		.ST_EMPTY_W       (2),
		.ST_READY_LATENCY (0),
		.ST_BEATSPERCYCLE (1),
		.ST_MAX_CHANNELS  (5),
		.VHDL_ID          (0)
	) dircc_router_inst_output_bfm (
		.clk                (dircc_router_inst_clk_bfm_clk_clk),           //       clk.clk
		.reset              (~dircc_router_inst_reset_bfm_reset_reset),    // clk_reset.reset
		.sink_data          (dircc_router_inst_output_data),          		//      sink.data
		.sink_valid         (dircc_router_inst_output_valid),         		//          .valid
		.sink_ready         (dircc_router_inst_output_ready),         		//          .ready
		.sink_startofpacket (dircc_router_inst_output_startofpacket), 		//          .startofpacket
		.sink_endofpacket   (dircc_router_inst_output_endofpacket),   		//          .endofpacket
		.sink_empty         (dircc_router_inst_output_empty),         		//          .empty
		.sink_channel       (dircc_router_inst_output_channel),                                         				// (terminated)
		.sink_error         (1'b0)                                          				// (terminated)
	);

    altera_avalon_st_source_bfm #(
		.USE_PACKET       (1),
		.USE_CHANNEL      (1),
		.USE_ERROR        (0),
		.USE_READY        (1),
		.USE_VALID        (1),
		.USE_EMPTY        (1),
		.ST_SYMBOL_W      (8),
		.ST_NUMSYMBOLS    (4),
		.ST_CHANNEL_W     (3),
		.ST_ERROR_W       (1),
		.ST_EMPTY_W       (2),
		.ST_READY_LATENCY (0),
		.ST_BEATSPERCYCLE (1),
		.ST_MAX_CHANNELS  (0),
		.VHDL_ID          (0)
	) dircc_router_inst_input_bfm (
		.clk                (dircc_router_inst_clk_bfm_clk_clk),         //       clk.clk
		.reset              (~dircc_router_inst_reset_bfm_reset_reset),  // clk_reset.reset
		.src_data           (dircc_router_inst_input_data),          	//       src.data
		.src_valid          (dircc_router_inst_input_valid),         	//          .valid
		.src_ready          (dircc_router_inst_input_ready),         	//          .ready
		.src_startofpacket  (dircc_router_inst_input_startofpacket), 	//          .startofpacket
		.src_endofpacket    (dircc_router_inst_input_endofpacket),   	//          .endofpacket
		.src_empty          (dircc_router_inst_input_empty),         	//          .empty
		.src_channel        (dircc_router_inst_input_channel),                                         					// (terminated)
		.src_error          ()                                          					// (terminated)
	);

endmodule : dircc_router_tb
