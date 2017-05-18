
module dircc_avalon_st_terminal_sys (
	clk_clk,
	reset_reset_n,
	s1_data,
	s1_empty,
	s1_endofpacket,
	s1_ready,
	s1_startofpacket,
	s1_valid,
	status_readdata,
	status_address,
	status_read_n);	

	input		clk_clk;
	input		reset_reset_n;
	input	[31:0]	s1_data;
	input	[1:0]	s1_empty;
	input		s1_endofpacket;
	output		s1_ready;
	input		s1_startofpacket;
	input		s1_valid;
	output	[15:0]	status_readdata;
	input	[1:0]	status_address;
	input		status_read_n;
endmodule
