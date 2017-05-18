// dircc_avalon_st_terminal_sys.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module dircc_avalon_st_terminal_sys (
		input  wire        clk_clk,          //    clk.clk
		input  wire        reset_reset_n,    //  reset.reset_n
		input  wire [31:0] s1_data,          //     s1.data
		input  wire [1:0]  s1_empty,         //       .empty
		input  wire        s1_endofpacket,   //       .endofpacket
		output wire        s1_ready,         //       .ready
		input  wire        s1_startofpacket, //       .startofpacket
		input  wire        s1_valid,         //       .valid
		output wire [15:0] status_readdata,  // status.readdata
		input  wire [1:0]  status_address,   //       .address
		input  wire        status_read_n     //       .read_n
	);

	wire    rst_controller_reset_out_reset; // rst_controller:reset_out -> dircc_avalon_st_terminal_0:reset_n

	dircc_avalon_st_terminal_inst #(
		.DATA_WIDTH (32)
	) dircc_avalon_st_terminal_0 (
		.reset_n       (~rst_controller_reset_out_reset), //  reset.reset_n
		.clk           (clk_clk),                         //  clock.clk
		.data          (s1_data),                         //     s1.data
		.empty         (s1_empty),                        //       .empty
		.endofpacket   (s1_endofpacket),                  //       .endofpacket
		.ready         (s1_ready),                        //       .ready
		.startofpacket (s1_startofpacket),                //       .startofpacket
		.valid         (s1_valid),                        //       .valid
		.readdata      (status_readdata),                 // status.readdata
		.address       (status_address),                  //       .address
		.read_n        (status_read_n)                    //       .read_n
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
