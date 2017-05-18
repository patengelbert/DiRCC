
`timescale 1 ps / 1 ps

module dircc_avalon_st_terminal_test;
    parameter TIMEOUT = 1000000000;

    event setup_done, reset_asserted, reset_deasserted;

    dircc_avalon_st_terminal_sys_tb tb();

    alias clk = tb.dircc_avalon_st_terminal_sys_inst_clk_bfm_clk_clk;

    task automatic send_packet();
        // Word 1
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_sop(1);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_data($random);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.push_transaction();
        // Word 2
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_data($random);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.push_transaction();
        // Word 3
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_eop(1);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_data($random);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_terminal_sys_inst_s1_bfm.push_transaction();
    endtask // automatic

    task automatic reset();
        tb.dircc_avalon_st_terminal_sys_inst_reset_bfm.reset_assert();
        -> reset_asserted;
        repeat(10) @(posedge clk);
        tb.dircc_avalon_st_terminal_sys_inst_reset_bfm.reset_deassert();
        @(posedge clk);
        -> reset_deasserted;

    endtask : reset // automatic

    task automatic test_error_signal();
        reset();
        wait(reset_deasserted.triggered);
        send_packet();
        @(posedge clk);
    endtask : test_error_signal //automatic

    initial begin
        test_error_signal();
    end

endmodule : dircc_avalon_st_terminal_test