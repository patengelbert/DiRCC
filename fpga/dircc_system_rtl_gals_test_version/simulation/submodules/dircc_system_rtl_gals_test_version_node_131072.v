// dircc_system_rtl_gals_test_version_node_131072.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module dircc_system_rtl_gals_test_version_node_131072 (
		input  wire        clk_clk,                    //          clk.clk
		input  wire [31:0] input_east_data,            //   input_east.data
		input  wire        input_east_valid,           //             .valid
		output wire        input_east_ready,           //             .ready
		input  wire        input_east_startofpacket,   //             .startofpacket
		input  wire        input_east_endofpacket,     //             .endofpacket
		input  wire [1:0]  input_east_empty,           //             .empty
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
		input  wire [14:0] mem_address,                //          mem.address
		output wire [15:0] mem_readdata,               //             .readdata
		input  wire        mem_write,                  //             .write
		input  wire [15:0] mem_writedata,              //             .writedata
		output wire [31:0] output_east_data,           //  output_east.data
		output wire        output_east_valid,          //             .valid
		input  wire        output_east_ready,          //             .ready
		output wire        output_east_startofpacket,  //             .startofpacket
		output wire        output_east_endofpacket,    //             .endofpacket
		output wire [1:0]  output_east_empty,          //             .empty
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

	wire         dircc_processing_gals_heat_output_valid;         // dircc_processing_gals_heat:output_valid -> routing:input_here_valid
	wire  [31:0] dircc_processing_gals_heat_output_data;          // dircc_processing_gals_heat:output_data -> routing:input_here_data
	wire         dircc_processing_gals_heat_output_ready;         // routing:input_here_ready -> dircc_processing_gals_heat:output_ready
	wire         dircc_processing_gals_heat_output_startofpacket; // dircc_processing_gals_heat:output_startofpacket -> routing:input_here_startofpacket
	wire         dircc_processing_gals_heat_output_endofpacket;   // dircc_processing_gals_heat:output_endofpacket -> routing:input_here_endofpacket
	wire   [1:0] dircc_processing_gals_heat_output_empty;         // dircc_processing_gals_heat:output_empty -> routing:input_here_empty
	wire         routing_output_here_valid;                       // routing:output_here_valid -> dircc_processing_gals_heat:input_valid
	wire  [31:0] routing_output_here_data;                        // routing:output_here_data -> dircc_processing_gals_heat:input_data
	wire         routing_output_here_ready;                       // dircc_processing_gals_heat:input_ready -> routing:output_here_ready
	wire         routing_output_here_startofpacket;               // routing:output_here_startofpacket -> dircc_processing_gals_heat:input_startofpacket
	wire         routing_output_here_endofpacket;                 // routing:output_here_endofpacket -> dircc_processing_gals_heat:input_endofpacket
	wire   [1:0] routing_output_here_empty;                       // routing:output_here_empty -> dircc_processing_gals_heat:input_empty
	wire  [31:0] dircc_address_address_routing_address;           // dircc_address:address_routing -> routing:address_address
	wire  [31:0] dircc_address_address_processing_address;        // dircc_address:address_processing -> dircc_processing_gals_heat:address
	wire         rst_controller_reset_out_reset;                  // rst_controller:reset_out -> [dircc_processing_gals_heat:reset_n, routing:reset_reset_n]

	dircc_address_gen #(
		.ADDRESS (131072)
	) dircc_address (
		.address_processing (dircc_address_address_processing_address), // address_processing.address
		.address_routing    (dircc_address_address_routing_address)     //    address_routing.address
	);

	dircc_processing #(
		.BITS_PER_SYMBOL         (8),
		.SYMBOLS_PER_BEAT        (4),
		.INPUT_FIFO_DEPTH        (8),
		.STATUS_MEM_WIDTH        (16),
		.STATUS_ADDRESS_WIDTH    (15),
		.STATUS_BYTE_WIDTH       (8),
		.STATUS_DEV_MEM_WIDTH    (12),
		.STATUS_EDGE_MEM_WIDTH   (12),
		.ADDRESS_MEM_WIDTH       (32),
		.RTS_READY_WIDTH         (32),
		.DEVICE_ID               (34'b0000000000000000000000000000000000),
		.DIRCC_RTS_FLAGS_COMPUTE (34'b0010000000000000000000000000000000)
	) dircc_processing_gals_heat (
		.clk                  (clk_clk),                                         //   clock.clk
		.reset_n              (~rst_controller_reset_out_reset),                 //   reset.reset_n
		.output_endofpacket   (dircc_processing_gals_heat_output_endofpacket),   //  output.endofpacket
		.output_data          (dircc_processing_gals_heat_output_data),          //        .data
		.output_empty         (dircc_processing_gals_heat_output_empty),         //        .empty
		.output_ready         (dircc_processing_gals_heat_output_ready),         //        .ready
		.output_startofpacket (dircc_processing_gals_heat_output_startofpacket), //        .startofpacket
		.output_valid         (dircc_processing_gals_heat_output_valid),         //        .valid
		.mem_address          (mem_address),                                     //     mem.address
		.mem_readdata         (mem_readdata),                                    //        .readdata
		.mem_write            (mem_write),                                       //        .write
		.mem_writedata        (mem_writedata),                                   //        .writedata
		.input_data           (routing_output_here_data),                        //   input.data
		.input_empty          (routing_output_here_empty),                       //        .empty
		.input_startofpacket  (routing_output_here_startofpacket),               //        .startofpacket
		.input_endofpacket    (routing_output_here_endofpacket),                 //        .endofpacket
		.input_ready          (routing_output_here_ready),                       //        .ready
		.input_valid          (routing_output_here_valid),                       //        .valid
		.address              (dircc_address_address_processing_address)         // address.address
	);

	dircc_system_rtl_gals_test_version_node_131072_routing routing (
		.address_address            (dircc_address_address_routing_address),           //      address.address
		.clk_clk                    (clk_clk),                                         //          clk.clk
		.input_east_data            (input_east_data),                                 //   input_east.data
		.input_east_valid           (input_east_valid),                                //             .valid
		.input_east_ready           (input_east_ready),                                //             .ready
		.input_east_startofpacket   (input_east_startofpacket),                        //             .startofpacket
		.input_east_endofpacket     (input_east_endofpacket),                          //             .endofpacket
		.input_east_empty           (input_east_empty),                                //             .empty
		.input_here_data            (dircc_processing_gals_heat_output_data),          //   input_here.data
		.input_here_valid           (dircc_processing_gals_heat_output_valid),         //             .valid
		.input_here_ready           (dircc_processing_gals_heat_output_ready),         //             .ready
		.input_here_startofpacket   (dircc_processing_gals_heat_output_startofpacket), //             .startofpacket
		.input_here_endofpacket     (dircc_processing_gals_heat_output_endofpacket),   //             .endofpacket
		.input_here_empty           (dircc_processing_gals_heat_output_empty),         //             .empty
		.input_north_data           (input_north_data),                                //  input_north.data
		.input_north_valid          (input_north_valid),                               //             .valid
		.input_north_ready          (input_north_ready),                               //             .ready
		.input_north_startofpacket  (input_north_startofpacket),                       //             .startofpacket
		.input_north_endofpacket    (input_north_endofpacket),                         //             .endofpacket
		.input_north_empty          (input_north_empty),                               //             .empty
		.input_south_data           (input_south_data),                                //  input_south.data
		.input_south_valid          (input_south_valid),                               //             .valid
		.input_south_ready          (input_south_ready),                               //             .ready
		.input_south_startofpacket  (input_south_startofpacket),                       //             .startofpacket
		.input_south_endofpacket    (input_south_endofpacket),                         //             .endofpacket
		.input_south_empty          (input_south_empty),                               //             .empty
		.input_west_data            (input_west_data),                                 //   input_west.data
		.input_west_valid           (input_west_valid),                                //             .valid
		.input_west_ready           (input_west_ready),                                //             .ready
		.input_west_startofpacket   (input_west_startofpacket),                        //             .startofpacket
		.input_west_endofpacket     (input_west_endofpacket),                          //             .endofpacket
		.input_west_empty           (input_west_empty),                                //             .empty
		.output_east_data           (output_east_data),                                //  output_east.data
		.output_east_valid          (output_east_valid),                               //             .valid
		.output_east_ready          (output_east_ready),                               //             .ready
		.output_east_startofpacket  (output_east_startofpacket),                       //             .startofpacket
		.output_east_endofpacket    (output_east_endofpacket),                         //             .endofpacket
		.output_east_empty          (output_east_empty),                               //             .empty
		.output_here_data           (routing_output_here_data),                        //  output_here.data
		.output_here_valid          (routing_output_here_valid),                       //             .valid
		.output_here_ready          (routing_output_here_ready),                       //             .ready
		.output_here_startofpacket  (routing_output_here_startofpacket),               //             .startofpacket
		.output_here_endofpacket    (routing_output_here_endofpacket),                 //             .endofpacket
		.output_here_empty          (routing_output_here_empty),                       //             .empty
		.output_north_data          (output_north_data),                               // output_north.data
		.output_north_valid         (output_north_valid),                              //             .valid
		.output_north_ready         (output_north_ready),                              //             .ready
		.output_north_startofpacket (output_north_startofpacket),                      //             .startofpacket
		.output_north_endofpacket   (output_north_endofpacket),                        //             .endofpacket
		.output_north_empty         (output_north_empty),                              //             .empty
		.output_south_data          (output_south_data),                               // output_south.data
		.output_south_valid         (output_south_valid),                              //             .valid
		.output_south_ready         (output_south_ready),                              //             .ready
		.output_south_startofpacket (output_south_startofpacket),                      //             .startofpacket
		.output_south_endofpacket   (output_south_endofpacket),                        //             .endofpacket
		.output_south_empty         (output_south_empty),                              //             .empty
		.output_west_data           (output_west_data),                                //  output_west.data
		.output_west_valid          (output_west_valid),                               //             .valid
		.output_west_ready          (output_west_ready),                               //             .ready
		.output_west_startofpacket  (output_west_startofpacket),                       //             .startofpacket
		.output_west_endofpacket    (output_west_endofpacket),                         //             .endofpacket
		.output_west_empty          (output_west_empty),                               //             .empty
		.reset_reset_n              (~rst_controller_reset_out_reset)                  //        reset.reset_n
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
