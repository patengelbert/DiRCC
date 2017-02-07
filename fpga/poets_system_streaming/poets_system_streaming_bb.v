
module poets_system_streaming (
	clk_clk,
	reset_reset_n,
	stream_in_valid,
	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_ready,
	stream_out_valid,
	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_ready);	

	input		clk_clk;
	input		reset_reset_n;
	input		stream_in_valid;
	input	[31:0]	stream_in_data;
	input		stream_in_startofpacket;
	input		stream_in_endofpacket;
	input	[1:0]	stream_in_empty;
	output		stream_in_ready;
	output		stream_out_valid;
	output	[31:0]	stream_out_data;
	output		stream_out_startofpacket;
	output		stream_out_endofpacket;
	output	[1:0]	stream_out_empty;
	input		stream_out_ready;
endmodule
