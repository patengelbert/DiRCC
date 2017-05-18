
module dircc_avalon_st_packet_sender(
  clk,
  reset_n,

  data,
  empty,
  startofpacket,
  endofpacket,
  ready,
  valid,

  sending
);

  parameter BITS_PER_SYMBOL = 8;
  parameter SYMBOLS_PER_BEAT = 4;
  localparam DATA_WIDTH = BITS_PER_SYMBOL * SYMBOLS_PER_BEAT;
  localparam EMPTY_WIDTH = $clog2(SYMBOLS_PER_BEAT);
  localparam NULL_BYTE = 8'b0;

  input  wire                   clk;
  input  wire                   reset_n;
  
  output reg [DATA_WIDTH-1:0]   data;
  output reg [EMPTY_WIDTH-1:0]  empty;
  output reg                    startofpacket;
  output reg                    endofpacket;
  input  wire                   ready;
  output reg                    valid;
  
  output wire                   sending;

  import dircc_types_pkg::*;
  
  typedef enum logic[5:0] {IDLE, DEST_ADDR0, DEST_ADDR1, SRC_ADDR0, SRC_ADDR1, LAMPORT, DATA0, DATA1, DATA2} packetState_t;
  
  packet_t packetToSend;
  packetState_t packetState;
  
  assign sending = (packetState != IDLE) ? 1 : 0;
  
  always_ff @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
      valid <= 0;
      packetState <= IDLE;
    end
    else begin
      case(packetState)
        IDLE: begin
          valid <= 0;
        end
        DEST_ADDR0: begin
          if(ready) begin
            valid <= 1;
            startofpacket <= 1;
            endofpacket <= 0;
            empty <= 0;
            data <= packetToSend.dest_addr.hw_addr;
            packetState <= DEST_ADDR1;
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
            data <= {packetToSend.dest_addr.sw_addr, packetToSend.dest_addr.port, packetToSend.dest_addr.flag, NULL_BYTE};
            packetState <= SRC_ADDR0;
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
            data <= packetToSend.src_addr.hw_addr;
            packetState <= SRC_ADDR1;
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
            data <= {packetToSend.src_addr.sw_addr, packetToSend.src_addr.port, packetToSend.src_addr.flag, NULL_BYTE};
            packetState <= LAMPORT;
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
            data <= packetToSend.lamport;
            packetState <= DATA0;
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
            data <= packetToSend.data[31:0];
            packetState <= DATA1;
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
            data <= packetToSend.data[63:32];
            packetState <= DATA2;
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
            data <= packetToSend.data[95:64];
            packetState <= IDLE;
          end
          else begin
            valid <= 0;
          end
        end
      endcase
    end
  end
  
  task sendPacket(input packet_t packet);
    packetToSend = packet;
    packetState = DEST_ADDR0;
  endtask : sendPacket
  
endmodule : dircc_avalon_st_packet_sender
