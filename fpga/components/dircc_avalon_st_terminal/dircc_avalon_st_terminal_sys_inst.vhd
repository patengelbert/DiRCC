	component dircc_avalon_st_terminal_sys is
		port (
			clk_clk          : in  std_logic                     := 'X';             -- clk
			reset_reset_n    : in  std_logic                     := 'X';             -- reset_n
			s1_data          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			s1_empty         : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			s1_endofpacket   : in  std_logic                     := 'X';             -- endofpacket
			s1_ready         : out std_logic;                                        -- ready
			s1_startofpacket : in  std_logic                     := 'X';             -- startofpacket
			s1_valid         : in  std_logic                     := 'X';             -- valid
			status_readdata  : out std_logic_vector(15 downto 0);                    -- readdata
			status_address   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			status_read_n    : in  std_logic                     := 'X'              -- read_n
		);
	end component dircc_avalon_st_terminal_sys;

	u0 : component dircc_avalon_st_terminal_sys
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --    clk.clk
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --  reset.reset_n
			s1_data          => CONNECTED_TO_s1_data,          --     s1.data
			s1_empty         => CONNECTED_TO_s1_empty,         --       .empty
			s1_endofpacket   => CONNECTED_TO_s1_endofpacket,   --       .endofpacket
			s1_ready         => CONNECTED_TO_s1_ready,         --       .ready
			s1_startofpacket => CONNECTED_TO_s1_startofpacket, --       .startofpacket
			s1_valid         => CONNECTED_TO_s1_valid,         --       .valid
			status_readdata  => CONNECTED_TO_status_readdata,  -- status.readdata
			status_address   => CONNECTED_TO_status_address,   --       .address
			status_read_n    => CONNECTED_TO_status_read_n     --       .read_n
		);

