
module dircc_avalon_st_packet_receiver(
  clk,
  reset_n,

  data,
  empty,
  startofpacket,
  endofpacket,
  ready,
  valid,

  receiving
);

  parameter BITS_PER_SYMBOL = 8;
  parameter SYMBOLS_PER_BEAT = 4;
  parameter INPUT_FIFO_DEPTH = 8;
  localparam DATA_WIDTH = BITS_PER_SYMBOL * SYMBOLS_PER_BEAT;
  localparam EMPTY_WIDTH = $clog2(SYMBOLS_PER_BEAT);
  localparam NULL_BYTE = 8'b0;

  input  wire                   clk;
  input  wire                   reset_n;
  
  input wire [DATA_WIDTH-1:0]   data;
  input wire [EMPTY_WIDTH-1:0]  empty;
  input wire                    startofpacket;
  input wire                    endofpacket;
  output reg                    ready;
  input wire                    valid;

  output wire                   receiving;

  import dircc_types_pkg::*;
  
  typedef enum logic[5:0] {IDLE, DEST_ADDR0, DEST_ADDR1, SRC_ADDR0, SRC_ADDR1, LAMPORT, DATA0, DATA1, DATA2} packetState_t;
  
  wire [DATA_WIDTH-1:0]   input_fifo_out_data;
  wire [EMPTY_WIDTH-1:0]  input_fifo_out_empty;
  wire                    input_fifo_out_startofpacket;
  wire                    input_fifo_out_endofpacket;
  reg                     input_fifo_out_ready;
  wire                    input_fifo_out_valid;

  bool packetDone;

  packet_t currentPacket;
  packetState_t packetState;

  assign receiving = (packetDone == FALSE) ? 1 : 0;

  // assign input_fifo_out_data = data;
  // assign input_fifo_out_empty = empty;
  // assign input_fifo_out_endofpacket = endofpacket;
  // assign ready = input_fifo_out_ready;
  // assign input_fifo_out_startofpacket = startofpacket;
  // assign input_fifo_out_valid = valid;

  altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (SYMBOLS_PER_BEAT),
		.BITS_PER_SYMBOL     (BITS_PER_SYMBOL),
		.FIFO_DEPTH          (INPUT_FIFO_DEPTH),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (0),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) input_fifo (
		.clk               (clk),                                  //       clk.clk
		.reset             (~reset_n),                              // clk_reset.reset
		.in_data           (data),                                 //        in.data
		.in_valid          (valid),                                //          .valid
		.in_ready          (ready),                                //          .ready
		.in_startofpacket  (startofpacket),                        //          .startofpacket
		.in_endofpacket    (endofpacket),                          //          .endofpacket
		.in_empty          (empty),                                //          .empty
		.out_data          (input_fifo_out_data),                  //       out.data
		.out_valid         (input_fifo_out_valid),                 //          .valid
		.out_ready         (input_fifo_out_ready),                 //          .ready
		.out_startofpacket (input_fifo_out_startofpacket),         //          .startofpacket
		.out_endofpacket   (input_fifo_out_endofpacket),           //          .endofpacket
		.out_empty         (input_fifo_out_empty),                 //          .empty
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
  
  always_ff @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
      input_fifo_out_ready <= 0;
      packetDone <= FALSE;
      packetState <= DEST_ADDR0;
    end
    else if (packetDone == FALSE) begin
      input_fifo_out_ready <= 1;
      case(packetState)
        DEST_ADDR0: begin
          if (input_fifo_out_valid) begin
            assert(input_fifo_out_startofpacket);
            currentPacket.dest_addr.hw_addr <= input_fifo_out_data;
            packetState <= DEST_ADDR1;
          end
        end
        DEST_ADDR1: begin
          if (input_fifo_out_valid) begin
            {currentPacket.dest_addr.sw_addr, currentPacket.dest_addr.port, currentPacket.dest_addr.flag} <= input_fifo_out_data[31:8];
            packetState <= SRC_ADDR0;
          end
        end
        SRC_ADDR0: begin
          if (input_fifo_out_valid) begin
            currentPacket.src_addr.hw_addr <= input_fifo_out_data;
            packetState <= SRC_ADDR1;
          end
        end
        SRC_ADDR1: begin
          if (input_fifo_out_valid) begin
            {currentPacket.src_addr.sw_addr, currentPacket.src_addr.port, currentPacket.src_addr.flag} <= input_fifo_out_data[31:8];
            packetState <= LAMPORT;
          end
        end
        LAMPORT: begin
          if (input_fifo_out_valid) begin
            currentPacket.lamport = input_fifo_out_data;
            packetState <= DATA0;
          end
        end
        DATA0: begin
          if (input_fifo_out_valid) begin
            currentPacket.data[31:0] = input_fifo_out_data;
            packetState <= DATA1;
          end
        end
        DATA1: begin
          if (input_fifo_out_valid) begin
            currentPacket.data[63:32] = input_fifo_out_data;
            packetState <= DATA2;
          end
        end
        DATA2: begin
          if (input_fifo_out_valid) begin
            assert(input_fifo_out_endofpacket);
            currentPacket.data[95:64] = input_fifo_out_data;
            packetState <= DEST_ADDR0;
            packetDone <= TRUE;
            input_fifo_out_ready <= 0;
          end
        end
      endcase
    end else begin
      input_fifo_out_ready <= 0;
      packetState <= DEST_ADDR0;
    end
  end
  
  task receivePacket(output packet_t packet);
    packet = currentPacket;
    packetDone = FALSE;
  endtask : receivePacket
  
endmodule : dircc_avalon_st_packet_receiver
