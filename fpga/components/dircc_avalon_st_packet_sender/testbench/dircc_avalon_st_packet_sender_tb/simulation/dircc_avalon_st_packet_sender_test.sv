
`timescale 1 ps / 1 ps

module dircc_avalon_st_packet_sender_test;
    parameter TIMEOUT = 10000;

    dircc_avalon_st_packet_sender_tb tb();

    string message = "*uninitialized*";

    import dircc_types_pkg::*;
    import verbosity_pkg::*;

    alias reset = tb.dircc_avalon_st_packet_sender_inst_reset_bfm_reset_reset;
    alias clk = tb.dircc_avalon_st_packet_sender_inst_clk_bfm_clk_clk;

    event reset_asserted, reset_deasserted;

    task automatic setupTest();
        tb.dircc_avalon_st_packet_sender_inst_reset_bfm.reset_assert();
        tb.dircc_avalon_st_packet_sender_inst_write_packet = 0;
        -> reset_asserted;
        repeat(10) @(posedge clk);
        tb.dircc_avalon_st_packet_sender_inst_reset_bfm.reset_deassert();
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.set_ready(1);
        repeat(2) @(posedge clk);
        -> reset_deasserted;
    endtask : setupTest    

    task automatic waitForMessage(input int timeout, output bool rv);
        fork: WaitWithTimeout 
            begin : checkReceived
                repeat(8) @(tb.dircc_avalon_st_packet_sender_inst_output_bfm.signal_transaction_received);
                $sformat(message, "%m: - All transactions received. %d/8", tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_queue_size());
                print(VERBOSITY_INFO, message);  
                disable WaitWithTimeout;
            end : checkReceived
            begin : checkTimout
                repeat(timeout) @(posedge clk);
                $sformat(message, "%m: - TEST Timeout %d. %d/8 received", timeout, tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_queue_size());
                print(VERBOSITY_ERROR, message);  
                disable WaitWithTimeout;
            end : checkTimout 
        join : WaitWithTimeout
        rv = tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_queue_size() == 8 ? TRUE : FALSE;
    endtask : waitForMessage

    task automatic checkPacket(packet_t packet);
        // Word 1
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data() == packet.dest_addr.hw_addr);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 1);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);
        
        // Word 2
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data()[31:8] == 
            {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag});
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);

        // Word 3
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data() == packet.src_addr.hw_addr);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);

        // Word 4
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data()[31:8] == 
            {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag});
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);

        // Word 5
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data() == packet.lamport);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);

        // Word 6
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data() == packet.data[31:0]);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);

        // Word 7
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data() == packet.data[63:32]);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);

        // Word 8
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data() == packet.data[95:64]);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 1);
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0);

    endtask : checkPacket

    task automatic sendPacket(input packet_t packet);
        tb.dircc_avalon_st_packet_sender_inst_packet_data = packet;
        tb.dircc_avalon_st_packet_sender_inst_write_packet = 1;
        @(posedge tb.dircc_avalon_st_packet_sender_inst_sending);
        tb.dircc_avalon_st_packet_sender_inst_write_packet = 0;
    endtask : sendPacket

    task automatic test_resetCorrect();
        setupTest();
        tb.dircc_avalon_st_packet_sender_inst_reset_bfm.reset_assert();
        assert (!tb.dircc_avalon_st_packet_sender_inst_output_valid && !tb.dircc_avalon_st_packet_sender_inst_sending) begin
            $sformat(message, "%m: - TEST SUCCESS");
            print(VERBOSITY_INFO, message);  
        end
        else begin
            $sformat(message, "%m: - TEST ERROR");
            print(VERBOSITY_ERROR, message);  
        end
        $sformat(message, "%m: - Test Complete.");
        print(VERBOSITY_INFO, message);  
    endtask : test_resetCorrect

    task automatic test_sendPacket();
        automatic bool rv = FALSE;
        automatic bit [31:0] data;
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
            lamport: 0,
            data: $random
        };
        setupTest();
        sendPacket(packetToSend);
        waitForMessage(TIMEOUT, rv);
        if(rv == TRUE) begin
            checkPacket(packetToSend);
            $sformat(message, "%m: - TEST SUCCESS");
            print(VERBOSITY_INFO, message);  
        end else begin
            $sformat(message, "%m: - TEST ERROR");
            print(VERBOSITY_ERROR, message);  
        end
        $sformat(message, "%m: - Test Complete.");
        print(VERBOSITY_INFO, message);  
    endtask : test_sendPacket

    initial begin
        repeat(100) @(posedge clk);
        $sformat(message, "%m: - Starting Tests.");
        print(VERBOSITY_INFO, message);  
        test_resetCorrect();
        test_sendPacket();
    end

endmodule : dircc_avalon_st_packet_sender_test