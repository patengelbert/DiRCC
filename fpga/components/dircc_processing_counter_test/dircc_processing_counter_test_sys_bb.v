
module dircc_processing_counter_test_sys (
	clk_clk,
	east_0_mem_readdata,
	east_0_mem_address,
	east_0_mem_read_n,
	node_0_mem_address,
	node_0_mem_readdata,
	node_0_mem_write,
	node_0_mem_writedata,
	node_1_mem_address,
	node_1_mem_readdata,
	node_1_mem_write,
	node_1_mem_writedata,
	north_0_mem_readdata,
	north_0_mem_address,
	north_0_mem_read_n,
	north_1_mem_readdata,
	north_1_mem_address,
	north_1_mem_read_n,
	reset_reset_n,
	south_0_mem_readdata,
	south_0_mem_address,
	south_0_mem_read_n,
	south_1_mem_readdata,
	south_1_mem_address,
	south_1_mem_read_n,
	west_0_mem_readdata,
	west_0_mem_address,
	west_0_mem_read_n,
	node_65536_mem_address,
	node_65536_mem_readdata,
	node_65536_mem_write,
	node_65536_mem_writedata,
	node_65537_mem_address,
	node_65537_mem_readdata,
	node_65537_mem_write,
	node_65537_mem_writedata,
	east_1_mem_readdata,
	east_1_mem_address,
	east_1_mem_read_n,
	west_1_mem_readdata,
	west_1_mem_address,
	west_1_mem_read_n);	

	input		clk_clk;
	output	[15:0]	east_0_mem_readdata;
	input	[1:0]	east_0_mem_address;
	input		east_0_mem_read_n;
	input	[14:0]	node_0_mem_address;
	output	[15:0]	node_0_mem_readdata;
	input		node_0_mem_write;
	input	[15:0]	node_0_mem_writedata;
	input	[14:0]	node_1_mem_address;
	output	[15:0]	node_1_mem_readdata;
	input		node_1_mem_write;
	input	[15:0]	node_1_mem_writedata;
	output	[15:0]	north_0_mem_readdata;
	input	[1:0]	north_0_mem_address;
	input		north_0_mem_read_n;
	output	[15:0]	north_1_mem_readdata;
	input	[1:0]	north_1_mem_address;
	input		north_1_mem_read_n;
	input		reset_reset_n;
	output	[15:0]	south_0_mem_readdata;
	input	[1:0]	south_0_mem_address;
	input		south_0_mem_read_n;
	output	[15:0]	south_1_mem_readdata;
	input	[1:0]	south_1_mem_address;
	input		south_1_mem_read_n;
	output	[15:0]	west_0_mem_readdata;
	input	[1:0]	west_0_mem_address;
	input		west_0_mem_read_n;
	input	[14:0]	node_65536_mem_address;
	output	[15:0]	node_65536_mem_readdata;
	input		node_65536_mem_write;
	input	[15:0]	node_65536_mem_writedata;
	input	[14:0]	node_65537_mem_address;
	output	[15:0]	node_65537_mem_readdata;
	input		node_65537_mem_write;
	input	[15:0]	node_65537_mem_writedata;
	output	[15:0]	east_1_mem_readdata;
	input	[1:0]	east_1_mem_address;
	input		east_1_mem_read_n;
	output	[15:0]	west_1_mem_readdata;
	input	[1:0]	west_1_mem_address;
	input		west_1_mem_read_n;
endmodule
