// dircc_avalon_st_terminal_sys_tb.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module dircc_avalon_st_terminal_sys_tb (
	);

	wire  [15:0] dircc_avalon_st_terminal_sys_inst_status_bfm_m0_readdata;   // dircc_avalon_st_terminal_sys_inst:status_readdata -> dircc_avalon_st_terminal_sys_inst_status_bfm:avm_readdata
	wire   [1:0] dircc_avalon_st_terminal_sys_inst_status_bfm_m0_address;    // dircc_avalon_st_terminal_sys_inst_status_bfm:avm_address -> dircc_avalon_st_terminal_sys_inst:status_address
	wire         dircc_avalon_st_terminal_sys_inst_status_bfm_m0_read;       // dircc_avalon_st_terminal_sys_inst_status_bfm:avm_read -> dircc_avalon_st_terminal_sys_inst:status_read_n
	wire   [0:0] dircc_avalon_st_terminal_sys_inst_s1_bfm_src_valid;         // dircc_avalon_st_terminal_sys_inst_s1_bfm:src_valid -> dircc_avalon_st_terminal_sys_inst:s1_valid
	wire  [31:0] dircc_avalon_st_terminal_sys_inst_s1_bfm_src_data;          // dircc_avalon_st_terminal_sys_inst_s1_bfm:src_data -> dircc_avalon_st_terminal_sys_inst:s1_data
	wire         dircc_avalon_st_terminal_sys_inst_s1_bfm_src_ready;         // dircc_avalon_st_terminal_sys_inst:s1_ready -> dircc_avalon_st_terminal_sys_inst_s1_bfm:src_ready
	wire   [0:0] dircc_avalon_st_terminal_sys_inst_s1_bfm_src_startofpacket; // dircc_avalon_st_terminal_sys_inst_s1_bfm:src_startofpacket -> dircc_avalon_st_terminal_sys_inst:s1_startofpacket
	wire   [0:0] dircc_avalon_st_terminal_sys_inst_s1_bfm_src_endofpacket;   // dircc_avalon_st_terminal_sys_inst_s1_bfm:src_endofpacket -> dircc_avalon_st_terminal_sys_inst:s1_endofpacket
	wire   [1:0] dircc_avalon_st_terminal_sys_inst_s1_bfm_src_empty;         // dircc_avalon_st_terminal_sys_inst_s1_bfm:src_empty -> dircc_avalon_st_terminal_sys_inst:s1_empty
	wire         dircc_avalon_st_terminal_sys_inst_clk_bfm_clk_clk;          // dircc_avalon_st_terminal_sys_inst_clk_bfm:clk -> [dircc_avalon_st_terminal_sys_inst:clk_clk, dircc_avalon_st_terminal_sys_inst_reset_bfm:clk, dircc_avalon_st_terminal_sys_inst_s1_bfm:clk, dircc_avalon_st_terminal_sys_inst_status_bfm:clk]
	wire         dircc_avalon_st_terminal_sys_inst_reset_bfm_reset_reset;    // dircc_avalon_st_terminal_sys_inst_reset_bfm:reset -> [dircc_avalon_st_terminal_sys_inst:reset_reset_n, dircc_avalon_st_terminal_sys_inst_s1_bfm:reset, dircc_avalon_st_terminal_sys_inst_status_bfm:reset]

	dircc_avalon_st_terminal_sys dircc_avalon_st_terminal_sys_inst (
		.clk_clk          (dircc_avalon_st_terminal_sys_inst_clk_bfm_clk_clk),          //    clk.clk
		.reset_reset_n    (dircc_avalon_st_terminal_sys_inst_reset_bfm_reset_reset),    //  reset.reset_n
		.s1_data          (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_data),          //     s1.data
		.s1_empty         (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_empty),         //       .empty
		.s1_endofpacket   (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_endofpacket),   //       .endofpacket
		.s1_ready         (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_ready),         //       .ready
		.s1_startofpacket (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_startofpacket), //       .startofpacket
		.s1_valid         (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_valid),         //       .valid
		.status_readdata  (dircc_avalon_st_terminal_sys_inst_status_bfm_m0_readdata),   // status.readdata
		.status_address   (dircc_avalon_st_terminal_sys_inst_status_bfm_m0_address),    //       .address
		.status_read_n    (~dircc_avalon_st_terminal_sys_inst_status_bfm_m0_read)       //       .read_n
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) dircc_avalon_st_terminal_sys_inst_clk_bfm (
		.clk (dircc_avalon_st_terminal_sys_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) dircc_avalon_st_terminal_sys_inst_reset_bfm (
		.reset (dircc_avalon_st_terminal_sys_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (dircc_avalon_st_terminal_sys_inst_clk_bfm_clk_clk)        //   clk.clk
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
	) dircc_avalon_st_terminal_sys_inst_s1_bfm (
		.clk               (dircc_avalon_st_terminal_sys_inst_clk_bfm_clk_clk),          //       clk.clk
		.reset             (~dircc_avalon_st_terminal_sys_inst_reset_bfm_reset_reset),   // clk_reset.reset
		.src_data          (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_data),          //       src.data
		.src_valid         (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_valid),         //          .valid
		.src_ready         (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_ready),         //          .ready
		.src_startofpacket (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_startofpacket), //          .startofpacket
		.src_endofpacket   (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_endofpacket),   //          .endofpacket
		.src_empty         (dircc_avalon_st_terminal_sys_inst_s1_bfm_src_empty),         //          .empty
		.src_channel       (),                                                           // (terminated)
		.src_error         ()                                                            // (terminated)
	);

	altera_avalon_mm_master_bfm #(
		.AV_ADDRESS_W               (2),
		.AV_SYMBOL_W                (8),
		.AV_NUMSYMBOLS              (2),
		.AV_BURSTCOUNT_W            (1),
		.AV_READRESPONSE_W          (1),
		.AV_WRITERESPONSE_W         (1),
		.USE_READ                   (1),
		.USE_WRITE                  (0),
		.USE_ADDRESS                (1),
		.USE_BYTE_ENABLE            (0),
		.USE_BURSTCOUNT             (0),
		.USE_READ_DATA              (1),
		.USE_READ_DATA_VALID        (0),
		.USE_WRITE_DATA             (0),
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
	) dircc_avalon_st_terminal_sys_inst_status_bfm (
		.clk                    (dircc_avalon_st_terminal_sys_inst_clk_bfm_clk_clk),        //       clk.clk
		.reset                  (~dircc_avalon_st_terminal_sys_inst_reset_bfm_reset_reset), // clk_reset.reset
		.avm_address            (dircc_avalon_st_terminal_sys_inst_status_bfm_m0_address),  //        m0.address
		.avm_readdata           (dircc_avalon_st_terminal_sys_inst_status_bfm_m0_readdata), //          .readdata
		.avm_read               (dircc_avalon_st_terminal_sys_inst_status_bfm_m0_read),     //          .read
		.avm_burstcount         (),                                                         // (terminated)
		.avm_writedata          (),                                                         // (terminated)
		.avm_begintransfer      (),                                                         // (terminated)
		.avm_beginbursttransfer (),                                                         // (terminated)
		.avm_waitrequest        (1'b0),                                                     // (terminated)
		.avm_write              (),                                                         // (terminated)
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
		.avm_readresponse       (1'b0),                                                     // (terminated)
		.avm_writeresponse      (1'b0)                                                      // (terminated)
	);

endmodule
