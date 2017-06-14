// (C) 2001-2017 Intel Corporation. All rights reserved.
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


// $Id: //acds/rel/16.1/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2016/08/07 $
// $Author: swbranch $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module dircc_system_nios_test_version_mm_interconnect_0_router_default_decode
  #(
     parameter DEFAULT_CHANNEL = 8,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 3 
   )
  (output [104 - 100 : 0] default_destination_id,
   output [21-1 : 0] default_wr_channel,
   output [21-1 : 0] default_rd_channel,
   output [21-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[104 - 100 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 21'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 21'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 21'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module dircc_system_nios_test_version_mm_interconnect_0_router
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [129-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [129-1    : 0] src_data,
    output reg [21-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 65;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 104;
    localparam PKT_DEST_ID_L = 100;
    localparam PKT_PROTECTION_H = 119;
    localparam PKT_PROTECTION_L = 117;
    localparam ST_DATA_W = 129;
    localparam ST_CHANNEL_W = 21;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 68;
    localparam PKT_TRANS_READ  = 69;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h78000 - 64'h70000); 
    localparam PAD1 = log2ceil(64'h88000 - 64'h80000); 
    localparam PAD2 = log2ceil(64'h98000 - 64'h90000); 
    localparam PAD3 = log2ceil(64'h108000 - 64'h100000); 
    localparam PAD4 = log2ceil(64'h118000 - 64'h110000); 
    localparam PAD5 = log2ceil(64'h128000 - 64'h120000); 
    localparam PAD6 = log2ceil(64'h168000 - 64'h160000); 
    localparam PAD7 = log2ceil(64'h198000 - 64'h190000); 
    localparam PAD8 = log2ceil(64'h1a8000 - 64'h1a0000); 
    localparam PAD9 = log2ceil(64'h1b0002 - 64'h1b0000); 
    localparam PAD10 = log2ceil(64'h1b0004 - 64'h1b0002); 
    localparam PAD11 = log2ceil(64'h1b0006 - 64'h1b0004); 
    localparam PAD12 = log2ceil(64'h1b0008 - 64'h1b0006); 
    localparam PAD13 = log2ceil(64'h1b000a - 64'h1b0008); 
    localparam PAD14 = log2ceil(64'h1b000c - 64'h1b000a); 
    localparam PAD15 = log2ceil(64'h1b000e - 64'h1b000c); 
    localparam PAD16 = log2ceil(64'h1b0010 - 64'h1b000e); 
    localparam PAD17 = log2ceil(64'h1b0012 - 64'h1b0010); 
    localparam PAD18 = log2ceil(64'h1b0020 - 64'h1b001e); 
    localparam PAD19 = log2ceil(64'h1b0022 - 64'h1b0020); 
    localparam PAD20 = log2ceil(64'h1b0024 - 64'h1b0022); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h1b0024;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam RG = RANGE_ADDR_WIDTH-1;
    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [21-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    dircc_system_nios_test_version_mm_interconnect_0_router_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

    // ( 0x70000 .. 0x78000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 21'h70000   ) begin
            src_channel = 21'b000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x80000 .. 0x88000 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 21'h80000   ) begin
            src_channel = 21'b000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x90000 .. 0x98000 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 21'h90000   ) begin
            src_channel = 21'b000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x100000 .. 0x108000 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 21'h100000   ) begin
            src_channel = 21'b000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x110000 .. 0x118000 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 21'h110000   ) begin
            src_channel = 21'b000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x120000 .. 0x128000 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 21'h120000   ) begin
            src_channel = 21'b000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x160000 .. 0x168000 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 21'h160000   ) begin
            src_channel = 21'b000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x190000 .. 0x198000 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 21'h190000   ) begin
            src_channel = 21'b000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x1a0000 .. 0x1a8000 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 21'h1a0000   ) begin
            src_channel = 21'b000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0x1b0000 .. 0x1b0002 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 21'h1b0000  && read_transaction  ) begin
            src_channel = 21'b100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x1b0002 .. 0x1b0004 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 21'h1b0002  && read_transaction  ) begin
            src_channel = 21'b010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x1b0004 .. 0x1b0006 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 21'h1b0004  && read_transaction  ) begin
            src_channel = 21'b001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x1b0006 .. 0x1b0008 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 21'h1b0006  && read_transaction  ) begin
            src_channel = 21'b000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x1b0008 .. 0x1b000a )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 21'h1b0008  && read_transaction  ) begin
            src_channel = 21'b000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x1b000a .. 0x1b000c )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 21'h1b000a  && read_transaction  ) begin
            src_channel = 21'b000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0x1b000c .. 0x1b000e )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 21'h1b000c  && read_transaction  ) begin
            src_channel = 21'b000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x1b000e .. 0x1b0010 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 21'h1b000e  && read_transaction  ) begin
            src_channel = 21'b000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x1b0010 .. 0x1b0012 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 21'h1b0010  && read_transaction  ) begin
            src_channel = 21'b000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x1b001e .. 0x1b0020 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 21'h1b001e  && read_transaction  ) begin
            src_channel = 21'b000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x1b0020 .. 0x1b0022 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 21'h1b0020  && read_transaction  ) begin
            src_channel = 21'b000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x1b0022 .. 0x1b0024 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 21'h1b0022  && read_transaction  ) begin
            src_channel = 21'b000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


