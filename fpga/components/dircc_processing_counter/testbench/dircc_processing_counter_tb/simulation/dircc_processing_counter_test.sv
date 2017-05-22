
`timescale 1 ps / 1 ps

import dircc_types_pkg::*;
import verbosity_pkg::*;
import avalon_mm_pkg::*;

module dircc_processing_counter_test();
    parameter TIMEOUT = 1000000000;

    event setup_done, reset_asserted, reset_deasserted;

    dircc_processing_counter_tb tb();

    alias clk = tb.dircc_processing_counter_inst_clk_bfm_clk_clk;
    alias reset_n = tb.dircc_processing_counter_inst_reset_bfm_reset_reset;

    task automatic setupTest();
        tb.dircc_processing_counter_inst_reset_bfm.reset_assert();
        tb.dircc_processing_counter_inst_address = 0;
        ->reset_asserted;
        repeat(10) @(posedge clk);
        tb.dircc_processing_counter_inst_reset_bfm.reset_deassert();
        tb.dircc_processing_counter_inst_output_bfm.set_ready(1);
        repeat(2) @(posedge clk);
        ->reset_deasserted;
    endtask : setupTest

    task automatic waitForResponse(input event ev, input int timeout, inout bool rv);
        fork: WaitWithTimeout 
            begin : checkReceived
                wait(ev.triggered); 
                disable WaitWithTimeout;
            end : checkReceived
            begin : checkTimout
                repeat(timeout) @(posedge clk);
                $sformat(message, "%m: - TEST Timeout %d", timeout);
                print(VERBOSITY_ERROR, message);  
                disable WaitWithTimeout;
            end : checkTimout 
        join : WaitWithTimeout
        rv = tb.dircc_processing_counter_inst_status_bfm.all_transactions_complete() ? TRUE : FALSE;
    endtask : waitForResponse

    task automatic printSuccess(input bool rv);
        if (rv == TRUE) begin
            $sformat(message, "%m: TEST SUCCESS");
            print(VERBOSITY_INFO, message);
        end else begin
            $sformat(message, "%m: TEST ERROR");
            print(VERBOSITY_ERROR, message);
        end
        $sformat(message, "%m: Test Complete");
        print(VERBOSITY_INFO, message);
    endtask

    task automatic printAssert(input a, input b, inout bool rv);
        assert(a == b)
        else begin
            rv = FALSE;
            $sformat(message, "%m: - Expected: %d. Got %d", a, b);
            print(VERBOSITY_ERROR, message);
        end

    endtask //automatic

    task automatic sendPacket(packet_t packet, int startPacket, int endPacket);

        if (startPacket <= 0 && endPacket >= 0) begin
        // Word 1
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(packet.dest_addr.hw_addr);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(1);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end
        
        if (startPacket <= 1 && endPacket >= 1) begin
        // Word 2
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(
            {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag, 8'b0});
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 2 && endPacket >= 2) begin

        // Word 3
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(packet.src_addr.hw_addr);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 3 && endPacket >= 3) begin

        // Word 4
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(
            {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag, 8'b0});
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end 

        if (startPacket <= 4 && endPacket >= 4) begin

        // Word 5
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(packet.lamport);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 5 && endPacket >= 5) begin

        // Word 6
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(packet.data[31:0]);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 6 && endPacket >= 6) begin

        // Word 7
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(packet.data[63:32]);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 7 && endPacket >= 7) begin

        // Word 8
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_data(packet.data[95:64]);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_eop(1);
        tb.dircc_processing_counter_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_processing_counter_inst_input_bfm.push_transaction();

        end

        $sformat(message, "%m: - Sent %d words", tb.dircc_processing_counter_inst_input_bfm.get_transaction_queue_size());
        print(VERBOSITY_INFO, message);

    endtask : sendPacket

    task automatic receivePacket(output packet_t packet, inout bool rv);
        // Word 1
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        packet.dest_addr.hw_addr = tb.dircc_processing_counter_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 1
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 0 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        
        // Word 2
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag} = 
        tb.dircc_processing_counter_inst_output_bfm.get_transaction_data()[31:8];
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 1 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 3
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        packet.src_addr.hw_addr = tb.dircc_processing_counter_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 2 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 4
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag} = 
        tb.dircc_processing_counter_inst_output_bfm.get_transaction_data()[31:8];
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 3 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 5
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        packet.lamport = tb.dircc_processing_counter_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 4 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 6
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        packet.data[31:0] = tb.dircc_processing_counter_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 5 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 7
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        packet.data[63:32] = tb.dircc_processing_counter_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 6 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 8
        tb.dircc_processing_counter_inst_output_bfm.pop_transaction();
        packet.data[95:64] = tb.dircc_processing_counter_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_processing_counter_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_eop() == 1
                && tb.dircc_processing_counter_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 7 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
    endtask : receivePacket

    task automatic checkPacket(packet_t a, packet_t b, inout bool rv);
        rv = TRUE;
        // Dest Address
        assert (a.dest_addr.hw_addr == b.dest_addr.hw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest HW Addr mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.dest_addr.sw_addr == b.dest_addr.sw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest SW Addr mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.dest_addr.port == b.dest_addr.port)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest Port mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.dest_addr.flag == b.dest_addr.flag)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest Flag mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

        // Src Address
        assert (a.src_addr.hw_addr == b.src_addr.hw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src HW Addr mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

        assert (a.src_addr.sw_addr == b.src_addr.sw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src SW Addr mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.src_addr.port == b.src_addr.port)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src Port mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.src_addr.flag == b.src_addr.flag)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src Flag mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

        // lamport
        assert (a.lamport == b.lamport)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Lamport mismatch %d != %d", a.lamport, b.lamport);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

        // Data
        assert (a.data == b.data)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Data mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

    endtask : checkPacket

    task automatic test_reset();
        automatic bool rv;
        automatic bit [15:0] response_data;

        setupTest();

        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b0);
        tb.dircc_processing_counter_inst_status_bfm.push_command();

        waitForResponse(tb.dircc_processing_counter_inst_status_bfm.signal_all_transactions_complete, TIMEOUT, rv);

        if (rv == TRUE) begin
            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(0, response_data, rv);
        end
        printSuccess(rv);
    endtask : test_reset

    task automatic test_packetInHandlerUsed();
        automatic bool rv;
        automatic bit [15:0] response_data;
        automatic packet_t packetToSend = '{
            dest_addr: '{
                hw_addr: $random,
                sw_addr: $random,
                port: $random,
                flag: 0
            },
            src_addr: '{
                hw_addr: $random,
                sw_addr: $random,
                port: $random,
                flag: 0
            },
            lamport: 1,
            data: $random
        };
        setupTest();

        sendPacket(packetToSend, 0, 7);

        waitForResponse(tb.dircc_processing_counter_inst_input_bfm.signal_src_transaction_complete, TIMEOUT, rv);

        // 3 Clock cycles input packet -> state change
        repeat(3) @(posedge clk);

        // Word 1
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b100);
        tb.dircc_processing_counter_inst_status_bfm.push_command();
        // Word 2
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b110);
        tb.dircc_processing_counter_inst_status_bfm.push_command();
        // Word 3
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b1000);
        tb.dircc_processing_counter_inst_status_bfm.push_command();
        // Word 4
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b1010);
        tb.dircc_processing_counter_inst_status_bfm.push_command();

        waitForResponse(tb.dircc_processing_counter_inst_status_bfm.signal_all_transactions_complete, TIMEOUT, rv);

        if (rv == TRUE) begin
            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(1, response_data, rv);

            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(1, response_data, rv);

            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(0, response_data, rv);

            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(0, response_data, rv);

        end
        printSuccess(rv);
    endtask : test_packetInHandlerUsed

    task automatic test_packetOutHandlerUsed();
        automatic bool rv;
        automatic bit [15:0] response_data;
        automatic packet_t packetToSend = '{
            dest_addr: '{
                hw_addr: $random,
                sw_addr: $random,
                port: $random,
                flag: 0
            },
            src_addr: '{
                hw_addr: $random,
                sw_addr: $random,
                port: $random,
                flag: 0
            },
            lamport: 1,
            data: $random
        };
        automatic packet_t expectedPacket = '{
            dest_addr: '{
                hw_addr: 1,
                sw_addr: 0,
                port: 0,
                flag: 0
            },
            src_addr: '{
                hw_addr: tb.dircc_processing_counter_inst_address,
                sw_addr: 0,
                port: 0,
                flag: 0
            },
            lamport: 3,
            data: 1
        };
        automatic packet_t receivedPacket;

        setupTest();

        sendPacket(packetToSend, 0, 7);

        waitForResponse(tb.dircc_processing_counter_inst_input_bfm.signal_src_transaction_complete, TIMEOUT, rv);

        // 3 Clock cycles input packet -> state change
        // 3 Clock cycles state change -> output packet
        repeat(6) @(posedge clk);

        // Word 1
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b100);
        tb.dircc_processing_counter_inst_status_bfm.push_command();
        // Word 2
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b110);
        tb.dircc_processing_counter_inst_status_bfm.push_command();
        // Word 3
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b1000);
        tb.dircc_processing_counter_inst_status_bfm.push_command();
        // Word 4
        tb.dircc_processing_counter_inst_status_bfm.set_command_request(REQ_READ);
        tb.dircc_processing_counter_inst_status_bfm.set_command_address('b1010);
        tb.dircc_processing_counter_inst_status_bfm.push_command();

        waitForResponse(tb.dircc_processing_counter_inst_status_bfm.signal_all_transactions_complete, TIMEOUT, rv);

        repeat(8) @(posedge clk);

        // Packet should have been sent by now as well
        assert(tb.dircc_processing_counter_inst_output_bfm.get_transaction_queue_size() == 8)
        else begin
            rv = FALSE;
            $sformat(message, "%m: - TEST ERROR: Packet not fully received. %d/%d", 
                tb.dircc_processing_counter_inst_output_bfm.get_transaction_queue_size(), 8);
            print(VERBOSITY_ERROR, message);
        end
        receivePacket(receivedPacket, rv);
        checkPacket(expectedPacket, receivedPacket, rv);

        if (rv == TRUE) begin
            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(1, response_data, rv);

            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(0, response_data, rv);

            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(0, response_data, rv);

            tb.dircc_processing_counter_inst_status_bfm.pop_response();
            response_data = tb.dircc_processing_counter_inst_status_bfm.get_response_data(0);
            printAssert(0, response_data, rv);

        end
        printSuccess(rv);
    endtask : test_packetOutHandlerUsed

    initial begin
        repeat(100) @(posedge clk);
        test_reset();
        test_packetInHandlerUsed();
        test_packetOutHandlerUsed();
    end

endmodule : dircc_processing_counter_test
