
`timescale 1 ps / 1 ps
module dircc_avalon_st_terminal_inst #(
		parameter DATA_WIDTH = 32
	) (
		input  wire [DATA_WIDTH-1:0] data,              //                      .data
		input  wire [1:0]  empty,                       //                      .empty
		input  wire        endofpacket,                 //                      .endofpacket
		output reg         ready,                       //                      .ready
		input  wire        startofpacket,               //                      .startofpacket
		input  wire        valid,                       //                      .valid
		input  wire        reset_n,                     //                 reset.reset_n
		input  wire        clk,                         //                   clk.clk
		input  wire [0:0]  address,                     //                status.address
		output reg [15:0]  readdata,                    //                      .readdata
		input  wire        read_n                       //                      .read_n
	);

  
  always @(posedge clk, negedge reset_n) begin
    if(!reset_n) begin
      ready <= 1'b0;
      readdata <= 16'b0;
    end else begin
      ready <= 1'b1;

			if (!read_n) begin
				// Reset
				readdata <= 16'h0000;
			end

      if (valid) begin
        // If data is valid, set error state.
        readdata <= 16'h8000;
      end
    end
  end

endmodule
