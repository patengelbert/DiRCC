
`timescale 1ns / 1ns

module dircc_router #(
  parameter 
    SYMBOLS_PER_BEAT = 1,
    BITS_PER_SYMBOL = 8,
    USE_PACKETS = 1, // TODO: Not yet implemented, assumes 1
    USE_EMPTY = 1,
    USE_HIGH_BIT_SELECT = 1, // TODO: Not yet implemented, assumes 1
    PIPELINE_READY = 1, // TODO: Not yet implemented, assumes 1
    MAX_ROUTE_DIRECTION = 5, // TODO: Not yet implemented, assumes 5

    // Optional ST signal widths.  Value "0" means no such port.
    CHANNEL_WIDTH = 0,
    ERROR_WIDTH = 0,
  
    // Derived parameters
    DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL,
    ADDRESS_WIDTH = DATA_WIDTH/2, // TODO: This will not be the case if format changes or number of route directions do
    CHANNEL_SELECT_WIDTH = $clog2(MAX_ROUTE_DIRECTION),
    CHANNEL_OUT_WIDTH = CHANNEL_WIDTH + CHANNEL_SELECT_WIDTH,
    PACKET_WIDTH = USE_PACKETS ? 2 : 0,
    EMPTY_WIDTH = USE_EMPTY ? $clog2(SYMBOLS_PER_BEAT) : 0
  )
  (
    input wire                                            clk,
    input wire                                            reset_n,
    
    input wire [DATA_WIDTH - 1 : 0]                       address,

    output reg                                            in_ready,
    input                                                 in_valid,
    input wire [DATA_WIDTH - 1 : 0]                            in_data,
//    input wire [(CHANNEL_WIDTH ? (CHANNEL_WIDTH - 1) : 0) : 0] in_channel,
//    input wire [(ERROR_WIDTH ? (ERROR_WIDTH - 1) : 0) : 0]     in_error,
    input wire                                            in_startofpacket,
    input wire                                            in_endofpacket,
    input wire [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0]     in_empty,

    input wire                                            out_ready,
    output reg                                            out_valid,
    output reg [DATA_WIDTH - 1 : 0]                       out_data,
    output reg [(CHANNEL_OUT_WIDTH ? (CHANNEL_OUT_WIDTH - 1) : 0) : 0]  out_channel,
//    output reg [(ERROR_WIDTH ? (ERROR_WIDTH - 1) : 0) : 0]              out_error,
    output reg                                            out_startofpacket,
    output reg                                            out_endofpacket,
    output reg [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0]              out_empty
);  
    localparam PAYLOAD_WIDTH = 
      DATA_WIDTH +
      PACKET_WIDTH +
      CHANNEL_WIDTH +
      EMPTY_WIDTH +
      ERROR_WIDTH;

    // ---------------------------------------------------------------------
    //| Signal Declarations
    // ---------------------------------------------------------------------
    
    typedef enum bit [CHANNEL_SELECT_WIDTH - 1 : 0] { HERE, NORTH, SOUTH, EAST, WEST } Direction;
 
    wire                                  in_ready_wire;
    logic [PAYLOAD_WIDTH - 1 : 0]          in_payload;

    Direction                             decision;
    Direction                             select;
    wire               								    out_valid_wire;
    reg                								    packet_in_progress;
    wire [PAYLOAD_WIDTH - 1 : 0]    			out_payload;
    logic [CHANNEL_WIDTH - 1 : 0]         out_data_channel;
    logic [ADDRESS_WIDTH - 1 : 0]					x_address;
    logic [ADDRESS_WIDTH - 1 : 0]					y_address;
    logic [ADDRESS_WIDTH - 1 : 0] 				x_packet_address;
    logic [ADDRESS_WIDTH - 1 : 0]					y_packet_address;
    
    // ---------------------------------------------------------------------
    //| Input Mapping
    // ---------------------------------------------------------------------
    always @* begin
      in_ready   = in_ready_wire;
//      in_payload = {in_data, in_startofpacket, in_endofpacket, in_channel, in_empty, in_error};
      in_payload = {in_data, in_startofpacket, in_endofpacket, in_empty};

      {y_address, x_address} = address; // Fixed address of node
      {y_packet_address, x_packet_address} = in_data;
    end
    
    // ---------------------------------------------------------------------
    //| Routing Algorithm
    // ---------------------------------------------------------------------
    always @* begin
      // Routing is done on a 2D grid awith the top left corner = 0,0
      if (y_packet_address == y_address && x_packet_address == x_address) decision = HERE; // reached destination
      else if (y_packet_address < y_address) decision = NORTH; // Send it north
      else if (x_packet_address > x_address) decision = EAST; // Send it east
      else if (y_packet_address > y_address) decision = SOUTH; // Send it south
      else if (x_packet_address < x_address) decision = WEST; // Send it west
      else begin
        $display("Unknown addresses");
        decision = NORTH;
      end
    end
    
    // ---------------------------------------------------------------------
    //| Capture Decision
    // ---------------------------------------------------------------------
    always @(negedge reset_n, posedge clk) begin
      if (!reset_n) begin
        select <= NORTH;
        packet_in_progress <= 0;
      end else begin
        if (!in_valid && !packet_in_progress) begin
          select <= NORTH; // We have no data to intepret
        end
        if (in_startofpacket && in_valid && out_ready) begin
          select <= decision; // we only want to capture the decision if we have the start of a packet
          packet_in_progress <= 1;
        end
        if (in_endofpacket && in_valid && out_ready) begin
          packet_in_progress <= 0;
        end
      end
    end

    // ---------------------------------------------------------------------
    //| output Pipeline
    // ---------------------------------------------------------------------
    poets_routing_output_router_1stage_pipeline#( 
      .PAYLOAD_WIDTH(PAYLOAD_WIDTH)
    ) outpipe
    ( 
      .clk (clk),
      .reset_n (reset_n),
      .in_ready (in_ready_wire),
      .in_valid (in_valid),
      .in_payload (in_payload),
      .out_ready(out_ready),
      .out_valid(out_valid_wire),
      .out_payload(out_payload)
    );

    // ---------------------------------------------------------------------
    //| Output Mapping
    // ---------------------------------------------------------------------
    always @* begin
      out_valid = out_valid_wire;
//      {out_data, out_startofpacket, out_endofpacket, out_data_channel, out_empty, out_error} = out_payload;
//      out_channel = {out_select, out_data_channel};
      {out_data, out_startofpacket, out_endofpacket, out_empty} = out_payload;
      out_channel = select;
    end
endmodule
 
//  --------------------------------------------------------------------------------
// | single buffered pipeline stage
//  --------------------------------------------------------------------------------
module poets_routing_output_router_1stage_pipeline
  #( parameter PAYLOAD_WIDTH = 8 )
    ( input                             clk,
         input                          reset_n,
         output reg                     in_ready,
         input                          in_valid,
         input      [PAYLOAD_WIDTH-1:0] in_payload,
         input                          out_ready,
         output reg                     out_valid,
         output reg [PAYLOAD_WIDTH-1:0] out_payload
      );
   reg                                  in_ready1;


   always @* begin
      in_ready = out_ready || ~out_valid;
      //     in_ready = in_ready1;
      //     if (!out_ready)
      //       in_ready = 0;
   end
   always @ (negedge reset_n, posedge clk) begin
      if (!reset_n) begin
         in_ready1 <= 0;
         out_valid <= 0;
         out_payload <= 0;
      end else begin
         in_ready1 <= out_ready || !out_valid;
         if (in_valid) begin
            out_valid <= 1;
         end else if (out_ready) begin
            out_valid <= 0;
         end
         if(in_valid && in_ready) begin
            out_payload <= in_payload;
         end
      end // else: !if(!reset_n)
   end // always @ (negedge reset_n, posedge clk)
	
endmodule //
