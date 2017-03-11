	component test is
		port (
			clk_clk                                   : in  std_logic                     := 'X';             -- clk
			reset_reset_n                             : in  std_logic                     := 'X';             -- reset_n
			st_pipeline_stage_0_sink0_ready           : out std_logic;                                        -- ready
			st_pipeline_stage_0_sink0_valid           : in  std_logic                     := 'X';             -- valid
			st_pipeline_stage_0_sink0_startofpacket   : in  std_logic                     := 'X';             -- startofpacket
			st_pipeline_stage_0_sink0_endofpacket     : in  std_logic                     := 'X';             -- endofpacket
			st_pipeline_stage_0_sink0_data            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			st_pipeline_stage_0_source0_ready         : in  std_logic                     := 'X';             -- ready
			st_pipeline_stage_0_source0_valid         : out std_logic;                                        -- valid
			st_pipeline_stage_0_source0_startofpacket : out std_logic;                                        -- startofpacket
			st_pipeline_stage_0_source0_endofpacket   : out std_logic;                                        -- endofpacket
			st_pipeline_stage_0_source0_data          : out std_logic_vector(31 downto 0)                     -- data
		);
	end component test;

	u0 : component test
		port map (
			clk_clk                                   => CONNECTED_TO_clk_clk,                                   --                         clk.clk
			reset_reset_n                             => CONNECTED_TO_reset_reset_n,                             --                       reset.reset_n
			st_pipeline_stage_0_sink0_ready           => CONNECTED_TO_st_pipeline_stage_0_sink0_ready,           --   st_pipeline_stage_0_sink0.ready
			st_pipeline_stage_0_sink0_valid           => CONNECTED_TO_st_pipeline_stage_0_sink0_valid,           --                            .valid
			st_pipeline_stage_0_sink0_startofpacket   => CONNECTED_TO_st_pipeline_stage_0_sink0_startofpacket,   --                            .startofpacket
			st_pipeline_stage_0_sink0_endofpacket     => CONNECTED_TO_st_pipeline_stage_0_sink0_endofpacket,     --                            .endofpacket
			st_pipeline_stage_0_sink0_data            => CONNECTED_TO_st_pipeline_stage_0_sink0_data,            --                            .data
			st_pipeline_stage_0_source0_ready         => CONNECTED_TO_st_pipeline_stage_0_source0_ready,         -- st_pipeline_stage_0_source0.ready
			st_pipeline_stage_0_source0_valid         => CONNECTED_TO_st_pipeline_stage_0_source0_valid,         --                            .valid
			st_pipeline_stage_0_source0_startofpacket => CONNECTED_TO_st_pipeline_stage_0_source0_startofpacket, --                            .startofpacket
			st_pipeline_stage_0_source0_endofpacket   => CONNECTED_TO_st_pipeline_stage_0_source0_endofpacket,   --                            .endofpacket
			st_pipeline_stage_0_source0_data          => CONNECTED_TO_st_pipeline_stage_0_source0_data           --                            .data
		);

