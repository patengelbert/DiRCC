	component dircc_nios_processing is
		port (
			address_address          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- address
			clk_processing_clk       : in  std_logic                     := 'X';             -- clk
			clk_routing_clk          : in  std_logic                     := 'X';             -- clk
			mem_address              : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			mem_chipselect           : in  std_logic                     := 'X';             -- chipselect
			mem_clken                : in  std_logic                     := 'X';             -- clken
			mem_write                : in  std_logic                     := 'X';             -- write
			mem_readdata             : out std_logic_vector(15 downto 0);                    -- readdata
			mem_writedata            : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			mem_byteenable           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			reset_processing_reset_n : in  std_logic                     := 'X';             -- reset_n
			reset_routing_reset_n    : in  std_logic                     := 'X';             -- reset_n
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
	end component dircc_nios_processing;

	u0 : component dircc_nios_processing
		port map (
			address_address          => CONNECTED_TO_address_address,          --          address.address
			clk_processing_clk       => CONNECTED_TO_clk_processing_clk,       --   clk_processing.clk
			clk_routing_clk          => CONNECTED_TO_clk_routing_clk,          --      clk_routing.clk
			mem_address              => CONNECTED_TO_mem_address,              --              mem.address
			mem_chipselect           => CONNECTED_TO_mem_chipselect,           --                 .chipselect
			mem_clken                => CONNECTED_TO_mem_clken,                --                 .clken
			mem_write                => CONNECTED_TO_mem_write,                --                 .write
			mem_readdata             => CONNECTED_TO_mem_readdata,             --                 .readdata
			mem_writedata            => CONNECTED_TO_mem_writedata,            --                 .writedata
			mem_byteenable           => CONNECTED_TO_mem_byteenable,           --                 .byteenable
			reset_processing_reset_n => CONNECTED_TO_reset_processing_reset_n, -- reset_processing.reset_n
			reset_routing_reset_n    => CONNECTED_TO_reset_routing_reset_n,    --    reset_routing.reset_n
			stream_in_valid          => CONNECTED_TO_stream_in_valid,          --        stream_in.valid
			stream_in_data           => CONNECTED_TO_stream_in_data,           --                 .data
			stream_in_startofpacket  => CONNECTED_TO_stream_in_startofpacket,  --                 .startofpacket
			stream_in_endofpacket    => CONNECTED_TO_stream_in_endofpacket,    --                 .endofpacket
			stream_in_empty          => CONNECTED_TO_stream_in_empty,          --                 .empty
			stream_in_ready          => CONNECTED_TO_stream_in_ready,          --                 .ready
			stream_out_valid         => CONNECTED_TO_stream_out_valid,         --       stream_out.valid
			stream_out_data          => CONNECTED_TO_stream_out_data,          --                 .data
			stream_out_startofpacket => CONNECTED_TO_stream_out_startofpacket, --                 .startofpacket
			stream_out_endofpacket   => CONNECTED_TO_stream_out_endofpacket,   --                 .endofpacket
			stream_out_empty         => CONNECTED_TO_stream_out_empty,         --                 .empty
			stream_out_ready         => CONNECTED_TO_stream_out_ready          --                 .ready
		);

