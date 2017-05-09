// conduit_avalon_mm_bridge.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module conduit_avalon_mm_bridge (
		input  wire        clk_in,          //   clk_in.clk
		input  wire        reset_in,        // reset_in.reset
		input  wire [31:0] in_data,         //       in.constant
		input  wire        out_address,     //      out.address
		input  wire        out_read,        //         .read
		output wire [31:0] out_readdata     //         .readdata
	);

	assign out_readdata = in_data;
  
endmodule
