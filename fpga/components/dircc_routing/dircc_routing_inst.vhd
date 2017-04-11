	component dircc_routing is
		port (
			address_address            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- address
			clk_clk                    : in  std_logic                     := 'X';             -- clk
			input_east_data            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			input_east_valid           : in  std_logic                     := 'X';             -- valid
			input_east_ready           : out std_logic;                                        -- ready
			input_east_startofpacket   : in  std_logic                     := 'X';             -- startofpacket
			input_east_endofpacket     : in  std_logic                     := 'X';             -- endofpacket
			input_east_empty           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			input_here_data            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			input_here_valid           : in  std_logic                     := 'X';             -- valid
			input_here_ready           : out std_logic;                                        -- ready
			input_here_startofpacket   : in  std_logic                     := 'X';             -- startofpacket
			input_here_endofpacket     : in  std_logic                     := 'X';             -- endofpacket
			input_here_empty           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			input_north_data           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			input_north_valid          : in  std_logic                     := 'X';             -- valid
			input_north_ready          : out std_logic;                                        -- ready
			input_north_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			input_north_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			input_north_empty          : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			input_south_data           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			input_south_valid          : in  std_logic                     := 'X';             -- valid
			input_south_ready          : out std_logic;                                        -- ready
			input_south_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			input_south_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			input_south_empty          : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			input_west_data            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			input_west_valid           : in  std_logic                     := 'X';             -- valid
			input_west_ready           : out std_logic;                                        -- ready
			input_west_startofpacket   : in  std_logic                     := 'X';             -- startofpacket
			input_west_endofpacket     : in  std_logic                     := 'X';             -- endofpacket
			input_west_empty           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			output_east_data           : out std_logic_vector(31 downto 0);                    -- data
			output_east_valid          : out std_logic;                                        -- valid
			output_east_ready          : in  std_logic                     := 'X';             -- ready
			output_east_startofpacket  : out std_logic;                                        -- startofpacket
			output_east_endofpacket    : out std_logic;                                        -- endofpacket
			output_east_empty          : out std_logic_vector(1 downto 0);                     -- empty
			output_here_data           : out std_logic_vector(31 downto 0);                    -- data
			output_here_valid          : out std_logic;                                        -- valid
			output_here_ready          : in  std_logic                     := 'X';             -- ready
			output_here_startofpacket  : out std_logic;                                        -- startofpacket
			output_here_endofpacket    : out std_logic;                                        -- endofpacket
			output_here_empty          : out std_logic_vector(1 downto 0);                     -- empty
			output_north_data          : out std_logic_vector(31 downto 0);                    -- data
			output_north_valid         : out std_logic;                                        -- valid
			output_north_ready         : in  std_logic                     := 'X';             -- ready
			output_north_startofpacket : out std_logic;                                        -- startofpacket
			output_north_endofpacket   : out std_logic;                                        -- endofpacket
			output_north_empty         : out std_logic_vector(1 downto 0);                     -- empty
			output_south_data          : out std_logic_vector(31 downto 0);                    -- data
			output_south_valid         : out std_logic;                                        -- valid
			output_south_ready         : in  std_logic                     := 'X';             -- ready
			output_south_startofpacket : out std_logic;                                        -- startofpacket
			output_south_endofpacket   : out std_logic;                                        -- endofpacket
			output_south_empty         : out std_logic_vector(1 downto 0);                     -- empty
			output_west_data           : out std_logic_vector(31 downto 0);                    -- data
			output_west_valid          : out std_logic;                                        -- valid
			output_west_ready          : in  std_logic                     := 'X';             -- ready
			output_west_startofpacket  : out std_logic;                                        -- startofpacket
			output_west_endofpacket    : out std_logic;                                        -- endofpacket
			output_west_empty          : out std_logic_vector(1 downto 0);                     -- empty
			reset_reset_n              : in  std_logic                     := 'X'              -- reset_n
		);
	end component dircc_routing;

	u0 : component dircc_routing
		port map (
			address_address            => CONNECTED_TO_address_address,            --      address.address
			clk_clk                    => CONNECTED_TO_clk_clk,                    --          clk.clk
			input_east_data            => CONNECTED_TO_input_east_data,            --   input_east.data
			input_east_valid           => CONNECTED_TO_input_east_valid,           --             .valid
			input_east_ready           => CONNECTED_TO_input_east_ready,           --             .ready
			input_east_startofpacket   => CONNECTED_TO_input_east_startofpacket,   --             .startofpacket
			input_east_endofpacket     => CONNECTED_TO_input_east_endofpacket,     --             .endofpacket
			input_east_empty           => CONNECTED_TO_input_east_empty,           --             .empty
			input_here_data            => CONNECTED_TO_input_here_data,            --   input_here.data
			input_here_valid           => CONNECTED_TO_input_here_valid,           --             .valid
			input_here_ready           => CONNECTED_TO_input_here_ready,           --             .ready
			input_here_startofpacket   => CONNECTED_TO_input_here_startofpacket,   --             .startofpacket
			input_here_endofpacket     => CONNECTED_TO_input_here_endofpacket,     --             .endofpacket
			input_here_empty           => CONNECTED_TO_input_here_empty,           --             .empty
			input_north_data           => CONNECTED_TO_input_north_data,           --  input_north.data
			input_north_valid          => CONNECTED_TO_input_north_valid,          --             .valid
			input_north_ready          => CONNECTED_TO_input_north_ready,          --             .ready
			input_north_startofpacket  => CONNECTED_TO_input_north_startofpacket,  --             .startofpacket
			input_north_endofpacket    => CONNECTED_TO_input_north_endofpacket,    --             .endofpacket
			input_north_empty          => CONNECTED_TO_input_north_empty,          --             .empty
			input_south_data           => CONNECTED_TO_input_south_data,           --  input_south.data
			input_south_valid          => CONNECTED_TO_input_south_valid,          --             .valid
			input_south_ready          => CONNECTED_TO_input_south_ready,          --             .ready
			input_south_startofpacket  => CONNECTED_TO_input_south_startofpacket,  --             .startofpacket
			input_south_endofpacket    => CONNECTED_TO_input_south_endofpacket,    --             .endofpacket
			input_south_empty          => CONNECTED_TO_input_south_empty,          --             .empty
			input_west_data            => CONNECTED_TO_input_west_data,            --   input_west.data
			input_west_valid           => CONNECTED_TO_input_west_valid,           --             .valid
			input_west_ready           => CONNECTED_TO_input_west_ready,           --             .ready
			input_west_startofpacket   => CONNECTED_TO_input_west_startofpacket,   --             .startofpacket
			input_west_endofpacket     => CONNECTED_TO_input_west_endofpacket,     --             .endofpacket
			input_west_empty           => CONNECTED_TO_input_west_empty,           --             .empty
			output_east_data           => CONNECTED_TO_output_east_data,           --  output_east.data
			output_east_valid          => CONNECTED_TO_output_east_valid,          --             .valid
			output_east_ready          => CONNECTED_TO_output_east_ready,          --             .ready
			output_east_startofpacket  => CONNECTED_TO_output_east_startofpacket,  --             .startofpacket
			output_east_endofpacket    => CONNECTED_TO_output_east_endofpacket,    --             .endofpacket
			output_east_empty          => CONNECTED_TO_output_east_empty,          --             .empty
			output_here_data           => CONNECTED_TO_output_here_data,           --  output_here.data
			output_here_valid          => CONNECTED_TO_output_here_valid,          --             .valid
			output_here_ready          => CONNECTED_TO_output_here_ready,          --             .ready
			output_here_startofpacket  => CONNECTED_TO_output_here_startofpacket,  --             .startofpacket
			output_here_endofpacket    => CONNECTED_TO_output_here_endofpacket,    --             .endofpacket
			output_here_empty          => CONNECTED_TO_output_here_empty,          --             .empty
			output_north_data          => CONNECTED_TO_output_north_data,          -- output_north.data
			output_north_valid         => CONNECTED_TO_output_north_valid,         --             .valid
			output_north_ready         => CONNECTED_TO_output_north_ready,         --             .ready
			output_north_startofpacket => CONNECTED_TO_output_north_startofpacket, --             .startofpacket
			output_north_endofpacket   => CONNECTED_TO_output_north_endofpacket,   --             .endofpacket
			output_north_empty         => CONNECTED_TO_output_north_empty,         --             .empty
			output_south_data          => CONNECTED_TO_output_south_data,          -- output_south.data
			output_south_valid         => CONNECTED_TO_output_south_valid,         --             .valid
			output_south_ready         => CONNECTED_TO_output_south_ready,         --             .ready
			output_south_startofpacket => CONNECTED_TO_output_south_startofpacket, --             .startofpacket
			output_south_endofpacket   => CONNECTED_TO_output_south_endofpacket,   --             .endofpacket
			output_south_empty         => CONNECTED_TO_output_south_empty,         --             .empty
			output_west_data           => CONNECTED_TO_output_west_data,           --  output_west.data
			output_west_valid          => CONNECTED_TO_output_west_valid,          --             .valid
			output_west_ready          => CONNECTED_TO_output_west_ready,          --             .ready
			output_west_startofpacket  => CONNECTED_TO_output_west_startofpacket,  --             .startofpacket
			output_west_endofpacket    => CONNECTED_TO_output_west_endofpacket,    --             .endofpacket
			output_west_empty          => CONNECTED_TO_output_west_empty,          --             .empty
			reset_reset_n              => CONNECTED_TO_reset_reset_n               --        reset.reset_n
		);

