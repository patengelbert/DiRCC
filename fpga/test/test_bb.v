
module test (
	clk_clk,
	reset_reset_n,
	st_pipeline_stage_0_sink0_ready,
	st_pipeline_stage_0_sink0_valid,
	st_pipeline_stage_0_sink0_startofpacket,
	st_pipeline_stage_0_sink0_endofpacket,
	st_pipeline_stage_0_sink0_data,
	st_pipeline_stage_0_source0_ready,
	st_pipeline_stage_0_source0_valid,
	st_pipeline_stage_0_source0_startofpacket,
	st_pipeline_stage_0_source0_endofpacket,
	st_pipeline_stage_0_source0_data);	

	input		clk_clk;
	input		reset_reset_n;
	output		st_pipeline_stage_0_sink0_ready;
	input		st_pipeline_stage_0_sink0_valid;
	input		st_pipeline_stage_0_sink0_startofpacket;
	input		st_pipeline_stage_0_sink0_endofpacket;
	input	[31:0]	st_pipeline_stage_0_sink0_data;
	input		st_pipeline_stage_0_source0_ready;
	output		st_pipeline_stage_0_source0_valid;
	output		st_pipeline_stage_0_source0_startofpacket;
	output		st_pipeline_stage_0_source0_endofpacket;
	output	[31:0]	st_pipeline_stage_0_source0_data;
endmodule
