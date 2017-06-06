
module dircc_system_rtl_gals_test_version (
	clk_clk,
	reset_reset_n,
	node_0_mem_address,
	node_0_mem_readdata,
	node_0_mem_write,
	node_0_mem_writedata,
	node_1_mem_address,
	node_1_mem_readdata,
	node_1_mem_write,
	node_1_mem_writedata,
	node_2_mem_address,
	node_2_mem_readdata,
	node_2_mem_write,
	node_2_mem_writedata,
	node_65536_mem_address,
	node_65536_mem_readdata,
	node_65536_mem_write,
	node_65536_mem_writedata,
	node_65537_mem_address,
	node_65537_mem_readdata,
	node_65537_mem_write,
	node_65537_mem_writedata,
	node_65538_mem_address,
	node_65538_mem_readdata,
	node_65538_mem_write,
	node_65538_mem_writedata,
	node_131072_mem_address,
	node_131072_mem_readdata,
	node_131072_mem_write,
	node_131072_mem_writedata,
	node_131073_mem_address,
	node_131073_mem_readdata,
	node_131073_mem_write,
	node_131073_mem_writedata,
	node_131074_mem_address,
	node_131074_mem_readdata,
	node_131074_mem_write,
	node_131074_mem_writedata,
	reset_13_reset_n,
	node_3_mem_address,
	node_3_mem_readdata,
	node_3_mem_write,
	node_3_mem_writedata,
	node_4_mem_address,
	node_4_mem_readdata,
	node_4_mem_write,
	node_4_mem_writedata,
	node_5_mem_address,
	node_5_mem_readdata,
	node_5_mem_write,
	node_5_mem_writedata,
	node_6_mem_address,
	node_6_mem_readdata,
	node_6_mem_write,
	node_6_mem_writedata,
	node_7_mem_address,
	node_7_mem_readdata,
	node_7_mem_write,
	node_7_mem_writedata,
	node_8_mem_address,
	node_8_mem_readdata,
	node_8_mem_write,
	node_8_mem_writedata,
	node_65539_mem_address,
	node_65539_mem_readdata,
	node_65539_mem_write,
	node_65539_mem_writedata,
	node_65540_mem_address,
	node_65540_mem_readdata,
	node_65540_mem_write,
	node_65540_mem_writedata,
	node_65541_mem_address,
	node_65541_mem_readdata,
	node_65541_mem_write,
	node_65541_mem_writedata,
	node_65542_mem_address,
	node_65542_mem_readdata,
	node_65542_mem_write,
	node_65542_mem_writedata,
	node_65543_mem_address,
	node_65543_mem_readdata,
	node_65543_mem_write,
	node_65543_mem_writedata,
	node_65544_mem_address,
	node_65544_mem_readdata,
	node_65544_mem_write,
	node_65544_mem_writedata,
	node_131075_mem_address,
	node_131075_mem_readdata,
	node_131075_mem_write,
	node_131075_mem_writedata,
	node_131076_mem_address,
	node_131076_mem_readdata,
	node_131076_mem_write,
	node_131076_mem_writedata,
	node_131077_mem_address,
	node_131077_mem_readdata,
	node_131077_mem_write,
	node_131077_mem_writedata,
	node_131078_mem_address,
	node_131078_mem_readdata,
	node_131078_mem_write,
	node_131078_mem_writedata,
	node_131079_mem_address,
	node_131079_mem_readdata,
	node_131079_mem_write,
	node_131079_mem_writedata,
	node_131080_mem_address,
	node_131080_mem_readdata,
	node_131080_mem_write,
	node_131080_mem_writedata);	

	input		clk_clk;
	input		reset_reset_n;
	input	[14:0]	node_0_mem_address;
	output	[15:0]	node_0_mem_readdata;
	input		node_0_mem_write;
	input	[15:0]	node_0_mem_writedata;
	input	[14:0]	node_1_mem_address;
	output	[15:0]	node_1_mem_readdata;
	input		node_1_mem_write;
	input	[15:0]	node_1_mem_writedata;
	input	[14:0]	node_2_mem_address;
	output	[15:0]	node_2_mem_readdata;
	input		node_2_mem_write;
	input	[15:0]	node_2_mem_writedata;
	input	[14:0]	node_65536_mem_address;
	output	[15:0]	node_65536_mem_readdata;
	input		node_65536_mem_write;
	input	[15:0]	node_65536_mem_writedata;
	input	[14:0]	node_65537_mem_address;
	output	[15:0]	node_65537_mem_readdata;
	input		node_65537_mem_write;
	input	[15:0]	node_65537_mem_writedata;
	input	[14:0]	node_65538_mem_address;
	output	[15:0]	node_65538_mem_readdata;
	input		node_65538_mem_write;
	input	[15:0]	node_65538_mem_writedata;
	input	[14:0]	node_131072_mem_address;
	output	[15:0]	node_131072_mem_readdata;
	input		node_131072_mem_write;
	input	[15:0]	node_131072_mem_writedata;
	input	[14:0]	node_131073_mem_address;
	output	[15:0]	node_131073_mem_readdata;
	input		node_131073_mem_write;
	input	[15:0]	node_131073_mem_writedata;
	input	[14:0]	node_131074_mem_address;
	output	[15:0]	node_131074_mem_readdata;
	input		node_131074_mem_write;
	input	[15:0]	node_131074_mem_writedata;
	input		reset_13_reset_n;
	input	[14:0]	node_3_mem_address;
	output	[15:0]	node_3_mem_readdata;
	input		node_3_mem_write;
	input	[15:0]	node_3_mem_writedata;
	input	[14:0]	node_4_mem_address;
	output	[15:0]	node_4_mem_readdata;
	input		node_4_mem_write;
	input	[15:0]	node_4_mem_writedata;
	input	[14:0]	node_5_mem_address;
	output	[15:0]	node_5_mem_readdata;
	input		node_5_mem_write;
	input	[15:0]	node_5_mem_writedata;
	input	[14:0]	node_6_mem_address;
	output	[15:0]	node_6_mem_readdata;
	input		node_6_mem_write;
	input	[15:0]	node_6_mem_writedata;
	input	[14:0]	node_7_mem_address;
	output	[15:0]	node_7_mem_readdata;
	input		node_7_mem_write;
	input	[15:0]	node_7_mem_writedata;
	input	[14:0]	node_8_mem_address;
	output	[15:0]	node_8_mem_readdata;
	input		node_8_mem_write;
	input	[15:0]	node_8_mem_writedata;
	input	[14:0]	node_65539_mem_address;
	output	[15:0]	node_65539_mem_readdata;
	input		node_65539_mem_write;
	input	[15:0]	node_65539_mem_writedata;
	input	[14:0]	node_65540_mem_address;
	output	[15:0]	node_65540_mem_readdata;
	input		node_65540_mem_write;
	input	[15:0]	node_65540_mem_writedata;
	input	[14:0]	node_65541_mem_address;
	output	[15:0]	node_65541_mem_readdata;
	input		node_65541_mem_write;
	input	[15:0]	node_65541_mem_writedata;
	input	[14:0]	node_65542_mem_address;
	output	[15:0]	node_65542_mem_readdata;
	input		node_65542_mem_write;
	input	[15:0]	node_65542_mem_writedata;
	input	[14:0]	node_65543_mem_address;
	output	[15:0]	node_65543_mem_readdata;
	input		node_65543_mem_write;
	input	[15:0]	node_65543_mem_writedata;
	input	[14:0]	node_65544_mem_address;
	output	[15:0]	node_65544_mem_readdata;
	input		node_65544_mem_write;
	input	[15:0]	node_65544_mem_writedata;
	input	[14:0]	node_131075_mem_address;
	output	[15:0]	node_131075_mem_readdata;
	input		node_131075_mem_write;
	input	[15:0]	node_131075_mem_writedata;
	input	[14:0]	node_131076_mem_address;
	output	[15:0]	node_131076_mem_readdata;
	input		node_131076_mem_write;
	input	[15:0]	node_131076_mem_writedata;
	input	[14:0]	node_131077_mem_address;
	output	[15:0]	node_131077_mem_readdata;
	input		node_131077_mem_write;
	input	[15:0]	node_131077_mem_writedata;
	input	[14:0]	node_131078_mem_address;
	output	[15:0]	node_131078_mem_readdata;
	input		node_131078_mem_write;
	input	[15:0]	node_131078_mem_writedata;
	input	[14:0]	node_131079_mem_address;
	output	[15:0]	node_131079_mem_readdata;
	input		node_131079_mem_write;
	input	[15:0]	node_131079_mem_writedata;
	input	[14:0]	node_131080_mem_address;
	output	[15:0]	node_131080_mem_readdata;
	input		node_131080_mem_write;
	input	[15:0]	node_131080_mem_writedata;
endmodule
