
`timescale 1 ps / 1 ps

import dircc_types_pkg::*;
import verbosity_pkg::*;
import avalon_mm_pkg::*;

module dircc_avalon_st_terminal_test;
    parameter TIMEOUT = 1000000000;

    event setup_done, reset_asserted, reset_deasserted;

    dircc_status_register_tb tb();

    alias clk = tb.dircc_status_register_inst_clk_bfm_clk_clk;
    alias reset_n = tb.dircc_status_register_inst_reset_bfm_reset_reset;

    task automatic setupTest();
        tb.dircc_status_register_inst_reset_bfm.reset_assert();
        ->reset_asserted;
        repeat(10) @(posedge clk);
        tb.dircc_status_register_inst_reset_bfm.reset_deassert();
        tb.dircc_status_register_inst_write_state_valid = 0;
        repeat(2) @(posedge clk);
        ->reset_deasserted;
    endtask : setupTest

    task automatic waitForResponse(input int timeout, output bool rv);
        fork: WaitWithTimeout 
            begin : checkReceived
                wait(tb.dircc_status_register_inst_status_bfm.signal_all_transactions_complete.triggered);
                $sformat(message, "%m: - All transactions received");
                print(VERBOSITY_INFO, message);  
                disable WaitWithTimeout;
            end : checkReceived
            begin : checkTimout
                repeat(timeout) @(posedge clk);
                $sformat(message, "%m: - TEST Timeout %d", timeout);
                print(VERBOSITY_ERROR, message);  
                disable WaitWithTimeout;
            end : checkTimout 
        join : WaitWithTimeout
        rv = tb.dircc_status_register_inst_status_bfm.all_transactions_complete() ? TRUE : FALSE;
    endtask : waitForResponse

    task automatic test_reset();
        automatic bool rv;

        setupTest();
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b0);
        tb.dircc_status_register_inst_status_bfm.push_command();

        waitForResponse(TIMEOUT, rv);

        if (rv == TRUE) begin
            tb.dircc_status_register_inst_status_bfm.pop_response();
            assert (tb.dircc_status_register_inst_status_bfm.get_response_data(0) == 0)
            else rv = FALSE;
        end
        if (rv == TRUE) begin
            $sformat(message, "%m: TEST SUCCESS");
            print(VERBOSITY_INFO, message);
        end else begin
            $sformat(message, "%m: TEST ERROR");
            print(VERBOSITY_ERROR, message);
        end
        $sformat(message, "%m: Test Complete");
        print(VERBOSITY_INFO, message);
    endtask : test_reset

    task automatic test_dirccStatusWritten();
        automatic bool rv;
        automatic bit [15:0] returnState;
        automatic bit [15:0] testStatus = $random;

        setupTest();
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_WRITE);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b0);
        tb.dircc_status_register_inst_status_bfm.set_command_data(testStatus, 0);
        tb.dircc_status_register_inst_status_bfm.push_command();

        waitForResponse(TIMEOUT, rv);

        if (rv == TRUE) begin
            returnState = tb.dircc_status_register_inst_read_state.dircc_state;
            assert(returnState == testStatus)
            else begin
                $sformat(message, "%m: Expected %d, got %d", testStatus, returnState);
                print(VERBOSITY_ERROR, message);
                rv = FALSE;
            end
        end
        if (rv == TRUE) begin
            $sformat(message, "%m: TEST SUCCESS");
            print(VERBOSITY_INFO, message);
        end else begin
            $sformat(message, "%m: TEST ERROR");
            print(VERBOSITY_ERROR, message);
        end
        $sformat(message, "%m: Test Complete");
        print(VERBOSITY_INFO, message);
    endtask : test_dirccStatusWritten

    task automatic test_dirccExtraWritten();
        automatic bool rv;
        automatic bit [15:0] returnStateExtra;
        automatic bit [15:0] testStatusExtra = $random;

        setupTest();
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_WRITE);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b10);
        tb.dircc_status_register_inst_status_bfm.set_command_data(testStatusExtra, 0);
        tb.dircc_status_register_inst_status_bfm.push_command();

        waitForResponse(TIMEOUT, rv);

        if (rv == TRUE) begin
            returnStateExtra = tb.dircc_status_register_inst_read_state.dircc_state_extra;
            assert(returnStateExtra == testStatusExtra)
            else begin
                $sformat(message, "%m: Expected %d, got %d", testStatusExtra, returnStateExtra);
                print(VERBOSITY_ERROR, message);
                rv = FALSE;
            end
        end
        if (rv == TRUE) begin
            $sformat(message, "%m: TEST SUCCESS");
            print(VERBOSITY_INFO, message);
        end else begin
            $sformat(message, "%m: TEST ERROR");
            print(VERBOSITY_ERROR, message);
        end
        $sformat(message, "%m: Test Complete");
        print(VERBOSITY_INFO, message);
    endtask : test_dirccExtraWritten

    task automatic test_userStateWritten();
        automatic bool rv;
        automatic bit [63:0] returnState;
        automatic bit [63:0] testUserState = $random;

        setupTest();
        // Word 1
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_WRITE);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b100);
        tb.dircc_status_register_inst_status_bfm.set_command_data(testUserState[15:0], 0);
        tb.dircc_status_register_inst_status_bfm.push_command();
        // Word 2
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_WRITE);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b110);
        tb.dircc_status_register_inst_status_bfm.set_command_data(testUserState[31:16], 0);
        tb.dircc_status_register_inst_status_bfm.push_command();
        // Word 3
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_WRITE);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b1000);
        tb.dircc_status_register_inst_status_bfm.set_command_data(testUserState[47:32], 0);
        tb.dircc_status_register_inst_status_bfm.push_command();
        // Word 4
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_WRITE);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b1010);
        tb.dircc_status_register_inst_status_bfm.set_command_data(testUserState[63:48], 0);
        tb.dircc_status_register_inst_status_bfm.push_command();

        waitForResponse(TIMEOUT, rv);

        if (rv == TRUE) begin
            returnState = tb.dircc_status_register_inst_read_state.user_state;
            assert(returnState == testUserState)
            else begin
                $sformat(message, "%m: Expected %d, got %d", testUserState, returnState);
                print(VERBOSITY_ERROR, message);
                rv = FALSE;
            end
        end
        if (rv == TRUE) begin
            $sformat(message, "%m: TEST SUCCESS");
            print(VERBOSITY_INFO, message);
        end else begin
            $sformat(message, "%m: TEST ERROR");
            print(VERBOSITY_ERROR, message);
        end
        $sformat(message, "%m: Test Complete");
        print(VERBOSITY_INFO, message);
    endtask : test_userStateWritten

    task automatic test_dirccStateRead();
        automatic bool rv;
        automatic bit [15:0] returnState;
        automatic bit [15:0] testStatus = $random;
        automatic bit [15:0] testExtraState = $random;

        setupTest();

        tb.dircc_status_register_inst_write_state.dircc_state = testStatus;
        tb.dircc_status_register_inst_write_state.dircc_state_extra = testExtraState;

        tb.dircc_status_register_inst_write_state_valid = 1;
        @(posedge clk);

        // Word 1
        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b00);
        tb.dircc_status_register_inst_status_bfm.push_command();

        tb.dircc_status_register_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_status_register_inst_status_bfm.set_command_address('b10);
        tb.dircc_status_register_inst_status_bfm.push_command();

        waitForResponse(TIMEOUT, rv);

        if (rv == TRUE) begin
            tb.dircc_status_register_inst_status_bfm.pop_response();
            returnState = tb.dircc_status_register_inst_status_bfm.get_response_data(0);
            assert(returnState == testStatus)
            else begin
                $sformat(message, "%m: Expected %d, got %d", testStatus, returnState);
                print(VERBOSITY_ERROR, message);
                rv = FALSE;
            end
                
            tb.dircc_status_register_inst_status_bfm.pop_response();
            returnState = tb.dircc_status_register_inst_status_bfm.get_response_data(0);
            assert(returnState == testExtraState)
            else begin
                $sformat(message, "%m: Expected %d, got %d", testExtraState, returnState);
                print(VERBOSITY_ERROR, message);
                rv = FALSE;
            end
        end
        if (rv == TRUE) begin
            $sformat(message, "%m: TEST SUCCESS");
            print(VERBOSITY_INFO, message);
        end else begin
            $sformat(message, "%m: TEST ERROR");
            print(VERBOSITY_ERROR, message);
        end
        $sformat(message, "%m: Test Complete");
        print(VERBOSITY_INFO, message);

        tb.dircc_status_register_inst_write_state_valid = 0;
    endtask : test_dirccStateRead

    initial begin
        repeat(100) @(posedge clk);
        test_reset();
        test_dirccStatusWritten();
        test_dirccExtraWritten();
        test_userStateWritten();
        test_dirccStateRead();
    end

endmodule : dircc_avalon_st_terminal_test