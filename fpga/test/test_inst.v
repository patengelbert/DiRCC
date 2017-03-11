	test u0 (
		.clk_clk                                   (<connected-to-clk_clk>),                                   //                         clk.clk
		.reset_reset_n                             (<connected-to-reset_reset_n>),                             //                       reset.reset_n
		.st_pipeline_stage_0_sink0_ready           (<connected-to-st_pipeline_stage_0_sink0_ready>),           //   st_pipeline_stage_0_sink0.ready
		.st_pipeline_stage_0_sink0_valid           (<connected-to-st_pipeline_stage_0_sink0_valid>),           //                            .valid
		.st_pipeline_stage_0_sink0_startofpacket   (<connected-to-st_pipeline_stage_0_sink0_startofpacket>),   //                            .startofpacket
		.st_pipeline_stage_0_sink0_endofpacket     (<connected-to-st_pipeline_stage_0_sink0_endofpacket>),     //                            .endofpacket
		.st_pipeline_stage_0_sink0_data            (<connected-to-st_pipeline_stage_0_sink0_data>),            //                            .data
		.st_pipeline_stage_0_source0_ready         (<connected-to-st_pipeline_stage_0_source0_ready>),         // st_pipeline_stage_0_source0.ready
		.st_pipeline_stage_0_source0_valid         (<connected-to-st_pipeline_stage_0_source0_valid>),         //                            .valid
		.st_pipeline_stage_0_source0_startofpacket (<connected-to-st_pipeline_stage_0_source0_startofpacket>), //                            .startofpacket
		.st_pipeline_stage_0_source0_endofpacket   (<connected-to-st_pipeline_stage_0_source0_endofpacket>),   //                            .endofpacket
		.st_pipeline_stage_0_source0_data          (<connected-to-st_pipeline_stage_0_source0_data>)           //                            .data
	);

