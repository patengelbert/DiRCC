	component dircc_system_rtl_gals_test_version is
		port (
			clk_clk                   : in  std_logic                     := 'X';             -- clk
			reset_reset_n             : in  std_logic                     := 'X';             -- reset_n
			node_0_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_0_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_0_mem_write          : in  std_logic                     := 'X';             -- write
			node_0_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_1_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_1_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_1_mem_write          : in  std_logic                     := 'X';             -- write
			node_1_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_2_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_2_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_2_mem_write          : in  std_logic                     := 'X';             -- write
			node_2_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65536_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65536_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65536_mem_write      : in  std_logic                     := 'X';             -- write
			node_65536_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65537_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65537_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65537_mem_write      : in  std_logic                     := 'X';             -- write
			node_65537_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65538_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65538_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65538_mem_write      : in  std_logic                     := 'X';             -- write
			node_65538_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131072_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131072_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131072_mem_write     : in  std_logic                     := 'X';             -- write
			node_131072_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131073_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131073_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131073_mem_write     : in  std_logic                     := 'X';             -- write
			node_131073_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131074_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131074_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131074_mem_write     : in  std_logic                     := 'X';             -- write
			node_131074_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			reset_13_reset_n          : in  std_logic                     := 'X';             -- reset_n
			node_3_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_3_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_3_mem_write          : in  std_logic                     := 'X';             -- write
			node_3_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_4_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_4_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_4_mem_write          : in  std_logic                     := 'X';             -- write
			node_4_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_5_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_5_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_5_mem_write          : in  std_logic                     := 'X';             -- write
			node_5_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_6_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_6_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_6_mem_write          : in  std_logic                     := 'X';             -- write
			node_6_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_7_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_7_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_7_mem_write          : in  std_logic                     := 'X';             -- write
			node_7_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_8_mem_address        : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_8_mem_readdata       : out std_logic_vector(15 downto 0);                    -- readdata
			node_8_mem_write          : in  std_logic                     := 'X';             -- write
			node_8_mem_writedata      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65539_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65539_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65539_mem_write      : in  std_logic                     := 'X';             -- write
			node_65539_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65540_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65540_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65540_mem_write      : in  std_logic                     := 'X';             -- write
			node_65540_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65541_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65541_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65541_mem_write      : in  std_logic                     := 'X';             -- write
			node_65541_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65542_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65542_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65542_mem_write      : in  std_logic                     := 'X';             -- write
			node_65542_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65543_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65543_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65543_mem_write      : in  std_logic                     := 'X';             -- write
			node_65543_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_65544_mem_address    : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_65544_mem_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			node_65544_mem_write      : in  std_logic                     := 'X';             -- write
			node_65544_mem_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131075_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131075_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131075_mem_write     : in  std_logic                     := 'X';             -- write
			node_131075_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131076_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131076_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131076_mem_write     : in  std_logic                     := 'X';             -- write
			node_131076_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131077_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131077_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131077_mem_write     : in  std_logic                     := 'X';             -- write
			node_131077_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131078_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131078_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131078_mem_write     : in  std_logic                     := 'X';             -- write
			node_131078_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131079_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131079_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131079_mem_write     : in  std_logic                     := 'X';             -- write
			node_131079_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			node_131080_mem_address   : in  std_logic_vector(14 downto 0) := (others => 'X'); -- address
			node_131080_mem_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			node_131080_mem_write     : in  std_logic                     := 'X';             -- write
			node_131080_mem_writedata : in  std_logic_vector(15 downto 0) := (others => 'X')  -- writedata
		);
	end component dircc_system_rtl_gals_test_version;

	u0 : component dircc_system_rtl_gals_test_version
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --             clk.clk
			reset_reset_n             => CONNECTED_TO_reset_reset_n,             --           reset.reset_n
			node_0_mem_address        => CONNECTED_TO_node_0_mem_address,        --      node_0_mem.address
			node_0_mem_readdata       => CONNECTED_TO_node_0_mem_readdata,       --                .readdata
			node_0_mem_write          => CONNECTED_TO_node_0_mem_write,          --                .write
			node_0_mem_writedata      => CONNECTED_TO_node_0_mem_writedata,      --                .writedata
			node_1_mem_address        => CONNECTED_TO_node_1_mem_address,        --      node_1_mem.address
			node_1_mem_readdata       => CONNECTED_TO_node_1_mem_readdata,       --                .readdata
			node_1_mem_write          => CONNECTED_TO_node_1_mem_write,          --                .write
			node_1_mem_writedata      => CONNECTED_TO_node_1_mem_writedata,      --                .writedata
			node_2_mem_address        => CONNECTED_TO_node_2_mem_address,        --      node_2_mem.address
			node_2_mem_readdata       => CONNECTED_TO_node_2_mem_readdata,       --                .readdata
			node_2_mem_write          => CONNECTED_TO_node_2_mem_write,          --                .write
			node_2_mem_writedata      => CONNECTED_TO_node_2_mem_writedata,      --                .writedata
			node_65536_mem_address    => CONNECTED_TO_node_65536_mem_address,    --  node_65536_mem.address
			node_65536_mem_readdata   => CONNECTED_TO_node_65536_mem_readdata,   --                .readdata
			node_65536_mem_write      => CONNECTED_TO_node_65536_mem_write,      --                .write
			node_65536_mem_writedata  => CONNECTED_TO_node_65536_mem_writedata,  --                .writedata
			node_65537_mem_address    => CONNECTED_TO_node_65537_mem_address,    --  node_65537_mem.address
			node_65537_mem_readdata   => CONNECTED_TO_node_65537_mem_readdata,   --                .readdata
			node_65537_mem_write      => CONNECTED_TO_node_65537_mem_write,      --                .write
			node_65537_mem_writedata  => CONNECTED_TO_node_65537_mem_writedata,  --                .writedata
			node_65538_mem_address    => CONNECTED_TO_node_65538_mem_address,    --  node_65538_mem.address
			node_65538_mem_readdata   => CONNECTED_TO_node_65538_mem_readdata,   --                .readdata
			node_65538_mem_write      => CONNECTED_TO_node_65538_mem_write,      --                .write
			node_65538_mem_writedata  => CONNECTED_TO_node_65538_mem_writedata,  --                .writedata
			node_131072_mem_address   => CONNECTED_TO_node_131072_mem_address,   -- node_131072_mem.address
			node_131072_mem_readdata  => CONNECTED_TO_node_131072_mem_readdata,  --                .readdata
			node_131072_mem_write     => CONNECTED_TO_node_131072_mem_write,     --                .write
			node_131072_mem_writedata => CONNECTED_TO_node_131072_mem_writedata, --                .writedata
			node_131073_mem_address   => CONNECTED_TO_node_131073_mem_address,   -- node_131073_mem.address
			node_131073_mem_readdata  => CONNECTED_TO_node_131073_mem_readdata,  --                .readdata
			node_131073_mem_write     => CONNECTED_TO_node_131073_mem_write,     --                .write
			node_131073_mem_writedata => CONNECTED_TO_node_131073_mem_writedata, --                .writedata
			node_131074_mem_address   => CONNECTED_TO_node_131074_mem_address,   -- node_131074_mem.address
			node_131074_mem_readdata  => CONNECTED_TO_node_131074_mem_readdata,  --                .readdata
			node_131074_mem_write     => CONNECTED_TO_node_131074_mem_write,     --                .write
			node_131074_mem_writedata => CONNECTED_TO_node_131074_mem_writedata, --                .writedata
			reset_13_reset_n          => CONNECTED_TO_reset_13_reset_n,          --        reset_13.reset_n
			node_3_mem_address        => CONNECTED_TO_node_3_mem_address,        --      node_3_mem.address
			node_3_mem_readdata       => CONNECTED_TO_node_3_mem_readdata,       --                .readdata
			node_3_mem_write          => CONNECTED_TO_node_3_mem_write,          --                .write
			node_3_mem_writedata      => CONNECTED_TO_node_3_mem_writedata,      --                .writedata
			node_4_mem_address        => CONNECTED_TO_node_4_mem_address,        --      node_4_mem.address
			node_4_mem_readdata       => CONNECTED_TO_node_4_mem_readdata,       --                .readdata
			node_4_mem_write          => CONNECTED_TO_node_4_mem_write,          --                .write
			node_4_mem_writedata      => CONNECTED_TO_node_4_mem_writedata,      --                .writedata
			node_5_mem_address        => CONNECTED_TO_node_5_mem_address,        --      node_5_mem.address
			node_5_mem_readdata       => CONNECTED_TO_node_5_mem_readdata,       --                .readdata
			node_5_mem_write          => CONNECTED_TO_node_5_mem_write,          --                .write
			node_5_mem_writedata      => CONNECTED_TO_node_5_mem_writedata,      --                .writedata
			node_6_mem_address        => CONNECTED_TO_node_6_mem_address,        --      node_6_mem.address
			node_6_mem_readdata       => CONNECTED_TO_node_6_mem_readdata,       --                .readdata
			node_6_mem_write          => CONNECTED_TO_node_6_mem_write,          --                .write
			node_6_mem_writedata      => CONNECTED_TO_node_6_mem_writedata,      --                .writedata
			node_7_mem_address        => CONNECTED_TO_node_7_mem_address,        --      node_7_mem.address
			node_7_mem_readdata       => CONNECTED_TO_node_7_mem_readdata,       --                .readdata
			node_7_mem_write          => CONNECTED_TO_node_7_mem_write,          --                .write
			node_7_mem_writedata      => CONNECTED_TO_node_7_mem_writedata,      --                .writedata
			node_8_mem_address        => CONNECTED_TO_node_8_mem_address,        --      node_8_mem.address
			node_8_mem_readdata       => CONNECTED_TO_node_8_mem_readdata,       --                .readdata
			node_8_mem_write          => CONNECTED_TO_node_8_mem_write,          --                .write
			node_8_mem_writedata      => CONNECTED_TO_node_8_mem_writedata,      --                .writedata
			node_65539_mem_address    => CONNECTED_TO_node_65539_mem_address,    --  node_65539_mem.address
			node_65539_mem_readdata   => CONNECTED_TO_node_65539_mem_readdata,   --                .readdata
			node_65539_mem_write      => CONNECTED_TO_node_65539_mem_write,      --                .write
			node_65539_mem_writedata  => CONNECTED_TO_node_65539_mem_writedata,  --                .writedata
			node_65540_mem_address    => CONNECTED_TO_node_65540_mem_address,    --  node_65540_mem.address
			node_65540_mem_readdata   => CONNECTED_TO_node_65540_mem_readdata,   --                .readdata
			node_65540_mem_write      => CONNECTED_TO_node_65540_mem_write,      --                .write
			node_65540_mem_writedata  => CONNECTED_TO_node_65540_mem_writedata,  --                .writedata
			node_65541_mem_address    => CONNECTED_TO_node_65541_mem_address,    --  node_65541_mem.address
			node_65541_mem_readdata   => CONNECTED_TO_node_65541_mem_readdata,   --                .readdata
			node_65541_mem_write      => CONNECTED_TO_node_65541_mem_write,      --                .write
			node_65541_mem_writedata  => CONNECTED_TO_node_65541_mem_writedata,  --                .writedata
			node_65542_mem_address    => CONNECTED_TO_node_65542_mem_address,    --  node_65542_mem.address
			node_65542_mem_readdata   => CONNECTED_TO_node_65542_mem_readdata,   --                .readdata
			node_65542_mem_write      => CONNECTED_TO_node_65542_mem_write,      --                .write
			node_65542_mem_writedata  => CONNECTED_TO_node_65542_mem_writedata,  --                .writedata
			node_65543_mem_address    => CONNECTED_TO_node_65543_mem_address,    --  node_65543_mem.address
			node_65543_mem_readdata   => CONNECTED_TO_node_65543_mem_readdata,   --                .readdata
			node_65543_mem_write      => CONNECTED_TO_node_65543_mem_write,      --                .write
			node_65543_mem_writedata  => CONNECTED_TO_node_65543_mem_writedata,  --                .writedata
			node_65544_mem_address    => CONNECTED_TO_node_65544_mem_address,    --  node_65544_mem.address
			node_65544_mem_readdata   => CONNECTED_TO_node_65544_mem_readdata,   --                .readdata
			node_65544_mem_write      => CONNECTED_TO_node_65544_mem_write,      --                .write
			node_65544_mem_writedata  => CONNECTED_TO_node_65544_mem_writedata,  --                .writedata
			node_131075_mem_address   => CONNECTED_TO_node_131075_mem_address,   -- node_131075_mem.address
			node_131075_mem_readdata  => CONNECTED_TO_node_131075_mem_readdata,  --                .readdata
			node_131075_mem_write     => CONNECTED_TO_node_131075_mem_write,     --                .write
			node_131075_mem_writedata => CONNECTED_TO_node_131075_mem_writedata, --                .writedata
			node_131076_mem_address   => CONNECTED_TO_node_131076_mem_address,   -- node_131076_mem.address
			node_131076_mem_readdata  => CONNECTED_TO_node_131076_mem_readdata,  --                .readdata
			node_131076_mem_write     => CONNECTED_TO_node_131076_mem_write,     --                .write
			node_131076_mem_writedata => CONNECTED_TO_node_131076_mem_writedata, --                .writedata
			node_131077_mem_address   => CONNECTED_TO_node_131077_mem_address,   -- node_131077_mem.address
			node_131077_mem_readdata  => CONNECTED_TO_node_131077_mem_readdata,  --                .readdata
			node_131077_mem_write     => CONNECTED_TO_node_131077_mem_write,     --                .write
			node_131077_mem_writedata => CONNECTED_TO_node_131077_mem_writedata, --                .writedata
			node_131078_mem_address   => CONNECTED_TO_node_131078_mem_address,   -- node_131078_mem.address
			node_131078_mem_readdata  => CONNECTED_TO_node_131078_mem_readdata,  --                .readdata
			node_131078_mem_write     => CONNECTED_TO_node_131078_mem_write,     --                .write
			node_131078_mem_writedata => CONNECTED_TO_node_131078_mem_writedata, --                .writedata
			node_131079_mem_address   => CONNECTED_TO_node_131079_mem_address,   -- node_131079_mem.address
			node_131079_mem_readdata  => CONNECTED_TO_node_131079_mem_readdata,  --                .readdata
			node_131079_mem_write     => CONNECTED_TO_node_131079_mem_write,     --                .write
			node_131079_mem_writedata => CONNECTED_TO_node_131079_mem_writedata, --                .writedata
			node_131080_mem_address   => CONNECTED_TO_node_131080_mem_address,   -- node_131080_mem.address
			node_131080_mem_readdata  => CONNECTED_TO_node_131080_mem_readdata,  --                .readdata
			node_131080_mem_write     => CONNECTED_TO_node_131080_mem_write,     --                .write
			node_131080_mem_writedata => CONNECTED_TO_node_131080_mem_writedata  --                .writedata
		);

