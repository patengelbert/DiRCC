
module dircc_nios_processing (
	address_address,
	clk_processing_clk,
	clk_routing_clk,
	mem_address,
	mem_chipselect,
	mem_clken,
	mem_write,
	mem_readdata,
	mem_writedata,
	mem_byteenable,
	reset_processing_reset_n,
	reset_routing_reset_n,
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

	input	[31:0]	address_address;
	input		clk_processing_clk;
	input		clk_routing_clk;
	input	[14:0]	mem_address;
	input		mem_chipselect;
	input		mem_clken;
	input		mem_write;
	output	[15:0]	mem_readdata;
	input	[15:0]	mem_writedata;
	input	[1:0]	mem_byteenable;
	input		reset_processing_reset_n;
	input		reset_routing_reset_n;
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
