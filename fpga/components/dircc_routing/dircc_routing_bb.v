
module dircc_routing (
	address_address,
	clk_clk,
	input_east_data,
	input_east_valid,
	input_east_ready,
	input_east_startofpacket,
	input_east_endofpacket,
	input_east_empty,
	input_here_data,
	input_here_valid,
	input_here_ready,
	input_here_startofpacket,
	input_here_endofpacket,
	input_here_empty,
	input_north_data,
	input_north_valid,
	input_north_ready,
	input_north_startofpacket,
	input_north_endofpacket,
	input_north_empty,
	input_south_data,
	input_south_valid,
	input_south_ready,
	input_south_startofpacket,
	input_south_endofpacket,
	input_south_empty,
	input_west_data,
	input_west_valid,
	input_west_ready,
	input_west_startofpacket,
	input_west_endofpacket,
	input_west_empty,
	output_east_data,
	output_east_valid,
	output_east_ready,
	output_east_startofpacket,
	output_east_endofpacket,
	output_east_empty,
	output_here_data,
	output_here_valid,
	output_here_ready,
	output_here_startofpacket,
	output_here_endofpacket,
	output_here_empty,
	output_north_data,
	output_north_valid,
	output_north_ready,
	output_north_startofpacket,
	output_north_endofpacket,
	output_north_empty,
	output_south_data,
	output_south_valid,
	output_south_ready,
	output_south_startofpacket,
	output_south_endofpacket,
	output_south_empty,
	output_west_data,
	output_west_valid,
	output_west_ready,
	output_west_startofpacket,
	output_west_endofpacket,
	output_west_empty,
	reset_reset_n);	

	input	[31:0]	address_address;
	input		clk_clk;
	input	[31:0]	input_east_data;
	input		input_east_valid;
	output		input_east_ready;
	input		input_east_startofpacket;
	input		input_east_endofpacket;
	input	[1:0]	input_east_empty;
	input	[31:0]	input_here_data;
	input		input_here_valid;
	output		input_here_ready;
	input		input_here_startofpacket;
	input		input_here_endofpacket;
	input	[1:0]	input_here_empty;
	input	[31:0]	input_north_data;
	input		input_north_valid;
	output		input_north_ready;
	input		input_north_startofpacket;
	input		input_north_endofpacket;
	input	[1:0]	input_north_empty;
	input	[31:0]	input_south_data;
	input		input_south_valid;
	output		input_south_ready;
	input		input_south_startofpacket;
	input		input_south_endofpacket;
	input	[1:0]	input_south_empty;
	input	[31:0]	input_west_data;
	input		input_west_valid;
	output		input_west_ready;
	input		input_west_startofpacket;
	input		input_west_endofpacket;
	input	[1:0]	input_west_empty;
	output	[31:0]	output_east_data;
	output		output_east_valid;
	input		output_east_ready;
	output		output_east_startofpacket;
	output		output_east_endofpacket;
	output	[1:0]	output_east_empty;
	output	[31:0]	output_here_data;
	output		output_here_valid;
	input		output_here_ready;
	output		output_here_startofpacket;
	output		output_here_endofpacket;
	output	[1:0]	output_here_empty;
	output	[31:0]	output_north_data;
	output		output_north_valid;
	input		output_north_ready;
	output		output_north_startofpacket;
	output		output_north_endofpacket;
	output	[1:0]	output_north_empty;
	output	[31:0]	output_south_data;
	output		output_south_valid;
	input		output_south_ready;
	output		output_south_startofpacket;
	output		output_south_endofpacket;
	output	[1:0]	output_south_empty;
	output	[31:0]	output_west_data;
	output		output_west_valid;
	input		output_west_ready;
	output		output_west_startofpacket;
	output		output_west_endofpacket;
	output	[1:0]	output_west_empty;
	input		reset_reset_n;
endmodule
