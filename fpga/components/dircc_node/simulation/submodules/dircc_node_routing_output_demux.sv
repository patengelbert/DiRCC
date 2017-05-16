// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// altera message_level level1
// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.

 
// $Id: //acds/rel/13.1/ip/.../avalon-st_demultiplexer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2013/09/09 $
// $Author: dmunday $


// --------------------------------------------------------------------------------
//| Avalon Streaming Demultiplexer
// --------------------------------------------------------------------------------


`timescale 1ns / 100ps
// ------------------------------------------
// Generation parameters:
//   output_name:        dircc_node_routing_output_demux
//   use_packets:        true
//   use_empty:          1
//   empty_width:        2
//   data_width:         32
//   channel_width:      3
//   error_width:        0
//   num_outputs:        5
//   outChWidth:         0
//   selectWidth:        3
//   selectBits:         3-1:0
//   inPayloadMap:       in_data,in_startofpacket,in_endofpacket,in_empty
//   outPayloadWidth:    36
//   outPayloadMap:      out0_data,out0_startofpacket,out0_endofpacket,out0_empty out1_data,out1_startofpacket,out1_endofpacket,out1_empty out2_data,out2_startofpacket,out2_endofpacket,out2_empty out3_data,out3_startofpacket,out3_endofpacket,out3_empty out4_data,out4_startofpacket,out4_endofpacket,out4_empty
//   
// ------------------------------------------


module dircc_node_routing_output_demux (     
 // Interface: in
 input     [3-1: 0] in_channel,
 input              in_valid,
 output reg         in_ready,
 input    [32-1: 0] in_data,
 input              in_startofpacket,
 input              in_endofpacket,
 input     [2-1: 0] in_empty,

// Interface: out0
 output reg          out0_valid,
 input               out0_ready,
 output reg [32-1: 0] out0_data,
 output reg          out0_startofpacket,
 output reg          out0_endofpacket, 
 output reg [2-1: 0] out0_empty,
// Interface: out1
 output reg          out1_valid,
 input               out1_ready,
 output reg [32-1: 0] out1_data,
 output reg          out1_startofpacket,
 output reg          out1_endofpacket, 
 output reg [2-1: 0] out1_empty,
// Interface: out2
 output reg          out2_valid,
 input               out2_ready,
 output reg [32-1: 0] out2_data,
 output reg          out2_startofpacket,
 output reg          out2_endofpacket, 
 output reg [2-1: 0] out2_empty,
// Interface: out3
 output reg          out3_valid,
 input               out3_ready,
 output reg [32-1: 0] out3_data,
 output reg          out3_startofpacket,
 output reg          out3_endofpacket, 
 output reg [2-1: 0] out3_empty,
// Interface: out4
 output reg          out4_valid,
 input               out4_ready,
 output reg [32-1: 0] out4_data,
 output reg          out4_startofpacket,
 output reg          out4_endofpacket, 
 output reg [2-1: 0] out4_empty,
  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

 /*AUTOARG*/);
                          

// ---------------------------------------------------------------------
//| Signal Declarations
// ---------------------------------------------------------------------
   wire           in_ready_wire;
   reg [3 -1:0]   in_select;
   reg [36 -1:0]  in_payload;
   reg            lhs_ready;
   wire           lhs_valid; 
   wire [3 -1:0]  mid_select;
   wire [36 -1:0] mid_payload;
   
   reg            rhs0_valid;
   wire           rhs0_ready;
   reg            rhs1_valid;
   wire           rhs1_ready;
   reg            rhs2_valid;
   wire           rhs2_ready;
   reg            rhs3_valid;
   wire           rhs3_ready;
   reg            rhs4_valid;
   wire           rhs4_ready;
   wire           out0_valid_wire;
   wire [36-1:0]  out0_payload;                  
   wire           out1_valid_wire;
   wire [36-1:0]  out1_payload;                  
   wire           out2_valid_wire;
   wire [36-1:0]  out2_payload;                  
   wire           out3_valid_wire;
   wire [36-1:0]  out3_payload;                  
   wire           out4_valid_wire;
   wire [36-1:0]  out4_payload;                  
// ---------------------------------------------------------------------
//| Input Mapping
// ---------------------------------------------------------------------
always @* begin
   in_ready   = in_ready_wire;
   in_payload = {in_data,in_startofpacket,in_endofpacket,in_empty};
   in_select  = in_channel[3-1:0];
end

// ---------------------------------------------------------------------
//| Input Pipeline Stage
// ---------------------------------------------------------------------
dircc_node_routing_output_demux_1stage_pipeline #( .PAYLOAD_WIDTH( 36 + 3 )) inpipe
 ( .clk      (clk ),
   .reset_n  (reset_n  ),
   .in_ready (in_ready_wire ),
   .in_valid (in_valid ),
   .in_payload ({in_select, in_payload}),
   .out_ready(lhs_ready ),
   .out_valid(lhs_valid),
   .out_payload({mid_select, mid_payload}) );


// ---------------------------------------------------------------------
//| Demuxing
// ---------------------------------------------------------------------
always @* begin
     lhs_ready  = 1;
     rhs0_valid = 0;
     rhs1_valid = 0;
     rhs2_valid = 0;
     rhs3_valid = 0;
     rhs4_valid = 0;
   // Do mux
   case (mid_select)
       0: begin
             lhs_ready = rhs0_ready;
             rhs0_valid = lhs_valid;
           end
       1: begin
             lhs_ready = rhs1_ready;
             rhs1_valid = lhs_valid;
           end
       2: begin
             lhs_ready = rhs2_ready;
             rhs2_valid = lhs_valid;
           end
       3: begin
             lhs_ready = rhs3_ready;
             rhs3_valid = lhs_valid;
           end
       4: begin
             lhs_ready = rhs4_ready;
             rhs4_valid = lhs_valid;
           end
   endcase // case (mid_select)
end


   // ---------------------------------------------------------------------
   //| Output Pipeline Stage
   // ---------------------------------------------------------------------
dircc_node_routing_output_demux_1stage_pipeline #( .PAYLOAD_WIDTH(36)) outpipe0
  ( .clk        (clk ),
    .reset_n    (reset_n  ),
    .in_ready   (rhs0_ready ),
    .in_valid   (rhs0_valid),
    .in_payload (mid_payload),
    .out_ready  (out0_ready ),
    .out_valid  (out0_valid_wire),
    .out_payload(out0_payload)  );
dircc_node_routing_output_demux_1stage_pipeline #( .PAYLOAD_WIDTH(36)) outpipe1
  ( .clk        (clk ),
    .reset_n    (reset_n  ),
    .in_ready   (rhs1_ready ),
    .in_valid   (rhs1_valid),
    .in_payload (mid_payload),
    .out_ready  (out1_ready ),
    .out_valid  (out1_valid_wire),
    .out_payload(out1_payload)  );
dircc_node_routing_output_demux_1stage_pipeline #( .PAYLOAD_WIDTH(36)) outpipe2
  ( .clk        (clk ),
    .reset_n    (reset_n  ),
    .in_ready   (rhs2_ready ),
    .in_valid   (rhs2_valid),
    .in_payload (mid_payload),
    .out_ready  (out2_ready ),
    .out_valid  (out2_valid_wire),
    .out_payload(out2_payload)  );
dircc_node_routing_output_demux_1stage_pipeline #( .PAYLOAD_WIDTH(36)) outpipe3
  ( .clk        (clk ),
    .reset_n    (reset_n  ),
    .in_ready   (rhs3_ready ),
    .in_valid   (rhs3_valid),
    .in_payload (mid_payload),
    .out_ready  (out3_ready ),
    .out_valid  (out3_valid_wire),
    .out_payload(out3_payload)  );
dircc_node_routing_output_demux_1stage_pipeline #( .PAYLOAD_WIDTH(36)) outpipe4
  ( .clk        (clk ),
    .reset_n    (reset_n  ),
    .in_ready   (rhs4_ready ),
    .in_valid   (rhs4_valid),
    .in_payload (mid_payload),
    .out_ready  (out4_ready ),
    .out_valid  (out4_valid_wire),
    .out_payload(out4_payload)  );

   // ---------------------------------------------------------------------
   //| Output Mapping
   // ---------------------------------------------------------------------
always @* begin
   out0_valid   = out0_valid_wire;
   {out0_data,out0_startofpacket,out0_endofpacket,out0_empty} = out0_payload;                                              
   out1_valid   = out1_valid_wire;
   {out1_data,out1_startofpacket,out1_endofpacket,out1_empty} = out1_payload;                                              
   out2_valid   = out2_valid_wire;
   {out2_data,out2_startofpacket,out2_endofpacket,out2_empty} = out2_payload;                                              
   out3_valid   = out3_valid_wire;
   {out3_data,out3_startofpacket,out3_endofpacket,out3_empty} = out3_payload;                                              
   out4_valid   = out4_valid_wire;
   {out4_data,out4_startofpacket,out4_endofpacket,out4_empty} = out4_payload;                                              
end

endmodule //

//  --------------------------------------------------------------------------------
// | single buffered pipeline stage
//  --------------------------------------------------------------------------------
module dircc_node_routing_output_demux_1stage_pipeline
  #( parameter PAYLOAD_WIDTH = 8 )
   ( input                          clk,
     input                          reset_n,
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

   always @ (negedge reset_n, posedge clk) begin
      if (!reset_n) begin
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



