
`timescale 1ns / 1ns

module DIRCC_router #(
    parameter 
      SYMBOLS_PER_BEAT = 1,
      BITS_PER_SYMBOL = 8,
      USE_PACKETS = 0,
      USE_EMPTY = 0,
		USE_HIGH_BIT_SELECT = 1,
      PIPELINE_READY = 1,
		MAX_ROUTE_DIRECTION = 1,

      // Optional ST signal widths.  Value "0" means no such port.
      CHANNEL_WIDTH = 0,
      ERROR_WIDTH = 0,

      // Derived parameters
      DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL,
		ADDRESS_WIDTH = DATA_WIDTH/2,
		CHANNEL_SELECT_WIDTH = $clog2(MAX_ROUTE_DIRECTION),
		CHANNEL_OUT_WIDTH = CHANNEL_WIDTH + CHANNEL_SELECT_WIDTH,
      PACKET_WIDTH = 0,
      EMPTY_WIDTH = 0
  )
  (
    input clk,
    input reset,

    output reg in_ready,
    input in_valid,
    input [DATA_WIDTH - 1 : 0] in_data,
    input [(CHANNEL_WIDTH ? (CHANNEL_WIDTH - 1) : 0) : 0] in_channel,
    input [(ERROR_WIDTH ? (ERROR_WIDTH - 1) : 0) : 0] in_error,
    input in_startofpacket,
    input in_endofpacket,
    input [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0] in_empty,
	 
	 input [DATA_WIDTH - 1 : 0] address,

    input out_ready,
    output reg out_valid,
    output reg [DATA_WIDTH - 1 : 0] out_data,
    output reg [(CHANNEL_OUT_WIDTH ? (CHANNEL_OUT_WIDTH - 1) : 0) : 0] out_channel,
    output reg [(ERROR_WIDTH ? (ERROR_WIDTH - 1) : 0) : 0] out_error,
    output reg out_startofpacket,
    output reg out_endofpacket,
    output reg [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0] out_empty
);  
	localparam 
     PAYLOAD_WIDTH = 
      DATA_WIDTH +
      PACKET_WIDTH +
      CHANNEL_WIDTH +
      EMPTY_WIDTH +
      ERROR_WIDTH;

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
	wire           in_ready_wire;
   reg [PAYLOAD_WIDTH - 1: 0]  in_payload;
	
   reg            lhs_ready;
   wire           lhs_valid; 
 
   reg [CHANNEL_SELECT_WIDTH - 1 : 0]        decision = 0;
   reg [CHANNEL_SELECT_WIDTH - 1 : 0]        select = 0;
   wire               								out_valid_wire;
   reg                								packet_in_progress;
   wire [CHANNEL_SELECT_WIDTH - 1 : 0]       out_select;   
   wire [PAYLOAD_WIDTH - 1 : 0]    				out_payload;
	wire [ADDRESS_WIDTH - 1 : 0]					x_address;
	wire [ADDRESS_WIDTH - 1 : 0]					y_address;
	reg [ADDRESS_WIDTH - 1 : 0] 					x_packet_address = 0;
	reg [ADDRESS_WIDTH - 1 : 0]					y_packet_address = 0;
	
	wire [(CHANNEL_WIDTH ? (CHANNEL_WIDTH - 1) : 0) : 0] out_temp_channel;
	
	// ---------------------------------------------------------------------
   //| Input Mapping
   // ---------------------------------------------------------------------
   always @* begin
		in_ready   = in_ready_wire;
      in_payload = {in_data, in_startofpacket, in_channel, in_endofpacket, in_empty, in_error};
		
		{y_address, x_address} = address;
		
		if (in_startofpacket) begin
			{y_packet_address, x_packet_address} = in_data;
		end
   end
	
	// ---------------------------------------------------------------------
   //| Routing Algorithm
   // ---------------------------------------------------------------------
   always @* begin
         
		if (y_packet_address == y_address && x_packet_address == x_address) decision = 4; // reached destination
		else if (y_packet_address > y_address) decision = 0; // Send it up
		else if (x_packet_address > x_address) decision = 1; // Send it east
		else if (y_packet_address < y_address) decision = 2; // Send it south
		else if (x_packet_address < x_address) decision = 3; // Send it west
		else assert(0); // (Should never do this
   end
	
	// ---------------------------------------------------------------------
   //| Capture Decision
   // ---------------------------------------------------------------------
   always @(posedge reset, posedge clk) begin
      if (reset) begin
         select <= 0;
         packet_in_progress <= 0;
      end else begin
         if (!in_valid && !packet_in_progress) begin
            select <= decision;
         end else begin
            packet_in_progress <= 1;
         end
         if (in_endofpacket && in_valid && in_ready) begin
            select <= decision;
            packet_in_progress <= 0;
         end
      end
   end
	
   // ---------------------------------------------------------------------
   //| Back Pressure
   // ---------------------------------------------------------------------
	always @* begin
      in_ready_wire <= in_valid;
	end
	
	// ---------------------------------------------------------------------
   //| output Pipeline
   // ---------------------------------------------------------------------
   poets_routing_output_demux_1stage_pipeline  #( .PAYLOAD_WIDTH( PAYLOAD_WIDTH + CHANNEL_SELECT_WIDTH ) ) outpipe
              ( .clk      (clk ),
                .reset  (reset  ),
                .in_ready ( selected_ready ),
                .in_valid ( selected_valid ),
                .in_payload ({select,in_payload}),
                .out_ready(out_ready ),
                .out_valid(out_valid_wire),
                .out_payload({out_select,out_payload}) );
	
	// ---------------------------------------------------------------------
   //| Output Mapping
   // ---------------------------------------------------------------------
   always @* begin
      out_valid   = out_valid_wire;
      {out_data,out_startofpacket,out_temp_channel, out_endofpacket,out_empty} = out_payload;
      out_channel = {out_select, out_temp_channel};
   end
 endmodule
 
 
module poets_routing_output_demux_1stage_pipeline
  #( parameter PAYLOAD_WIDTH = 8 )
   ( input                          clk,
     input                          reset,
     output reg                     in_ready,
     input                          in_valid,
     input [PAYLOAD_WIDTH-1:0]      in_payload,
     input                          out_ready,
     output reg                     out_valid,
     output reg [PAYLOAD_WIDTH-1:0] out_payload
   );

   reg                              in_ready1;
   always @* begin
      in_ready = out_ready || ~out_valid;
         //     in_ready = in_ready1;
         //     if (!out_ready)
         //       in_ready = 0;
   end

   always @ (posedge reset, posedge clk) begin
      if (reset) begin
         in_ready1   <= 0;
         out_valid   <= 0;
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
 