

`timescale 1 ps / 1 ps
module dircc_processing_counter_tb (
	);

	import dircc_types_pkg::*;

	wire         dircc_processing_counter_inst_clk_bfm_clk_clk;          
	wire         dircc_processing_counter_inst_reset_bfm_reset_reset;

    wire [31:0]  dircc_processing_counter_inst_input_data;
    wire [1:0]   dircc_processing_counter_inst_input_empty;
    wire         dircc_processing_counter_inst_input_startofpacket;
    wire         dircc_processing_counter_inst_input_endofpacket;
    wire         dircc_processing_counter_inst_input_ready;
    wire         dircc_processing_counter_inst_input_valid;

    wire [31:0]  dircc_processing_counter_inst_output_data;
    wire [1:0]   dircc_processing_counter_inst_output_empty;
    wire         dircc_processing_counter_inst_output_startofpacket;
    wire         dircc_processing_counter_inst_output_endofpacket;
    wire         dircc_processing_counter_inst_output_ready;
    wire         dircc_processing_counter_inst_output_valid;

    wire [14:0]  dircc_processing_counter_inst_mem_bfm_m0_address;
    wire [15:0]  dircc_processing_counter_inst_mem_bfm_m0_readdata;
    wire         dircc_processing_counter_inst_mem_bfm_m0_write;
    wire [15:0]  dircc_processing_counter_inst_mem_bfm_m0_writedata;

	logic [31:0]  dircc_processing_counter_inst_address;

	dircc_processing dircc_processing_counter_inst (
		.clk          	  				(dircc_processing_counter_inst_clk_bfm_clk_clk),          		   //          clk.clk
		.reset_n    	  				(dircc_processing_counter_inst_reset_bfm_reset_reset),    		   //        reset.reset_n

        .input_data                     (dircc_processing_counter_inst_input_data),
        .input_empty                    (dircc_processing_counter_inst_input_empty),
        .input_startofpacket            (dircc_processing_counter_inst_input_startofpacket),
        .input_endofpacket              (dircc_processing_counter_inst_input_endofpacket), 
        .input_ready                    (dircc_processing_counter_inst_input_ready),
        .input_valid                    (dircc_processing_counter_inst_input_valid),

        .output_data                    (dircc_processing_counter_inst_output_data),
        .output_empty                   (dircc_processing_counter_inst_output_empty),
        .output_startofpacket           (dircc_processing_counter_inst_output_startofpacket),
        .output_endofpacket             (dircc_processing_counter_inst_output_endofpacket),
        .output_ready                   (dircc_processing_counter_inst_output_ready),
        .output_valid                   (dircc_processing_counter_inst_output_valid),

        .mem_address                    (dircc_processing_counter_inst_mem_bfm_m0_address),
        .mem_readdata                   (dircc_processing_counter_inst_mem_bfm_m0_readdata),
        .mem_write                      (dircc_processing_counter_inst_mem_bfm_m0_write),
        .mem_writedata                  (dircc_processing_counter_inst_mem_bfm_m0_writedata),

		.address						(dircc_processing_counter_inst_address)
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) dircc_processing_counter_inst_clk_bfm (
		.clk (dircc_processing_counter_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) dircc_processing_counter_inst_reset_bfm (
		.reset (dircc_processing_counter_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (dircc_processing_counter_inst_clk_bfm_clk_clk)        //   clk.clk
	);

	altera_avalon_mm_master_bfm #(
		.AV_ADDRESS_W               (15),
		.AV_SYMBOL_W                (8),
		.AV_NUMSYMBOLS              (2),
		.AV_BURSTCOUNT_W            (1),
		.AV_READRESPONSE_W          (1),
		.AV_WRITERESPONSE_W         (1),
		.USE_READ                   (0),
		.USE_WRITE                  (1),
		.USE_ADDRESS                (1),
		.USE_BYTE_ENABLE            (0),
		.USE_BURSTCOUNT             (0),
		.USE_READ_DATA              (1),
		.USE_READ_DATA_VALID        (0),
		.USE_WRITE_DATA             (1),
		.USE_BEGIN_TRANSFER         (0),
		.USE_BEGIN_BURST_TRANSFER   (0),
		.USE_WAIT_REQUEST           (0),
		.USE_TRANSACTIONID          (0),
		.USE_WRITERESPONSE          (0),
		.USE_READRESPONSE           (0),
		.USE_CLKEN                  (0),
		.AV_CONSTANT_BURST_BEHAVIOR (1),
		.AV_BURST_LINEWRAP          (0),
		.AV_BURST_BNDR_ONLY         (0),
		.AV_MAX_PENDING_READS       (0),
		.AV_MAX_PENDING_WRITES      (0),
		.AV_FIX_READ_LATENCY        (0),
		.AV_READ_WAIT_TIME          (1),
		.AV_WRITE_WAIT_TIME         (0),
		.REGISTER_WAITREQUEST       (0),
		.AV_REGISTERINCOMINGSIGNALS (0),
		.VHDL_ID                    (0)
	) dircc_processing_counter_inst_status_bfm (
		.clk                    (dircc_processing_counter_inst_clk_bfm_clk_clk),        		//       clk.clk
		.reset                  (~dircc_processing_counter_inst_reset_bfm_reset_reset), 		// clk_reset.reset
		.avm_address            (dircc_processing_counter_inst_mem_bfm_m0_address),  			//        m0.address
		.avm_readdata           (dircc_processing_counter_inst_mem_bfm_m0_readdata), 			//          .readdata
		.avm_writedata          (dircc_processing_counter_inst_mem_bfm_m0_writedata), 			//          .writedata 
		.avm_write              (dircc_processing_counter_inst_mem_bfm_m0_write),              // 			.write   
		.avm_read               (),     													// (terminated)
		.avm_burstcount         (),                                                         // (terminated)                             // (terminated)
		.avm_begintransfer      (),                                                         // (terminated)
		.avm_beginbursttransfer (),                                                         // (terminated)
		.avm_waitrequest        (1'b0),                                                     // (terminated)
		.avm_byteenable         (),                                                         // (terminated)
		.avm_readdatavalid      (1'b0),                                                     // (terminated)
		.avm_arbiterlock        (),                                                         // (terminated)
		.avm_lock               (),                                                         // (terminated)
		.avm_debugaccess        (),                                                         // (terminated)
		.avm_transactionid      (),                                                         // (terminated)
		.avm_readid             (8'b00000000),                                              // (terminated)
		.avm_writeid            (8'b00000000),                                              // (terminated)
		.avm_clken              (),                                                         // (terminated)
		.avm_response           (2'b00),                                                    // (terminated)
		.avm_writeresponsevalid (1'b0),                                                     // (terminated)
		.avm_writeresponserequest(),													    // (terminated)
		.avm_readresponse       (1'b0),                                                     // (terminated)
		.avm_writeresponse      (1'b0)                                                      // (terminated)
	);

    altera_avalon_st_sink_bfm #(
		.USE_PACKET       (1),
		.USE_CHANNEL      (0),
		.USE_ERROR        (0),
		.USE_READY        (1),
		.USE_VALID        (1),
		.USE_EMPTY        (1),
		.ST_SYMBOL_W      (8),
		.ST_NUMSYMBOLS    (4),
		.ST_CHANNEL_W     (1),
		.ST_ERROR_W       (1),
		.ST_EMPTY_W       (2),
		.ST_READY_LATENCY (0),
		.ST_BEATSPERCYCLE (1),
		.ST_MAX_CHANNELS  (0),
		.VHDL_ID          (0)
	) dircc_processing_counter_inst_output_bfm (
		.clk                (dircc_processing_counter_inst_clk_bfm_clk_clk),           //       clk.clk
		.reset              (~dircc_processing_counter_inst_reset_bfm_reset_reset),    // clk_reset.reset
		.sink_data          (dircc_processing_counter_inst_output_data),          		//      sink.data
		.sink_valid         (dircc_processing_counter_inst_output_valid),         		//          .valid
		.sink_ready         (dircc_processing_counter_inst_output_ready),         		//          .ready
		.sink_startofpacket (dircc_processing_counter_inst_output_startofpacket), 		//          .startofpacket
		.sink_endofpacket   (dircc_processing_counter_inst_output_endofpacket),   		//          .endofpacket
		.sink_empty         (dircc_processing_counter_inst_output_empty),         		//          .empty
		.sink_channel       (1'b0),                                         				// (terminated)
		.sink_error         (1'b0)                                          				// (terminated)
	);

    altera_avalon_st_source_bfm #(
		.USE_PACKET       (1),
		.USE_CHANNEL      (0),
		.USE_ERROR        (0),
		.USE_READY        (1),
		.USE_VALID        (1),
		.USE_EMPTY        (1),
		.ST_SYMBOL_W      (8),
		.ST_NUMSYMBOLS    (4),
		.ST_CHANNEL_W     (1),
		.ST_ERROR_W       (1),
		.ST_EMPTY_W       (2),
		.ST_READY_LATENCY (0),
		.ST_BEATSPERCYCLE (1),
		.ST_MAX_CHANNELS  (0),
		.VHDL_ID          (0)
	) dircc_processing_counter_inst_input_bfm (
		.clk                (dircc_processing_counter_inst_clk_bfm_clk_clk),         //       clk.clk
		.reset              (~dircc_processing_counter_inst_reset_bfm_reset_reset),  // clk_reset.reset
		.src_data           (dircc_processing_counter_inst_input_data),          	//       src.data
		.src_valid          (dircc_processing_counter_inst_input_valid),         	//          .valid
		.src_ready          (dircc_processing_counter_inst_input_ready),         	//          .ready
		.src_startofpacket  (dircc_processing_counter_inst_input_startofpacket), 	//          .startofpacket
		.src_endofpacket    (dircc_processing_counter_inst_input_endofpacket),   	//          .endofpacket
		.src_empty          (dircc_processing_counter_inst_input_empty),         	//          .empty
		.src_channel        (),                                         					// (terminated)
		.src_error          ()                                          					// (terminated)
	);



endmodule : dircc_processing_counter_tb
