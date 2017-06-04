
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
  
  bit [35:0]  payload;
  reg payload_valid;
  logic in_ready;
  
  assign sending = (packet_state != IDLE) ? '1 : '0;

  always_comb begin
    in_ready = ready || ~valid;
  end
  
  always_ff @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
      valid <= 0;
      payload_valid <= 0;
      packet_state <= IDLE;
    end
    else begin

      if (payload_valid) begin
        valid <= 1;
      end else if (ready) begin
        valid <= 0;
      end if (payload_valid && in_ready) begin
        payload_valid <= 0;
        {data, startofpacket, endofpacket, empty} <= payload;
      end

      case(packet_state)
        IDLE: begin
          // valid <= 0;
        end
        DEST_ADDR0: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {packet_to_send.dest_addr.hw_addr, 1'b1, 1'b0, 2'b0};
            packet_state <= DEST_ADDR1;
            $display("%0t:%m - INFO - Sent dest_hw_addr", $time);
          end
          // startofpacket <= 1;
          // endofpacket <= 0;
          // empty <= 0;
          // data <= packet_to_send.dest_addr.hw_addr;
          // if(ready) begin
          //   packet_state <= DEST_ADDR1;
          //   $display("%0t:%m - INFO - Sent dest_hw_addr", $time);
          // end
        end
        DEST_ADDR1: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {{packet_to_send.dest_addr.sw_addr, packet_to_send.dest_addr.port, packet_to_send.dest_addr.flag, NULL_BYTE}, 1'b0, 1'b0, 2'b0};
            packet_state <= SRC_ADDR0;
            $display("%0t:%m - INFO - Sent dest_sw_addr", $time);
          end
          // valid <= 1;
          // startofpacket <= 0;
          // endofpacket <= 0;
          // empty <= 0;
          // data <= {packet_to_send.dest_addr.sw_addr, packet_to_send.dest_addr.port, packet_to_send.dest_addr.flag, NULL_BYTE};
          // if(ready) begin
          //   packet_state <= SRC_ADDR0;
          //   $display("%0t:%m - INFO - Sent dest_sw_addr", $time);
          // end
        end
        SRC_ADDR0: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {packet_to_send.src_addr.hw_addr, 1'b0, 1'b0, 2'b0};
            packet_state <= SRC_ADDR1;
            $display("%0t:%m - INFO - Sent src_hw_addr", $time);
          end
          // valid <= 1;
          // startofpacket <= 0;
          // endofpacket <= 0;
          // empty <= 0;
          // data <= packet_to_send.src_addr.hw_addr;
          // if(ready) begin
          //   packet_state <= SRC_ADDR1;
          // end
        end
        SRC_ADDR1: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {{packet_to_send.src_addr.sw_addr, packet_to_send.src_addr.port, packet_to_send.src_addr.flag, NULL_BYTE}, 1'b0, 1'b0, 2'b0};
            packet_state <= LAMPORT;
            $display("%0t:%m - INFO - Sent Src_sw_addr", $time);
          end
          // valid <= 1;
          // startofpacket <= 0;
          // endofpacket <= 0;
          // empty <= 0;
          // data <= {packet_to_send.src_addr.sw_addr, packet_to_send.src_addr.port, packet_to_send.src_addr.flag, NULL_BYTE};
          // if(ready) begin
          //   packet_state <= LAMPORT;
          // end
        end
        LAMPORT: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {packet_to_send.lamport, 1'b0, 1'b0, 2'b0};
            packet_state <= DATA0;
            $display("%0t:%m - INFO - Sent lamport", $time);
          end
          // valid <= 1;
          // startofpacket <= 0;
          // endofpacket <= 0;
          // empty <= 0;
          // data <= packet_to_send.lamport;
          // if(ready) begin
          //   packet_state <= DATA0;
          // end
        end
        DATA0: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {packet_to_send.data[31:0], 1'b0, 1'b0, 2'b0};
            packet_state <= DATA1;
            $display("%0t:%m - INFO - Sent data0", $time);
          end
          // valid <= 1;
          // startofpacket <= 0;
          // endofpacket <= 0;
          // empty <= 0;
          // data <= packet_to_send.data[31:0];
          // if(ready) begin
          //   packet_state <= DATA1;
          // end
        end
        DATA1: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {packet_to_send.data[63:32], 1'b0, 1'b0, 2'b0};
            packet_state <= DATA2;
            $display("%0t:%m - INFO - Sent data1", $time);
          end
          // valid <= 1;
          // startofpacket <= 0;
          // endofpacket <= 0;
          // empty <= 0;
          // data <= packet_to_send.data[63:32];
          // if(ready) begin
          //   packet_state <= DATA2;
          // end
        end
        DATA2: begin
          if (in_ready) begin
            payload_valid <= 1;
            payload <= {packet_to_send.data[95:64], 1'b0, 1'b1, 2'b0};
            packet_state <= IDLE;
            $display("%0t:%m - INFO - Sent data2", $time);
          end
          // valid <= 1;
          // startofpacket <= 0;
          // endofpacket <= 1;
          // empty <= 0;
          // data <= packet_to_send.data[95:64];
          // if(ready) begin
          //   packet_state <= IDLE;
          // end
        end
      endcase

      if(write_packet) begin
        if (packet_state != IDLE) begin
          $display("%0t:%m - ERROR - Attempting to send while previous packet is sending", $time);
        end
        if (write_packet && packet_state == IDLE) begin
          packet_to_send <= packet_data;
          packet_state <= DEST_ADDR0;
        end
      end
    end
  end
  
endmodule : dircc_avalon_st_packet_sender
