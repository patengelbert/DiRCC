// dircc_system_rtl_gals_test_version_node_65537_routing.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module dircc_system_rtl_gals_test_version_node_65537_routing (
		input  wire [31:0] address_address,            //      address.address
		input  wire        clk_clk,                    //          clk.clk
		input  wire [31:0] input_east_data,            //   input_east.data
		input  wire        input_east_valid,           //             .valid
		output wire        input_east_ready,           //             .ready
		input  wire        input_east_startofpacket,   //             .startofpacket
		input  wire        input_east_endofpacket,     //             .endofpacket
		input  wire [1:0]  input_east_empty,           //             .empty
		input  wire [31:0] input_here_data,            //   input_here.data
		input  wire        input_here_valid,           //             .valid
		output wire        input_here_ready,           //             .ready
		input  wire        input_here_startofpacket,   //             .startofpacket
		input  wire        input_here_endofpacket,     //             .endofpacket
		input  wire [1:0]  input_here_empty,           //             .empty
		input  wire [31:0] input_north_data,           //  input_north.data
		input  wire        input_north_valid,          //             .valid
		output wire        input_north_ready,          //             .ready
		input  wire        input_north_startofpacket,  //             .startofpacket
		input  wire        input_north_endofpacket,    //             .endofpacket
		input  wire [1:0]  input_north_empty,          //             .empty
		input  wire [31:0] input_south_data,           //  input_south.data
		input  wire        input_south_valid,          //             .valid
		output wire        input_south_ready,          //             .ready
		input  wire        input_south_startofpacket,  //             .startofpacket
		input  wire        input_south_endofpacket,    //             .endofpacket
		input  wire [1:0]  input_south_empty,          //             .empty
		input  wire [31:0] input_west_data,            //   input_west.data
		input  wire        input_west_valid,           //             .valid
		output wire        input_west_ready,           //             .ready
		input  wire        input_west_startofpacket,   //             .startofpacket
		input  wire        input_west_endofpacket,     //             .endofpacket
		input  wire [1:0]  input_west_empty,           //             .empty
		output wire [31:0] output_east_data,           //  output_east.data
		output wire        output_east_valid,          //             .valid
		input  wire        output_east_ready,          //             .ready
		output wire        output_east_startofpacket,  //             .startofpacket
		output wire        output_east_endofpacket,    //             .endofpacket
		output wire [1:0]  output_east_empty,          //             .empty
		output wire [31:0] output_here_data,           //  output_here.data
		output wire        output_here_valid,          //             .valid
		input  wire        output_here_ready,          //             .ready
		output wire        output_here_startofpacket,  //             .startofpacket
		output wire        output_here_endofpacket,    //             .endofpacket
		output wire [1:0]  output_here_empty,          //             .empty
		output wire [31:0] output_north_data,          // output_north.data
		output wire        output_north_valid,         //             .valid
		input  wire        output_north_ready,         //             .ready
		output wire        output_north_startofpacket, //             .startofpacket
		output wire        output_north_endofpacket,   //             .endofpacket
		output wire [1:0]  output_north_empty,         //             .empty
		output wire [31:0] output_south_data,          // output_south.data
		output wire        output_south_valid,         //             .valid
		input  wire        output_south_ready,         //             .ready
		output wire        output_south_startofpacket, //             .startofpacket
		output wire        output_south_endofpacket,   //             .endofpacket
		output wire [1:0]  output_south_empty,         //             .empty
		output wire [31:0] output_west_data,           //  output_west.data
		output wire        output_west_valid,          //             .valid
		input  wire        output_west_ready,          //             .ready
		output wire        output_west_startofpacket,  //             .startofpacket
		output wire        output_west_endofpacket,    //             .endofpacket
		output wire [1:0]  output_west_empty,          //             .empty
		input  wire        reset_reset_n               //        reset.reset_n
	);

	wire         router_out_valid;                   // router:out_valid -> output_demux:in_valid
	wire  [31:0] router_out_data;                    // router:out_data -> output_demux:in_data
	wire         router_out_ready;                   // output_demux:in_ready -> router:out_ready
	wire   [2:0] router_out_channel;                 // router:out_channel -> output_demux:in_channel
	wire         router_out_startofpacket;           // router:out_startofpacket -> output_demux:in_startofpacket
	wire         router_out_endofpacket;             // router:out_endofpacket -> output_demux:in_endofpacket
	wire   [1:0] router_out_empty;                   // router:out_empty -> output_demux:in_empty
	wire         input_mux_out_valid;                // input_mux:out_valid -> router:in_valid
	wire  [31:0] input_mux_out_data;                 // input_mux:out_data -> router:in_data
	wire         input_mux_out_ready;                // router:in_ready -> input_mux:out_ready
	wire   [2:0] input_mux_out_channel;              // input_mux:out_channel -> router:in_channel
	wire         input_mux_out_startofpacket;        // input_mux:out_startofpacket -> router:in_startofpacket
	wire         input_mux_out_endofpacket;          // input_mux:out_endofpacket -> router:in_endofpacket
	wire   [1:0] input_mux_out_empty;                // input_mux:out_empty -> router:in_empty
	wire         input_fifo_north_out_valid;         // input_fifo_north:out_valid -> input_mux:in1_valid
	wire  [31:0] input_fifo_north_out_data;          // input_fifo_north:out_data -> input_mux:in1_data
	wire         input_fifo_north_out_ready;         // input_mux:in1_ready -> input_fifo_north:out_ready
	wire         input_fifo_north_out_startofpacket; // input_fifo_north:out_startofpacket -> input_mux:in1_startofpacket
	wire         input_fifo_north_out_endofpacket;   // input_fifo_north:out_endofpacket -> input_mux:in1_endofpacket
	wire   [1:0] input_fifo_north_out_empty;         // input_fifo_north:out_empty -> input_mux:in1_empty
	wire         input_fifo_south_out_valid;         // input_fifo_south:out_valid -> input_mux:in2_valid
	wire  [31:0] input_fifo_south_out_data;          // input_fifo_south:out_data -> input_mux:in2_data
	wire         input_fifo_south_out_ready;         // input_mux:in2_ready -> input_fifo_south:out_ready
	wire         input_fifo_south_out_startofpacket; // input_fifo_south:out_startofpacket -> input_mux:in2_startofpacket
	wire         input_fifo_south_out_endofpacket;   // input_fifo_south:out_endofpacket -> input_mux:in2_endofpacket
	wire   [1:0] input_fifo_south_out_empty;         // input_fifo_south:out_empty -> input_mux:in2_empty
	wire         input_fifo_east_out_valid;          // input_fifo_east:out_valid -> input_mux:in3_valid
	wire  [31:0] input_fifo_east_out_data;           // input_fifo_east:out_data -> input_mux:in3_data
	wire         input_fifo_east_out_ready;          // input_mux:in3_ready -> input_fifo_east:out_ready
	wire         input_fifo_east_out_startofpacket;  // input_fifo_east:out_startofpacket -> input_mux:in3_startofpacket
	wire         input_fifo_east_out_endofpacket;    // input_fifo_east:out_endofpacket -> input_mux:in3_endofpacket
	wire   [1:0] input_fifo_east_out_empty;          // input_fifo_east:out_empty -> input_mux:in3_empty
	wire         input_fifo_west_out_valid;          // input_fifo_west:out_valid -> input_mux:in4_valid
	wire  [31:0] input_fifo_west_out_data;           // input_fifo_west:out_data -> input_mux:in4_data
	wire         input_fifo_west_out_ready;          // input_mux:in4_ready -> input_fifo_west:out_ready
	wire         input_fifo_west_out_startofpacket;  // input_fifo_west:out_startofpacket -> input_mux:in4_startofpacket
	wire         input_fifo_west_out_endofpacket;    // input_fifo_west:out_endofpacket -> input_mux:in4_endofpacket
	wire   [1:0] input_fifo_west_out_empty;          // input_fifo_west:out_empty -> input_mux:in4_empty

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (4),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (16),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) input_fifo_east (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (~reset_reset_n),                       // clk_reset.reset
		.in_data           (input_east_data),                      //        in.data
		.in_valid          (input_east_valid),                     //          .valid
		.in_ready          (input_east_ready),                     //          .ready
		.in_startofpacket  (input_east_startofpacket),             //          .startofpacket
		.in_endofpacket    (input_east_endofpacket),               //          .endofpacket
		.in_empty          (input_east_empty),                     //          .empty
		.out_data          (input_fifo_east_out_data),             //       out.data
		.out_valid         (input_fifo_east_out_valid),            //          .valid
		.out_ready         (input_fifo_east_out_ready),            //          .ready
		.out_startofpacket (input_fifo_east_out_startofpacket),    //          .startofpacket
		.out_endofpacket   (input_fifo_east_out_endofpacket),      //          .endofpacket
		.out_empty         (input_fifo_east_out_empty),            //          .empty
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (4),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (16),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) input_fifo_north (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (~reset_reset_n),                       // clk_reset.reset
		.in_data           (input_north_data),                     //        in.data
		.in_valid          (input_north_valid),                    //          .valid
		.in_ready          (input_north_ready),                    //          .ready
		.in_startofpacket  (input_north_startofpacket),            //          .startofpacket
		.in_endofpacket    (input_north_endofpacket),              //          .endofpacket
		.in_empty          (input_north_empty),                    //          .empty
		.out_data          (input_fifo_north_out_data),            //       out.data
		.out_valid         (input_fifo_north_out_valid),           //          .valid
		.out_ready         (input_fifo_north_out_ready),           //          .ready
		.out_startofpacket (input_fifo_north_out_startofpacket),   //          .startofpacket
		.out_endofpacket   (input_fifo_north_out_endofpacket),     //          .endofpacket
		.out_empty         (input_fifo_north_out_empty),           //          .empty
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (4),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (16),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) input_fifo_south (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (~reset_reset_n),                       // clk_reset.reset
		.in_data           (input_south_data),                     //        in.data
		.in_valid          (input_south_valid),                    //          .valid
		.in_ready          (input_south_ready),                    //          .ready
		.in_startofpacket  (input_south_startofpacket),            //          .startofpacket
		.in_endofpacket    (input_south_endofpacket),              //          .endofpacket
		.in_empty          (input_south_empty),                    //          .empty
		.out_data          (input_fifo_south_out_data),            //       out.data
		.out_valid         (input_fifo_south_out_valid),           //          .valid
		.out_ready         (input_fifo_south_out_ready),           //          .ready
		.out_startofpacket (input_fifo_south_out_startofpacket),   //          .startofpacket
		.out_endofpacket   (input_fifo_south_out_endofpacket),     //          .endofpacket
		.out_empty         (input_fifo_south_out_empty),           //          .empty
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (4),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (16),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) input_fifo_west (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (~reset_reset_n),                       // clk_reset.reset
		.in_data           (input_west_data),                      //        in.data
		.in_valid          (input_west_valid),                     //          .valid
		.in_ready          (input_west_ready),                     //          .ready
		.in_startofpacket  (input_west_startofpacket),             //          .startofpacket
		.in_endofpacket    (input_west_endofpacket),               //          .endofpacket
		.in_empty          (input_west_empty),                     //          .empty
		.out_data          (input_fifo_west_out_data),             //       out.data
		.out_valid         (input_fifo_west_out_valid),            //          .valid
		.out_ready         (input_fifo_west_out_ready),            //          .ready
		.out_startofpacket (input_fifo_west_out_startofpacket),    //          .startofpacket
		.out_endofpacket   (input_fifo_west_out_endofpacket),      //          .endofpacket
		.out_empty         (input_fifo_west_out_empty),            //          .empty
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	dircc_system_rtl_gals_test_version_node_0_routing_input_mux input_mux (
		.clk               (clk_clk),                            //   clk.clk
		.reset_n           (reset_reset_n),                      // reset.reset_n
		.out_data          (input_mux_out_data),                 //   out.data
		.out_valid         (input_mux_out_valid),                //      .valid
		.out_ready         (input_mux_out_ready),                //      .ready
		.out_startofpacket (input_mux_out_startofpacket),        //      .startofpacket
		.out_endofpacket   (input_mux_out_endofpacket),          //      .endofpacket
		.out_empty         (input_mux_out_empty),                //      .empty
		.out_channel       (input_mux_out_channel),              //      .channel
		.in0_data          (input_here_data),                    //   in0.data
		.in0_valid         (input_here_valid),                   //      .valid
		.in0_ready         (input_here_ready),                   //      .ready
		.in0_startofpacket (input_here_startofpacket),           //      .startofpacket
		.in0_endofpacket   (input_here_endofpacket),             //      .endofpacket
		.in0_empty         (input_here_empty),                   //      .empty
		.in1_data          (input_fifo_north_out_data),          //   in1.data
		.in1_valid         (input_fifo_north_out_valid),         //      .valid
		.in1_ready         (input_fifo_north_out_ready),         //      .ready
		.in1_startofpacket (input_fifo_north_out_startofpacket), //      .startofpacket
		.in1_endofpacket   (input_fifo_north_out_endofpacket),   //      .endofpacket
		.in1_empty         (input_fifo_north_out_empty),         //      .empty
		.in2_data          (input_fifo_south_out_data),          //   in2.data
		.in2_valid         (input_fifo_south_out_valid),         //      .valid
		.in2_ready         (input_fifo_south_out_ready),         //      .ready
		.in2_startofpacket (input_fifo_south_out_startofpacket), //      .startofpacket
		.in2_endofpacket   (input_fifo_south_out_endofpacket),   //      .endofpacket
		.in2_empty         (input_fifo_south_out_empty),         //      .empty
		.in3_data          (input_fifo_east_out_data),           //   in3.data
		.in3_valid         (input_fifo_east_out_valid),          //      .valid
		.in3_ready         (input_fifo_east_out_ready),          //      .ready
		.in3_startofpacket (input_fifo_east_out_startofpacket),  //      .startofpacket
		.in3_endofpacket   (input_fifo_east_out_endofpacket),    //      .endofpacket
		.in3_empty         (input_fifo_east_out_empty),          //      .empty
		.in4_data          (input_fifo_west_out_data),           //   in4.data
		.in4_valid         (input_fifo_west_out_valid),          //      .valid
		.in4_ready         (input_fifo_west_out_ready),          //      .ready
		.in4_startofpacket (input_fifo_west_out_startofpacket),  //      .startofpacket
		.in4_endofpacket   (input_fifo_west_out_endofpacket),    //      .endofpacket
		.in4_empty         (input_fifo_west_out_empty)           //      .empty
	);

	dircc_system_rtl_gals_test_version_node_0_routing_output_demux output_demux (
		.clk                (clk_clk),                    //   clk.clk
		.reset_n            (reset_reset_n),              // reset.reset_n
		.in_data            (router_out_data),            //    in.data
		.in_valid           (router_out_valid),           //      .valid
		.in_ready           (router_out_ready),           //      .ready
		.in_startofpacket   (router_out_startofpacket),   //      .startofpacket
		.in_endofpacket     (router_out_endofpacket),     //      .endofpacket
		.in_empty           (router_out_empty),           //      .empty
		.in_channel         (router_out_channel),         //      .channel
		.out0_data          (output_here_data),           //  out0.data
		.out0_valid         (output_here_valid),          //      .valid
		.out0_ready         (output_here_ready),          //      .ready
		.out0_startofpacket (output_here_startofpacket),  //      .startofpacket
		.out0_endofpacket   (output_here_endofpacket),    //      .endofpacket
		.out0_empty         (output_here_empty),          //      .empty
		.out1_data          (output_north_data),          //  out1.data
		.out1_valid         (output_north_valid),         //      .valid
		.out1_ready         (output_north_ready),         //      .ready
		.out1_startofpacket (output_north_startofpacket), //      .startofpacket
		.out1_endofpacket   (output_north_endofpacket),   //      .endofpacket
		.out1_empty         (output_north_empty),         //      .empty
		.out2_data          (output_south_data),          //  out2.data
		.out2_valid         (output_south_valid),         //      .valid
		.out2_ready         (output_south_ready),         //      .ready
		.out2_startofpacket (output_south_startofpacket), //      .startofpacket
		.out2_endofpacket   (output_south_endofpacket),   //      .endofpacket
		.out2_empty         (output_south_empty),         //      .empty
		.out3_data          (output_east_data),           //  out3.data
		.out3_valid         (output_east_valid),          //      .valid
		.out3_ready         (output_east_ready),          //      .ready
		.out3_startofpacket (output_east_startofpacket),  //      .startofpacket
		.out3_endofpacket   (output_east_endofpacket),    //      .endofpacket
		.out3_empty         (output_east_empty),          //      .empty
		.out4_data          (output_west_data),           //  out4.data
		.out4_valid         (output_west_valid),          //      .valid
		.out4_ready         (output_west_ready),          //      .ready
		.out4_startofpacket (output_west_startofpacket),  //      .startofpacket
		.out4_endofpacket   (output_west_endofpacket),    //      .endofpacket
		.out4_empty         (output_west_empty)           //      .empty
	);

	dircc_router #(
		.SYMBOLS_PER_BEAT    (4),
		.BITS_PER_SYMBOL     (8),
		.USE_PACKETS         (1),
		.USE_EMPTY           (1),
		.USE_HIGH_BIT_SELECT (1),
		.PIPELINE_READY      (1),
		.MAX_ROUTE_DIRECTION (5),
		.CHANNEL_WIDTH       (3),
		.maxChannel          (7),
		.ERROR_WIDTH         (0)
	) router (
		.out_endofpacket   (router_out_endofpacket),      //       out.endofpacket
		.out_channel       (router_out_channel),          //          .channel
		.out_data          (router_out_data),             //          .data
		.out_ready         (router_out_ready),            //          .ready
		.out_startofpacket (router_out_startofpacket),    //          .startofpacket
		.out_valid         (router_out_valid),            //          .valid
		.out_empty         (router_out_empty),            //          .empty
		.in_ready          (input_mux_out_ready),         //        in.ready
		.in_valid          (input_mux_out_valid),         //          .valid
		.in_data           (input_mux_out_data),          //          .data
		.in_startofpacket  (input_mux_out_startofpacket), //          .startofpacket
		.in_endofpacket    (input_mux_out_endofpacket),   //          .endofpacket
		.in_empty          (input_mux_out_empty),         //          .empty
		.in_channel        (input_mux_out_channel),       //          .channel
		.address           (address_address),             //   address.address
		.clk               (clk_clk),                     //       clk.clk
		.reset_n           (reset_reset_n)                // clk_reset.reset_n
	);

endmodule
