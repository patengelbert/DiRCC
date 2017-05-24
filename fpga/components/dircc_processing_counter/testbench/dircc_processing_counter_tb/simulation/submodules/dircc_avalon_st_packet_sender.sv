
module dircc_avalon_st_packet_sender(
  clk,
  reset_n,

  data,
  empty,
  startofpacket,
  endofpacket,
  ready,
  valid,

  write_packet,
  packet_data,

  sending
);

  parameter BITS_PER_SYMBOL = 8;
  parameter SYMBOLS_PER_BEAT = 4;
  localparam DATA_WIDTH = BITS_PER_SYMBOL * SYMBOLS_PER_BEAT;
  localparam EMPTY_WIDTH = $clog2(SYMBOLS_PER_BEAT);
  localparam NULL_BYTE = 8'b0;

  import dircc_types_pkg::*;

  input  wire                   clk;
  input  wire                   reset_n;
  
  output reg [DATA_WIDTH-1:0]   data;
  output reg [EMPTY_WIDTH-1:0]  empty;
  output reg                    startofpacket;
  output reg                    endofpacket;
  input  wire                   ready;
  output reg                    valid;

  input wire                    write_packet;
  input packet_t                packet_data;
  
  output wire                   sending;
  
  typedef enum {IDLE, DEST_ADDR0, DEST_ADDR1, SRC_ADDR0, SRC_ADDR1, LAMPORT, DATA0, DATA1, DATA2} packet_state_t;
  
  packet_t packet_to_send;
  packet_state_t packet_state;
  
  assign sending = (packet_state != IDLE) ? '1 : '0;
  
  always_ff @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
      valid <= 0;
      packet_state <= IDLE;
    end
    else begin
      case(packet_state)
        IDLE: begin
          valid <= 0;
        end
        DEST_ADDR0: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 1;
            endofpacket <= 0;
            empty <= 0;
            data <= packet_to_send.dest_addr.hw_addr;
            packet_state <= DEST_ADDR1;
          end
          else begin
            valid <= 0;
          end
        end
        DEST_ADDR1: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 0;
            endofpacket <= 0;
            empty <= 0;
            data <= {packet_to_send.dest_addr.sw_addr, packet_to_send.dest_addr.port, packet_to_send.dest_addr.flag, NULL_BYTE};
            packet_state <= SRC_ADDR0;
          end
          else begin
            valid <= 0;
          end
        end
        SRC_ADDR0: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 0;
            endofpacket <= 0;
            empty <= 0;
            data <= packet_to_send.src_addr.hw_addr;
            packet_state <= SRC_ADDR1;
          end
          else begin
            valid <= 0;
          end
        end
        SRC_ADDR1: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 0;
            endofpacket <= 0;
            empty <= 0;
            data <= {packet_to_send.src_addr.sw_addr, packet_to_send.src_addr.port, packet_to_send.src_addr.flag, NULL_BYTE};
            packet_state <= LAMPORT;
          end
          else begin
            valid <= 0;
          end
        end
        LAMPORT: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 0;
            endofpacket <= 0;
            empty <= 0;
            data <= packet_to_send.lamport;
            packet_state <= DATA0;
          end
          else begin
            valid <= 0;
          end
        end
        DATA0: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 0;
            endofpacket <= 0;
            empty <= 0;
            data <= packet_to_send.data[31:0];
            packet_state <= DATA1;
          end
          else begin
            valid <= 0;
          end
        end
        DATA1: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 0;
            endofpacket <= 0;
            empty <= 0;
            data <= packet_to_send.data[63:32];
            packet_state <= DATA2;
          end
          else begin
            valid <= 0;
          end
        end
        DATA2: begin
          if(ready) begin
            valid <= 1 ;
            startofpacket <= 0;
            endofpacket <= 1;
            empty <= 0;
            data <= packet_to_send.data[95:64];
            packet_state <= IDLE;
          end
          else begin
            valid <= 0;
          end
        end
      endcase

      if (write_packet && !sending) begin
        packet_to_send <= packet_data;
        packet_state <= DEST_ADDR0;
      end
    end
  end
  
endmodule : dircc_avalon_st_packet_sender
