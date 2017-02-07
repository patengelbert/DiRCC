	component poets_system_streaming is
		port (
			clk_clk                  : in  std_logic                     := 'X';             -- clk
			reset_reset_n            : in  std_logic                     := 'X';             -- reset_n
			stream_in_valid          : in  std_logic                     := 'X';             -- valid
			stream_in_data           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			stream_in_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			stream_in_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			stream_in_empty          : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			stream_in_ready          : out std_logic;                                        -- ready
			stream_out_valid         : out std_logic;                                        -- valid
			stream_out_data          : out std_logic_vector(31 downto 0);                    -- data
			stream_out_startofpacket : out std_logic;                                        -- startofpacket
			stream_out_endofpacket   : out std_logic;                                        -- endofpacket
			stream_out_empty         : out std_logic_vector(1 downto 0);                     -- empty
			stream_out_ready         : in  std_logic                     := 'X'              -- ready
		);
	end component poets_system_streaming;

	u0 : component poets_system_streaming
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --        clk.clk
			reset_reset_n            => CONNECTED_TO_reset_reset_n,            --      reset.reset_n
			stream_in_valid          => CONNECTED_TO_stream_in_valid,          --  stream_in.valid
			stream_in_data           => CONNECTED_TO_stream_in_data,           --           .data
			stream_in_startofpacket  => CONNECTED_TO_stream_in_startofpacket,  --           .startofpacket
			stream_in_endofpacket    => CONNECTED_TO_stream_in_endofpacket,    --           .endofpacket
			stream_in_empty          => CONNECTED_TO_stream_in_empty,          --           .empty
			stream_in_ready          => CONNECTED_TO_stream_in_ready,          --           .ready
			stream_out_valid         => CONNECTED_TO_stream_out_valid,         -- stream_out.valid
			stream_out_data          => CONNECTED_TO_stream_out_data,          --           .data
			stream_out_startofpacket => CONNECTED_TO_stream_out_startofpacket, --           .startofpacket
			stream_out_endofpacket   => CONNECTED_TO_stream_out_endofpacket,   --           .endofpacket
			stream_out_empty         => CONNECTED_TO_stream_out_empty,         --           .empty
			stream_out_ready         => CONNECTED_TO_stream_out_ready          --           .ready
		);

