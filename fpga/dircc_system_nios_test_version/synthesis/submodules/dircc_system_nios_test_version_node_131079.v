// dircc_system_nios_test_version_node_131079.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module dircc_system_nios_test_version_node_131079 (
		input  wire        clk_processing_clk,         //   clk_processing.clk
		input  wire        clk_routing_clk,            //      clk_routing.clk
		input  wire [31:0] input_east_data,            //       input_east.data
		input  wire        input_east_valid,           //                 .valid
		output wire        input_east_ready,           //                 .ready
		input  wire        input_east_startofpacket,   //                 .startofpacket
		input  wire        input_east_endofpacket,     //                 .endofpacket
		input  wire [1:0]  input_east_empty,           //                 .empty
		input  wire [31:0] input_north_data,           //      input_north.data
		input  wire        input_north_valid,          //                 .valid
		output wire        input_north_ready,          //                 .ready
		input  wire        input_north_startofpacket,  //                 .startofpacket
		input  wire        input_north_endofpacket,    //                 .endofpacket
		input  wire [1:0]  input_north_empty,          //                 .empty
		input  wire [31:0] input_south_data,           //      input_south.data
		input  wire        input_south_valid,          //                 .valid
		output wire        input_south_ready,          //                 .ready
		input  wire        input_south_startofpacket,  //                 .startofpacket
		input  wire        input_south_endofpacket,    //                 .endofpacket
		input  wire [1:0]  input_south_empty,          //                 .empty
		input  wire [31:0] input_west_data,            //       input_west.data
		input  wire        input_west_valid,           //                 .valid
		output wire        input_west_ready,           //                 .ready
		input  wire        input_west_startofpacket,   //                 .startofpacket
		input  wire        input_west_endofpacket,     //                 .endofpacket
		input  wire [1:0]  input_west_empty,           //                 .empty
		output wire [31:0] output_east_data,           //      output_east.data
		output wire        output_east_valid,          //                 .valid
		input  wire        output_east_ready,          //                 .ready
		output wire        output_east_startofpacket,  //                 .startofpacket
		output wire        output_east_endofpacket,    //                 .endofpacket
		output wire [1:0]  output_east_empty,          //                 .empty
		output wire [31:0] output_north_data,          //     output_north.data
		output wire        output_north_valid,         //                 .valid
		input  wire        output_north_ready,         //                 .ready
		output wire        output_north_startofpacket, //                 .startofpacket
		output wire        output_north_endofpacket,   //                 .endofpacket
		output wire [1:0]  output_north_empty,         //                 .empty
		output wire [31:0] output_south_data,          //     output_south.data
		output wire        output_south_valid,         //                 .valid
		input  wire        output_south_ready,         //                 .ready
		output wire        output_south_startofpacket, //                 .startofpacket
		output wire        output_south_endofpacket,   //                 .endofpacket
		output wire [1:0]  output_south_empty,         //                 .empty
		output wire [31:0] output_west_data,           //      output_west.data
		output wire        output_west_valid,          //                 .valid
		input  wire        output_west_ready,          //                 .ready
		output wire        output_west_startofpacket,  //                 .startofpacket
		output wire        output_west_endofpacket,    //                 .endofpacket
		output wire [1:0]  output_west_empty,          //                 .empty
		input  wire [14:0] processing_mem_address,     //   processing_mem.address
		input  wire        processing_mem_chipselect,  //                 .chipselect
		input  wire        processing_mem_clken,       //                 .clken
		input  wire        processing_mem_write,       //                 .write
		output wire [15:0] processing_mem_readdata,    //                 .readdata
		input  wire [15:0] processing_mem_writedata,   //                 .writedata
		input  wire [1:0]  processing_mem_byteenable,  //                 .byteenable
		input  wire        reset_processing_reset_n,   // reset_processing.reset_n
		input  wire        reset_routing_reset_n       //    reset_routing.reset_n
	);

	wire  [31:0] dircc_address_address_processing_address;  // dircc_address:address_processing -> processing:address_address
	wire  [31:0] dircc_address_address_routing_address;     // dircc_address:address_routing -> routing:address_address
	wire         routing_output_here_valid;                 // routing:output_here_valid -> avalon_st_adapter:in_0_valid
	wire  [31:0] routing_output_here_data;                  // routing:output_here_data -> avalon_st_adapter:in_0_data
	wire         routing_output_here_ready;                 // avalon_st_adapter:in_0_ready -> routing:output_here_ready
	wire         routing_output_here_startofpacket;         // routing:output_here_startofpacket -> avalon_st_adapter:in_0_startofpacket
	wire         routing_output_here_endofpacket;           // routing:output_here_endofpacket -> avalon_st_adapter:in_0_endofpacket
	wire   [1:0] routing_output_here_empty;                 // routing:output_here_empty -> avalon_st_adapter:in_0_empty
	wire         avalon_st_adapter_out_0_valid;             // avalon_st_adapter:out_0_valid -> processing:stream_in_valid
	wire  [31:0] avalon_st_adapter_out_0_data;              // avalon_st_adapter:out_0_data -> processing:stream_in_data
	wire         avalon_st_adapter_out_0_ready;             // processing:stream_in_ready -> avalon_st_adapter:out_0_ready
	wire         avalon_st_adapter_out_0_startofpacket;     // avalon_st_adapter:out_0_startofpacket -> processing:stream_in_startofpacket
	wire         avalon_st_adapter_out_0_endofpacket;       // avalon_st_adapter:out_0_endofpacket -> processing:stream_in_endofpacket
	wire   [1:0] avalon_st_adapter_out_0_empty;             // avalon_st_adapter:out_0_empty -> processing:stream_in_empty
	wire         processing_stream_out_valid;               // processing:stream_out_valid -> avalon_st_adapter_001:in_0_valid
	wire  [31:0] processing_stream_out_data;                // processing:stream_out_data -> avalon_st_adapter_001:in_0_data
	wire         processing_stream_out_ready;               // avalon_st_adapter_001:in_0_ready -> processing:stream_out_ready
	wire         processing_stream_out_startofpacket;       // processing:stream_out_startofpacket -> avalon_st_adapter_001:in_0_startofpacket
	wire         processing_stream_out_endofpacket;         // processing:stream_out_endofpacket -> avalon_st_adapter_001:in_0_endofpacket
	wire   [1:0] processing_stream_out_empty;               // processing:stream_out_empty -> avalon_st_adapter_001:in_0_empty
	wire         avalon_st_adapter_001_out_0_valid;         // avalon_st_adapter_001:out_0_valid -> routing:input_here_valid
	wire  [31:0] avalon_st_adapter_001_out_0_data;          // avalon_st_adapter_001:out_0_data -> routing:input_here_data
	wire         avalon_st_adapter_001_out_0_ready;         // routing:input_here_ready -> avalon_st_adapter_001:out_0_ready
	wire         avalon_st_adapter_001_out_0_startofpacket; // avalon_st_adapter_001:out_0_startofpacket -> routing:input_here_startofpacket
	wire         avalon_st_adapter_001_out_0_endofpacket;   // avalon_st_adapter_001:out_0_endofpacket -> routing:input_here_endofpacket
	wire   [1:0] avalon_st_adapter_001_out_0_empty;         // avalon_st_adapter_001:out_0_empty -> routing:input_here_empty

	dircc_address_gen #(
		.ADDRESS (131079)
	) dircc_address (
		.address_processing (dircc_address_address_processing_address), // address_processing.address
		.address_routing    (dircc_address_address_routing_address)     //    address_routing.address
	);

	dircc_system_nios_test_version_node_131079_processing processing (
		.address_address          (dircc_address_address_processing_address), //          address.address
		.clk_processing_clk       (clk_processing_clk),                       //   clk_processing.clk
		.clk_routing_clk          (clk_routing_clk),                          //      clk_routing.clk
		.mem_address              (processing_mem_address),                   //              mem.address
		.mem_chipselect           (processing_mem_chipselect),                //                 .chipselect
		.mem_clken                (processing_mem_clken),                     //                 .clken
		.mem_write                (processing_mem_write),                     //                 .write
		.mem_readdata             (processing_mem_readdata),                  //                 .readdata
		.mem_writedata            (processing_mem_writedata),                 //                 .writedata
		.mem_byteenable           (processing_mem_byteenable),                //                 .byteenable
		.reset_processing_reset_n (reset_processing_reset_n),                 // reset_processing.reset_n
		.reset_routing_reset_n    (reset_routing_reset_n),                    //    reset_routing.reset_n
		.stream_in_valid          (avalon_st_adapter_out_0_valid),            //        stream_in.valid
		.stream_in_data           (avalon_st_adapter_out_0_data),             //                 .data
		.stream_in_startofpacket  (avalon_st_adapter_out_0_startofpacket),    //                 .startofpacket
		.stream_in_endofpacket    (avalon_st_adapter_out_0_endofpacket),      //                 .endofpacket
		.stream_in_empty          (avalon_st_adapter_out_0_empty),            //                 .empty
		.stream_in_ready          (avalon_st_adapter_out_0_ready),            //                 .ready
		.stream_out_valid         (processing_stream_out_valid),              //       stream_out.valid
		.stream_out_data          (processing_stream_out_data),               //                 .data
		.stream_out_startofpacket (processing_stream_out_startofpacket),      //                 .startofpacket
		.stream_out_endofpacket   (processing_stream_out_endofpacket),        //                 .endofpacket
		.stream_out_empty         (processing_stream_out_empty),              //                 .empty
		.stream_out_ready         (processing_stream_out_ready)               //                 .ready
	);

	dircc_system_nios_test_version_node_131079_routing routing (
		.address_address            (dircc_address_address_routing_address),     //      address.address
		.clk_clk                    (clk_routing_clk),                           //          clk.clk
		.input_east_data            (input_east_data),                           //   input_east.data
		.input_east_valid           (input_east_valid),                          //             .valid
		.input_east_ready           (input_east_ready),                          //             .ready
		.input_east_startofpacket   (input_east_startofpacket),                  //             .startofpacket
		.input_east_endofpacket     (input_east_endofpacket),                    //             .endofpacket
		.input_east_empty           (input_east_empty),                          //             .empty
		.input_here_data            (avalon_st_adapter_001_out_0_data),          //   input_here.data
		.input_here_valid           (avalon_st_adapter_001_out_0_valid),         //             .valid
		.input_here_ready           (avalon_st_adapter_001_out_0_ready),         //             .ready
		.input_here_startofpacket   (avalon_st_adapter_001_out_0_startofpacket), //             .startofpacket
		.input_here_endofpacket     (avalon_st_adapter_001_out_0_endofpacket),   //             .endofpacket
		.input_here_empty           (avalon_st_adapter_001_out_0_empty),         //             .empty
		.input_north_data           (input_north_data),                          //  input_north.data
		.input_north_valid          (input_north_valid),                         //             .valid
		.input_north_ready          (input_north_ready),                         //             .ready
		.input_north_startofpacket  (input_north_startofpacket),                 //             .startofpacket
		.input_north_endofpacket    (input_north_endofpacket),                   //             .endofpacket
		.input_north_empty          (input_north_empty),                         //             .empty
		.input_south_data           (input_south_data),                          //  input_south.data
		.input_south_valid          (input_south_valid),                         //             .valid
		.input_south_ready          (input_south_ready),                         //             .ready
		.input_south_startofpacket  (input_south_startofpacket),                 //             .startofpacket
		.input_south_endofpacket    (input_south_endofpacket),                   //             .endofpacket
		.input_south_empty          (input_south_empty),                         //             .empty
		.input_west_data            (input_west_data),                           //   input_west.data
		.input_west_valid           (input_west_valid),                          //             .valid
		.input_west_ready           (input_west_ready),                          //             .ready
		.input_west_startofpacket   (input_west_startofpacket),                  //             .startofpacket
		.input_west_endofpacket     (input_west_endofpacket),                    //             .endofpacket
		.input_west_empty           (input_west_empty),                          //             .empty
		.output_east_data           (output_east_data),                          //  output_east.data
		.output_east_valid          (output_east_valid),                         //             .valid
		.output_east_ready          (output_east_ready),                         //             .ready
		.output_east_startofpacket  (output_east_startofpacket),                 //             .startofpacket
		.output_east_endofpacket    (output_east_endofpacket),                   //             .endofpacket
		.output_east_empty          (output_east_empty),                         //             .empty
		.output_here_data           (routing_output_here_data),                  //  output_here.data
		.output_here_valid          (routing_output_here_valid),                 //             .valid
		.output_here_ready          (routing_output_here_ready),                 //             .ready
		.output_here_startofpacket  (routing_output_here_startofpacket),         //             .startofpacket
		.output_here_endofpacket    (routing_output_here_endofpacket),           //             .endofpacket
		.output_here_empty          (routing_output_here_empty),                 //             .empty
		.output_north_data          (output_north_data),                         // output_north.data
		.output_north_valid         (output_north_valid),                        //             .valid
		.output_north_ready         (output_north_ready),                        //             .ready
		.output_north_startofpacket (output_north_startofpacket),                //             .startofpacket
		.output_north_endofpacket   (output_north_endofpacket),                  //             .endofpacket
		.output_north_empty         (output_north_empty),                        //             .empty
		.output_south_data          (output_south_data),                         // output_south.data
		.output_south_valid         (output_south_valid),                        //             .valid
		.output_south_ready         (output_south_ready),                        //             .ready
		.output_south_startofpacket (output_south_startofpacket),                //             .startofpacket
		.output_south_endofpacket   (output_south_endofpacket),                  //             .endofpacket
		.output_south_empty         (output_south_empty),                        //             .empty
		.output_west_data           (output_west_data),                          //  output_west.data
		.output_west_valid          (output_west_valid),                         //             .valid
		.output_west_ready          (output_west_ready),                         //             .ready
		.output_west_startofpacket  (output_west_startofpacket),                 //             .startofpacket
		.output_west_endofpacket    (output_west_endofpacket),                   //             .endofpacket
		.output_west_empty          (output_west_empty),                         //             .empty
		.reset_reset_n              (reset_routing_reset_n)                      //        reset.reset_n
	);

	dircc_system_nios_test_version_node_0_avalon_st_adapter #(
		.inBitsPerSymbol (8),
		.inUsePackets    (1),
		.inDataWidth     (32),
		.inChannelWidth  (0),
		.inErrorWidth    (0),
		.inUseEmptyPort  (1),
		.inUseValid      (1),
		.inUseReady      (1),
		.inReadyLatency  (0),
		.outDataWidth    (32),
		.outChannelWidth (0),
		.outErrorWidth   (0),
		.outUseEmptyPort (1),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (1)
	) avalon_st_adapter (
		.in_clk_0_clk        (clk_routing_clk),                       // in_clk_0.clk
		.in_rst_0_reset      (~reset_routing_reset_n),                // in_rst_0.reset
		.in_0_data           (routing_output_here_data),              //     in_0.data
		.in_0_valid          (routing_output_here_valid),             //         .valid
		.in_0_ready          (routing_output_here_ready),             //         .ready
		.in_0_startofpacket  (routing_output_here_startofpacket),     //         .startofpacket
		.in_0_endofpacket    (routing_output_here_endofpacket),       //         .endofpacket
		.in_0_empty          (routing_output_here_empty),             //         .empty
		.out_0_data          (avalon_st_adapter_out_0_data),          //    out_0.data
		.out_0_valid         (avalon_st_adapter_out_0_valid),         //         .valid
		.out_0_ready         (avalon_st_adapter_out_0_ready),         //         .ready
		.out_0_startofpacket (avalon_st_adapter_out_0_startofpacket), //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_out_0_endofpacket),   //         .endofpacket
		.out_0_empty         (avalon_st_adapter_out_0_empty)          //         .empty
	);

	dircc_system_nios_test_version_node_0_avalon_st_adapter_001 #(
		.inBitsPerSymbol (8),
		.inUsePackets    (1),
		.inDataWidth     (32),
		.inChannelWidth  (0),
		.inErrorWidth    (0),
		.inUseEmptyPort  (1),
		.inUseValid      (1),
		.inUseReady      (1),
		.inReadyLatency  (1),
		.outDataWidth    (32),
		.outChannelWidth (0),
		.outErrorWidth   (0),
		.outUseEmptyPort (1),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter_001 (
		.in_clk_0_clk        (clk_routing_clk),                           // in_clk_0.clk
		.in_rst_0_reset      (~reset_routing_reset_n),                    // in_rst_0.reset
		.in_0_data           (processing_stream_out_data),                //     in_0.data
		.in_0_valid          (processing_stream_out_valid),               //         .valid
		.in_0_ready          (processing_stream_out_ready),               //         .ready
		.in_0_startofpacket  (processing_stream_out_startofpacket),       //         .startofpacket
		.in_0_endofpacket    (processing_stream_out_endofpacket),         //         .endofpacket
		.in_0_empty          (processing_stream_out_empty),               //         .empty
		.out_0_data          (avalon_st_adapter_001_out_0_data),          //    out_0.data
		.out_0_valid         (avalon_st_adapter_001_out_0_valid),         //         .valid
		.out_0_ready         (avalon_st_adapter_001_out_0_ready),         //         .ready
		.out_0_startofpacket (avalon_st_adapter_001_out_0_startofpacket), //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_001_out_0_endofpacket),   //         .endofpacket
		.out_0_empty         (avalon_st_adapter_001_out_0_empty)          //         .empty
	);

endmodule
