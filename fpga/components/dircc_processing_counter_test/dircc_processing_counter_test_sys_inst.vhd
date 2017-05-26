	component dircc_processing_counter_test_sys is
		port (
			clk_clk                  : in  std_logic                     := 'X';             -- clk
			east_0_mem_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			east_0_mem_address       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			east_0_mem_read_n        : in  std_logic                     := 'X';             -- read_n
			node_0_mem_address       : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_0_mem_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			node_0_mem_write         : in  std_logic                     := 'X';             -- write
			node_0_mem_writedata     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_1_mem_address       : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_1_mem_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			node_1_mem_write         : in  std_logic                     := 'X';             -- write
			node_1_mem_writedata     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			north_0_mem_readdata     : out std_logic_vector(15 downto 0);                    -- readdata
			north_0_mem_address      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			north_0_mem_read_n       : in  std_logic                     := 'X';             -- read_n
			north_1_mem_readdata     : out std_logic_vector(15 downto 0);                    -- readdata
			north_1_mem_address      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			north_1_mem_read_n       : in  std_logic                     := 'X';             -- read_n
			reset_reset_n            : in  std_logic                     := 'X';             -- reset_n
			south_0_mem_readdata     : out std_logic_vector(15 downto 0);                    -- readdata
			south_0_mem_address      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			south_0_mem_read_n       : in  std_logic                     := 'X';             -- read_n
			south_1_mem_readdata     : out std_logic_vector(15 downto 0);                    -- readdata
			south_1_mem_address      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			south_1_mem_read_n       : in  std_logic                     := 'X';             -- read_n
			west_0_mem_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			west_0_mem_address       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			west_0_mem_read_n        : in  std_logic                     := 'X';             -- read_n
			node_65536_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65536_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_65536_mem_write     : in  std_logic                     := 'X';             -- write
			node_65536_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65537_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65537_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_65537_mem_write     : in  std_logic                     := 'X';             -- write
			node_65537_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			east_1_mem_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			east_1_mem_address       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			east_1_mem_read_n        : in  std_logic                     := 'X';             -- read_n
			west_1_mem_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			west_1_mem_address       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			west_1_mem_read_n        : in  std_logic                     := 'X'              -- read_n
		);
	end component dircc_processing_counter_test_sys;

	u0 : component dircc_processing_counter_test_sys
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --            clk.clk
			east_0_mem_readdata      => CONNECTED_TO_east_0_mem_readdata,      --     east_0_mem.readdata
			east_0_mem_address       => CONNECTED_TO_east_0_mem_address,       --               .address
			east_0_mem_read_n        => CONNECTED_TO_east_0_mem_read_n,        --               .read_n
			node_0_mem_address       => CONNECTED_TO_node_0_mem_address,       --     node_0_mem.address
			node_0_mem_readdata      => CONNECTED_TO_node_0_mem_readdata,      --               .readdata
			node_0_mem_write         => CONNECTED_TO_node_0_mem_write,         --               .write
			node_0_mem_writedata     => CONNECTED_TO_node_0_mem_writedata,     --               .writedata
			node_1_mem_address       => CONNECTED_TO_node_1_mem_address,       --     node_1_mem.address
			node_1_mem_readdata      => CONNECTED_TO_node_1_mem_readdata,      --               .readdata
			node_1_mem_write         => CONNECTED_TO_node_1_mem_write,         --               .write
			node_1_mem_writedata     => CONNECTED_TO_node_1_mem_writedata,     --               .writedata
			north_0_mem_readdata     => CONNECTED_TO_north_0_mem_readdata,     --    north_0_mem.readdata
			north_0_mem_address      => CONNECTED_TO_north_0_mem_address,      --               .address
			north_0_mem_read_n       => CONNECTED_TO_north_0_mem_read_n,       --               .read_n
			north_1_mem_readdata     => CONNECTED_TO_north_1_mem_readdata,     --    north_1_mem.readdata
			north_1_mem_address      => CONNECTED_TO_north_1_mem_address,      --               .address
			north_1_mem_read_n       => CONNECTED_TO_north_1_mem_read_n,       --               .read_n
			reset_reset_n            => CONNECTED_TO_reset_reset_n,            --          reset.reset_n
			south_0_mem_readdata     => CONNECTED_TO_south_0_mem_readdata,     --    south_0_mem.readdata
			south_0_mem_address      => CONNECTED_TO_south_0_mem_address,      --               .address
			south_0_mem_read_n       => CONNECTED_TO_south_0_mem_read_n,       --               .read_n
			south_1_mem_readdata     => CONNECTED_TO_south_1_mem_readdata,     --    south_1_mem.readdata
			south_1_mem_address      => CONNECTED_TO_south_1_mem_address,      --               .address
			south_1_mem_read_n       => CONNECTED_TO_south_1_mem_read_n,       --               .read_n
			west_0_mem_readdata      => CONNECTED_TO_west_0_mem_readdata,      --     west_0_mem.readdata
			west_0_mem_address       => CONNECTED_TO_west_0_mem_address,       --               .address
			west_0_mem_read_n        => CONNECTED_TO_west_0_mem_read_n,        --               .read_n
			node_65536_mem_address   => CONNECTED_TO_node_65536_mem_address,   -- node_65536_mem.address
			node_65536_mem_readdata  => CONNECTED_TO_node_65536_mem_readdata,  --               .readdata
			node_65536_mem_write     => CONNECTED_TO_node_65536_mem_write,     --               .write
			node_65536_mem_writedata => CONNECTED_TO_node_65536_mem_writedata, --               .writedata
			node_65537_mem_address   => CONNECTED_TO_node_65537_mem_address,   -- node_65537_mem.address
			node_65537_mem_readdata  => CONNECTED_TO_node_65537_mem_readdata,  --               .readdata
			node_65537_mem_write     => CONNECTED_TO_node_65537_mem_write,     --               .write
			node_65537_mem_writedata => CONNECTED_TO_node_65537_mem_writedata, --               .writedata
			east_1_mem_readdata      => CONNECTED_TO_east_1_mem_readdata,      --     east_1_mem.readdata
			east_1_mem_address       => CONNECTED_TO_east_1_mem_address,       --               .address
			east_1_mem_read_n        => CONNECTED_TO_east_1_mem_read_n,        --               .read_n
			west_1_mem_readdata      => CONNECTED_TO_west_1_mem_readdata,      --     west_1_mem.readdata
			west_1_mem_address       => CONNECTED_TO_west_1_mem_address,       --               .address
			west_1_mem_read_n        => CONNECTED_TO_west_1_mem_read_n         --               .read_n
		);

