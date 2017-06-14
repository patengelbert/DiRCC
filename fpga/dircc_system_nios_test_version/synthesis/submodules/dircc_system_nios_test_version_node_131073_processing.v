// dircc_system_nios_test_version_node_131073_processing.v

// Generated using ACDS version 16.1 203

`timescale 1 ps / 1 ps
module dircc_system_nios_test_version_node_131073_processing (
		input  wire [31:0] address_address,          //          address.address
		input  wire        clk_processing_clk,       //   clk_processing.clk
		input  wire        clk_routing_clk,          //      clk_routing.clk
		input  wire [13:0] mem_address,              //              mem.address
		input  wire        mem_chipselect,           //                 .chipselect
		input  wire        mem_clken,                //                 .clken
		input  wire        mem_write,                //                 .write
		output wire [15:0] mem_readdata,             //                 .readdata
		input  wire [15:0] mem_writedata,            //                 .writedata
		input  wire [1:0]  mem_byteenable,           //                 .byteenable
		input  wire        reset_processing_reset_n, // reset_processing.reset_n
		input  wire        reset_routing_reset_n,    //    reset_routing.reset_n
		input  wire        stream_in_valid,          //        stream_in.valid
		input  wire [31:0] stream_in_data,           //                 .data
		input  wire        stream_in_startofpacket,  //                 .startofpacket
		input  wire        stream_in_endofpacket,    //                 .endofpacket
		input  wire [1:0]  stream_in_empty,          //                 .empty
		output wire        stream_in_ready,          //                 .ready
		output wire        stream_out_valid,         //       stream_out.valid
		output wire [31:0] stream_out_data,          //                 .data
		output wire        stream_out_startofpacket, //                 .startofpacket
		output wire        stream_out_endofpacket,   //                 .endofpacket
		output wire [1:0]  stream_out_empty,         //                 .empty
		input  wire        stream_out_ready          //                 .ready
	);

	wire  [31:0] cpu_data_master_readdata;                                  // mm_interconnect_0:cpu_data_master_readdata -> cpu:d_readdata
	wire         cpu_data_master_waitrequest;                               // mm_interconnect_0:cpu_data_master_waitrequest -> cpu:d_waitrequest
	wire         cpu_data_master_debugaccess;                               // cpu:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:cpu_data_master_debugaccess
	wire  [17:0] cpu_data_master_address;                                   // cpu:d_address -> mm_interconnect_0:cpu_data_master_address
	wire   [3:0] cpu_data_master_byteenable;                                // cpu:d_byteenable -> mm_interconnect_0:cpu_data_master_byteenable
	wire         cpu_data_master_read;                                      // cpu:d_read -> mm_interconnect_0:cpu_data_master_read
	wire         cpu_data_master_write;                                     // cpu:d_write -> mm_interconnect_0:cpu_data_master_write
	wire  [31:0] cpu_data_master_writedata;                                 // cpu:d_writedata -> mm_interconnect_0:cpu_data_master_writedata
	wire  [31:0] cpu_instruction_master_readdata;                           // mm_interconnect_0:cpu_instruction_master_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_waitrequest;                        // mm_interconnect_0:cpu_instruction_master_waitrequest -> cpu:i_waitrequest
	wire  [17:0] cpu_instruction_master_address;                            // cpu:i_address -> mm_interconnect_0:cpu_instruction_master_address
	wire         cpu_instruction_master_read;                               // cpu:i_read -> mm_interconnect_0:cpu_instruction_master_read
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_readdata;            // cpu:debug_mem_slave_readdata -> mm_interconnect_0:cpu_debug_mem_slave_readdata
	wire         mm_interconnect_0_cpu_debug_mem_slave_waitrequest;         // cpu:debug_mem_slave_waitrequest -> mm_interconnect_0:cpu_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_cpu_debug_mem_slave_debugaccess;         // mm_interconnect_0:cpu_debug_mem_slave_debugaccess -> cpu:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_cpu_debug_mem_slave_address;             // mm_interconnect_0:cpu_debug_mem_slave_address -> cpu:debug_mem_slave_address
	wire         mm_interconnect_0_cpu_debug_mem_slave_read;                // mm_interconnect_0:cpu_debug_mem_slave_read -> cpu:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_cpu_debug_mem_slave_byteenable;          // mm_interconnect_0:cpu_debug_mem_slave_byteenable -> cpu:debug_mem_slave_byteenable
	wire         mm_interconnect_0_cpu_debug_mem_slave_write;               // mm_interconnect_0:cpu_debug_mem_slave_write -> cpu:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_writedata;           // mm_interconnect_0:cpu_debug_mem_slave_writedata -> cpu:debug_mem_slave_writedata
	wire         mm_interconnect_0_fifo_out_in_waitrequest;                 // fifo_out:avalonmm_write_slave_waitrequest -> mm_interconnect_0:fifo_out_in_waitrequest
	wire   [0:0] mm_interconnect_0_fifo_out_in_address;                     // mm_interconnect_0:fifo_out_in_address -> fifo_out:avalonmm_write_slave_address
	wire         mm_interconnect_0_fifo_out_in_write;                       // mm_interconnect_0:fifo_out_in_write -> fifo_out:avalonmm_write_slave_write
	wire  [31:0] mm_interconnect_0_fifo_out_in_writedata;                   // mm_interconnect_0:fifo_out_in_writedata -> fifo_out:avalonmm_write_slave_writedata
	wire  [31:0] mm_interconnect_0_fifo_out_in_csr_readdata;                // fifo_out:wrclk_control_slave_readdata -> mm_interconnect_0:fifo_out_in_csr_readdata
	wire   [2:0] mm_interconnect_0_fifo_out_in_csr_address;                 // mm_interconnect_0:fifo_out_in_csr_address -> fifo_out:wrclk_control_slave_address
	wire         mm_interconnect_0_fifo_out_in_csr_read;                    // mm_interconnect_0:fifo_out_in_csr_read -> fifo_out:wrclk_control_slave_read
	wire         mm_interconnect_0_fifo_out_in_csr_write;                   // mm_interconnect_0:fifo_out_in_csr_write -> fifo_out:wrclk_control_slave_write
	wire  [31:0] mm_interconnect_0_fifo_out_in_csr_writedata;               // mm_interconnect_0:fifo_out_in_csr_writedata -> fifo_out:wrclk_control_slave_writedata
	wire  [31:0] mm_interconnect_0_fifo_in_out_readdata;                    // fifo_in:avalonmm_read_slave_readdata -> mm_interconnect_0:fifo_in_out_readdata
	wire         mm_interconnect_0_fifo_in_out_waitrequest;                 // fifo_in:avalonmm_read_slave_waitrequest -> mm_interconnect_0:fifo_in_out_waitrequest
	wire   [0:0] mm_interconnect_0_fifo_in_out_address;                     // mm_interconnect_0:fifo_in_out_address -> fifo_in:avalonmm_read_slave_address
	wire         mm_interconnect_0_fifo_in_out_read;                        // mm_interconnect_0:fifo_in_out_read -> fifo_in:avalonmm_read_slave_read
	wire  [31:0] mm_interconnect_0_address_out_readdata;                    // address:out_readdata -> mm_interconnect_0:address_out_readdata
	wire   [0:0] mm_interconnect_0_address_out_address;                     // mm_interconnect_0:address_out_address -> address:out_address
	wire         mm_interconnect_0_address_out_read;                        // mm_interconnect_0:address_out_read -> address:out_read
	wire  [31:0] mm_interconnect_0_fifo_in_out_csr_readdata;                // fifo_in:rdclk_control_slave_readdata -> mm_interconnect_0:fifo_in_out_csr_readdata
	wire   [2:0] mm_interconnect_0_fifo_in_out_csr_address;                 // mm_interconnect_0:fifo_in_out_csr_address -> fifo_in:rdclk_control_slave_address
	wire         mm_interconnect_0_fifo_in_out_csr_read;                    // mm_interconnect_0:fifo_in_out_csr_read -> fifo_in:rdclk_control_slave_read
	wire         mm_interconnect_0_fifo_in_out_csr_write;                   // mm_interconnect_0:fifo_in_out_csr_write -> fifo_in:rdclk_control_slave_write
	wire  [31:0] mm_interconnect_0_fifo_in_out_csr_writedata;               // mm_interconnect_0:fifo_in_out_csr_writedata -> fifo_in:rdclk_control_slave_writedata
	wire         mm_interconnect_0_timer_s1_chipselect;                     // mm_interconnect_0:timer_s1_chipselect -> timer:chipselect
	wire  [15:0] mm_interconnect_0_timer_s1_readdata;                       // timer:readdata -> mm_interconnect_0:timer_s1_readdata
	wire   [2:0] mm_interconnect_0_timer_s1_address;                        // mm_interconnect_0:timer_s1_address -> timer:address
	wire         mm_interconnect_0_timer_s1_write;                          // mm_interconnect_0:timer_s1_write -> timer:write_n
	wire  [15:0] mm_interconnect_0_timer_s1_writedata;                      // mm_interconnect_0:timer_s1_writedata -> timer:writedata
	wire         mm_interconnect_0_mem_s1_chipselect;                       // mm_interconnect_0:mem_s1_chipselect -> mem:chipselect
	wire  [31:0] mm_interconnect_0_mem_s1_readdata;                         // mem:readdata -> mm_interconnect_0:mem_s1_readdata
	wire  [12:0] mm_interconnect_0_mem_s1_address;                          // mm_interconnect_0:mem_s1_address -> mem:address
	wire   [3:0] mm_interconnect_0_mem_s1_byteenable;                       // mm_interconnect_0:mem_s1_byteenable -> mem:byteenable
	wire         mm_interconnect_0_mem_s1_write;                            // mm_interconnect_0:mem_s1_write -> mem:write
	wire  [31:0] mm_interconnect_0_mem_s1_writedata;                        // mm_interconnect_0:mem_s1_writedata -> mem:writedata
	wire         mm_interconnect_0_mem_s1_clken;                            // mm_interconnect_0:mem_s1_clken -> mem:clken
	wire         irq_mapper_receiver0_irq;                                  // timer:irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                  // jtag_uart:av_irq -> irq_mapper:receiver1_irq
	wire         irq_mapper_receiver2_irq;                                  // fifo_in:rdclk_control_slave_irq -> irq_mapper:receiver2_irq
	wire  [31:0] cpu_irq_irq;                                               // irq_mapper:sender_irq -> cpu:irq
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [address:reset_in, cpu:reset_n, fifo_in:rdreset_n, fifo_out:wrreset_n, irq_mapper:reset, jtag_uart:rst_n, mem:reset, mm_interconnect_0:cpu_reset_reset_bridge_in_reset_reset, rst_translator:in_reset, timer:reset_n]
	wire         rst_controller_reset_out_reset_req;                        // rst_controller:reset_req -> [cpu:reset_req, rst_translator:reset_req_in]
	wire         cpu_debug_reset_request_reset;                             // cpu:debug_reset_request -> [rst_controller:reset_in2, rst_controller_001:reset_in2]
	wire         rst_controller_001_reset_out_reset;                        // rst_controller_001:reset_out -> [fifo_in:wrreset_n, fifo_out:rdreset_n]

	conduit_avalon_mm_bridge address (
		.clk_in       (clk_processing_clk),                     //   clock.clk
		.reset_in     (rst_controller_reset_out_reset),         //   reset.reset
		.out_address  (mm_interconnect_0_address_out_address),  //     out.address
		.out_read     (mm_interconnect_0_address_out_read),     //        .read
		.out_readdata (mm_interconnect_0_address_out_readdata), //        .readdata
		.in_data      (address_address)                         // address.address
	);

	dircc_system_nios_test_version_node_0_processing_cpu cpu (
		.clk                                 (clk_processing_clk),                                //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                   //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                //                          .reset_req
		.d_address                           (cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (cpu_data_master_read),                              //                          .read
		.d_readdata                          (cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (cpu_data_master_write),                             //                          .write
		.d_writedata                         (cpu_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (cpu_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (cpu_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                   // custom_instruction_master.readra
	);

	dircc_system_nios_test_version_node_0_processing_fifo_in fifo_in (
		.wrclock                         (clk_routing_clk),                             //    clk_in.clk
		.wrreset_n                       (~rst_controller_001_reset_out_reset),         //  reset_in.reset_n
		.rdclock                         (clk_processing_clk),                          //   clk_out.clk
		.rdreset_n                       (~rst_controller_reset_out_reset),             // reset_out.reset_n
		.avalonst_sink_valid             (stream_in_valid),                             //        in.valid
		.avalonst_sink_data              (stream_in_data),                              //          .data
		.avalonst_sink_startofpacket     (stream_in_startofpacket),                     //          .startofpacket
		.avalonst_sink_endofpacket       (stream_in_endofpacket),                       //          .endofpacket
		.avalonst_sink_empty             (stream_in_empty),                             //          .empty
		.avalonst_sink_ready             (stream_in_ready),                             //          .ready
		.avalonmm_read_slave_readdata    (mm_interconnect_0_fifo_in_out_readdata),      //       out.readdata
		.avalonmm_read_slave_read        (mm_interconnect_0_fifo_in_out_read),          //          .read
		.avalonmm_read_slave_address     (mm_interconnect_0_fifo_in_out_address),       //          .address
		.avalonmm_read_slave_waitrequest (mm_interconnect_0_fifo_in_out_waitrequest),   //          .waitrequest
		.rdclk_control_slave_address     (mm_interconnect_0_fifo_in_out_csr_address),   //   out_csr.address
		.rdclk_control_slave_read        (mm_interconnect_0_fifo_in_out_csr_read),      //          .read
		.rdclk_control_slave_writedata   (mm_interconnect_0_fifo_in_out_csr_writedata), //          .writedata
		.rdclk_control_slave_write       (mm_interconnect_0_fifo_in_out_csr_write),     //          .write
		.rdclk_control_slave_readdata    (mm_interconnect_0_fifo_in_out_csr_readdata),  //          .readdata
		.rdclk_control_slave_irq         (irq_mapper_receiver2_irq)                     //   out_irq.irq
	);

	dircc_system_nios_test_version_node_0_processing_fifo_out fifo_out (
		.wrclock                          (clk_processing_clk),                          //    clk_in.clk
		.wrreset_n                        (~rst_controller_reset_out_reset),             //  reset_in.reset_n
		.rdclock                          (clk_routing_clk),                             //   clk_out.clk
		.rdreset_n                        (~rst_controller_001_reset_out_reset),         // reset_out.reset_n
		.avalonmm_write_slave_writedata   (mm_interconnect_0_fifo_out_in_writedata),     //        in.writedata
		.avalonmm_write_slave_write       (mm_interconnect_0_fifo_out_in_write),         //          .write
		.avalonmm_write_slave_address     (mm_interconnect_0_fifo_out_in_address),       //          .address
		.avalonmm_write_slave_waitrequest (mm_interconnect_0_fifo_out_in_waitrequest),   //          .waitrequest
		.avalonst_source_valid            (stream_out_valid),                            //       out.valid
		.avalonst_source_data             (stream_out_data),                             //          .data
		.avalonst_source_startofpacket    (stream_out_startofpacket),                    //          .startofpacket
		.avalonst_source_endofpacket      (stream_out_endofpacket),                      //          .endofpacket
		.avalonst_source_empty            (stream_out_empty),                            //          .empty
		.avalonst_source_ready            (stream_out_ready),                            //          .ready
		.wrclk_control_slave_address      (mm_interconnect_0_fifo_out_in_csr_address),   //    in_csr.address
		.wrclk_control_slave_read         (mm_interconnect_0_fifo_out_in_csr_read),      //          .read
		.wrclk_control_slave_writedata    (mm_interconnect_0_fifo_out_in_csr_writedata), //          .writedata
		.wrclk_control_slave_write        (mm_interconnect_0_fifo_out_in_csr_write),     //          .write
		.wrclk_control_slave_readdata     (mm_interconnect_0_fifo_out_in_csr_readdata)   //          .readdata
	);

	dircc_system_nios_test_version_node_0_processing_jtag_uart jtag_uart (
		.clk            (clk_processing_clk),                                        //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver1_irq)                                   //               irq.irq
	);

	dircc_system_nios_test_version_node_131073_processing_mem mem (
		.address     (mm_interconnect_0_mem_s1_address),    //     s1.address
		.clken       (mm_interconnect_0_mem_s1_clken),      //       .clken
		.chipselect  (mm_interconnect_0_mem_s1_chipselect), //       .chipselect
		.write       (mm_interconnect_0_mem_s1_write),      //       .write
		.readdata    (mm_interconnect_0_mem_s1_readdata),   //       .readdata
		.writedata   (mm_interconnect_0_mem_s1_writedata),  //       .writedata
		.byteenable  (mm_interconnect_0_mem_s1_byteenable), //       .byteenable
		.address2    (mem_address),                         //     s2.address
		.chipselect2 (mem_chipselect),                      //       .chipselect
		.clken2      (mem_clken),                           //       .clken
		.write2      (mem_write),                           //       .write
		.readdata2   (mem_readdata),                        //       .readdata
		.writedata2  (mem_writedata),                       //       .writedata
		.byteenable2 (mem_byteenable),                      //       .byteenable
		.clk         (clk_processing_clk),                  //   clk1.clk
		.reset       (rst_controller_reset_out_reset),      // reset1.reset
		.freeze      (1'b0),                                // (terminated)
		.reset_req   (1'b0)                                 // (terminated)
	);

	dircc_system_nios_test_version_node_0_processing_timer timer (
		.clk        (clk_processing_clk),                    //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),       // reset.reset_n
		.address    (mm_interconnect_0_timer_s1_address),    //    s1.address
		.writedata  (mm_interconnect_0_timer_s1_writedata),  //      .writedata
		.readdata   (mm_interconnect_0_timer_s1_readdata),   //      .readdata
		.chipselect (mm_interconnect_0_timer_s1_chipselect), //      .chipselect
		.write_n    (~mm_interconnect_0_timer_s1_write),     //      .write_n
		.irq        (irq_mapper_receiver0_irq)               //   irq.irq
	);

	dircc_system_nios_test_version_node_0_processing_mm_interconnect_0 mm_interconnect_0 (
		.clk_processing_clk_clk                  (clk_processing_clk),                                        //              clk_processing_clk.clk
		.cpu_reset_reset_bridge_in_reset_reset   (rst_controller_reset_out_reset),                            // cpu_reset_reset_bridge_in_reset.reset
		.cpu_data_master_address                 (cpu_data_master_address),                                   //                 cpu_data_master.address
		.cpu_data_master_waitrequest             (cpu_data_master_waitrequest),                               //                                .waitrequest
		.cpu_data_master_byteenable              (cpu_data_master_byteenable),                                //                                .byteenable
		.cpu_data_master_read                    (cpu_data_master_read),                                      //                                .read
		.cpu_data_master_readdata                (cpu_data_master_readdata),                                  //                                .readdata
		.cpu_data_master_write                   (cpu_data_master_write),                                     //                                .write
		.cpu_data_master_writedata               (cpu_data_master_writedata),                                 //                                .writedata
		.cpu_data_master_debugaccess             (cpu_data_master_debugaccess),                               //                                .debugaccess
		.cpu_instruction_master_address          (cpu_instruction_master_address),                            //          cpu_instruction_master.address
		.cpu_instruction_master_waitrequest      (cpu_instruction_master_waitrequest),                        //                                .waitrequest
		.cpu_instruction_master_read             (cpu_instruction_master_read),                               //                                .read
		.cpu_instruction_master_readdata         (cpu_instruction_master_readdata),                           //                                .readdata
		.address_out_address                     (mm_interconnect_0_address_out_address),                     //                     address_out.address
		.address_out_read                        (mm_interconnect_0_address_out_read),                        //                                .read
		.address_out_readdata                    (mm_interconnect_0_address_out_readdata),                    //                                .readdata
		.cpu_debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),             //             cpu_debug_mem_slave.address
		.cpu_debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),               //                                .write
		.cpu_debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),                //                                .read
		.cpu_debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),            //                                .readdata
		.cpu_debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),           //                                .writedata
		.cpu_debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),          //                                .byteenable
		.cpu_debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest),         //                                .waitrequest
		.cpu_debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess),         //                                .debugaccess
		.fifo_in_out_address                     (mm_interconnect_0_fifo_in_out_address),                     //                     fifo_in_out.address
		.fifo_in_out_read                        (mm_interconnect_0_fifo_in_out_read),                        //                                .read
		.fifo_in_out_readdata                    (mm_interconnect_0_fifo_in_out_readdata),                    //                                .readdata
		.fifo_in_out_waitrequest                 (mm_interconnect_0_fifo_in_out_waitrequest),                 //                                .waitrequest
		.fifo_in_out_csr_address                 (mm_interconnect_0_fifo_in_out_csr_address),                 //                 fifo_in_out_csr.address
		.fifo_in_out_csr_write                   (mm_interconnect_0_fifo_in_out_csr_write),                   //                                .write
		.fifo_in_out_csr_read                    (mm_interconnect_0_fifo_in_out_csr_read),                    //                                .read
		.fifo_in_out_csr_readdata                (mm_interconnect_0_fifo_in_out_csr_readdata),                //                                .readdata
		.fifo_in_out_csr_writedata               (mm_interconnect_0_fifo_in_out_csr_writedata),               //                                .writedata
		.fifo_out_in_address                     (mm_interconnect_0_fifo_out_in_address),                     //                     fifo_out_in.address
		.fifo_out_in_write                       (mm_interconnect_0_fifo_out_in_write),                       //                                .write
		.fifo_out_in_writedata                   (mm_interconnect_0_fifo_out_in_writedata),                   //                                .writedata
		.fifo_out_in_waitrequest                 (mm_interconnect_0_fifo_out_in_waitrequest),                 //                                .waitrequest
		.fifo_out_in_csr_address                 (mm_interconnect_0_fifo_out_in_csr_address),                 //                 fifo_out_in_csr.address
		.fifo_out_in_csr_write                   (mm_interconnect_0_fifo_out_in_csr_write),                   //                                .write
		.fifo_out_in_csr_read                    (mm_interconnect_0_fifo_out_in_csr_read),                    //                                .read
		.fifo_out_in_csr_readdata                (mm_interconnect_0_fifo_out_in_csr_readdata),                //                                .readdata
		.fifo_out_in_csr_writedata               (mm_interconnect_0_fifo_out_in_csr_writedata),               //                                .writedata
		.jtag_uart_avalon_jtag_slave_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //     jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write       (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //                                .write
		.jtag_uart_avalon_jtag_slave_read        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //                                .read
		.jtag_uart_avalon_jtag_slave_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                                .readdata
		.jtag_uart_avalon_jtag_slave_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                                .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                                .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //                                .chipselect
		.mem_s1_address                          (mm_interconnect_0_mem_s1_address),                          //                          mem_s1.address
		.mem_s1_write                            (mm_interconnect_0_mem_s1_write),                            //                                .write
		.mem_s1_readdata                         (mm_interconnect_0_mem_s1_readdata),                         //                                .readdata
		.mem_s1_writedata                        (mm_interconnect_0_mem_s1_writedata),                        //                                .writedata
		.mem_s1_byteenable                       (mm_interconnect_0_mem_s1_byteenable),                       //                                .byteenable
		.mem_s1_chipselect                       (mm_interconnect_0_mem_s1_chipselect),                       //                                .chipselect
		.mem_s1_clken                            (mm_interconnect_0_mem_s1_clken),                            //                                .clken
		.timer_s1_address                        (mm_interconnect_0_timer_s1_address),                        //                        timer_s1.address
		.timer_s1_write                          (mm_interconnect_0_timer_s1_write),                          //                                .write
		.timer_s1_readdata                       (mm_interconnect_0_timer_s1_readdata),                       //                                .readdata
		.timer_s1_writedata                      (mm_interconnect_0_timer_s1_writedata),                      //                                .writedata
		.timer_s1_chipselect                     (mm_interconnect_0_timer_s1_chipselect)                      //                                .chipselect
	);

	dircc_system_nios_test_version_node_0_processing_irq_mapper irq_mapper (
		.clk           (clk_processing_clk),             //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.receiver2_irq (irq_mapper_receiver2_irq),       // receiver2.irq
		.sender_irq    (cpu_irq_irq)                     //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (3),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
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
		.reset_in0      (~reset_processing_reset_n),          // reset_in0.reset
		.reset_in1      (~reset_routing_reset_n),             // reset_in1.reset
		.reset_in2      (cpu_debug_reset_request_reset),      // reset_in2.reset
		.clk            (clk_processing_clk),                 //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (3),
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
	) rst_controller_001 (
		.reset_in0      (~reset_routing_reset_n),             // reset_in0.reset
		.reset_in1      (~reset_processing_reset_n),          // reset_in1.reset
		.reset_in2      (cpu_debug_reset_request_reset),      // reset_in2.reset
		.clk            (clk_routing_clk),                    //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
