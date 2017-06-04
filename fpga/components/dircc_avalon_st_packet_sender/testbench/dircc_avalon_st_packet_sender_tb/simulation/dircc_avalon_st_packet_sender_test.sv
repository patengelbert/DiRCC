
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

    task automatic waitForMessage(input int timeout, inout bool rv);
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
                rv = FALSE;
                disable WaitWithTimeout;
            end : checkTimout 
        join : WaitWithTimeout
    endtask : waitForMessage

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

    task automatic printAssert(input longint a, input longint b, inout bool rv);
        assert(a == b)
        else begin
            rv = FALSE;
            $sformat(message, "%m: - Expected: %d. Got %d", a, b);
            print(VERBOSITY_ERROR, message);
        end

    endtask

    task automatic receivePacket(output packet_t packet, inout bool rv);
        // Word 1
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        packet.dest_addr.hw_addr = tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 1
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 0 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        
        // Word 2
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag} = 
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data()[31:8];
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 1 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 3
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        packet.src_addr.hw_addr = tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 2 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 4
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag} = 
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data()[31:8];
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 3 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 5
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        packet.lamport = tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 4 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 6
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        packet.data[31:0] = tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 5 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 7
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        packet.data[63:32] = tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 6 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 8
        tb.dircc_avalon_st_packet_sender_inst_output_bfm.pop_transaction();
        packet.data[95:64] = tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_eop() == 1
                && tb.dircc_avalon_st_packet_sender_inst_output_bfm.get_transaction_empty() == 0)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 7 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
    endtask : receivePacket

    task automatic checkPacket(packet_t a, packet_t b, inout bool rv);
        // Dest Address
        assert (a.dest_addr.hw_addr == b.dest_addr.hw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest HW Addr mismatch %d != %d", a.dest_addr.hw_addr, b.dest_addr.hw_addr);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.dest_addr.sw_addr == b.dest_addr.sw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest SW Addr mismatch %d != %d", a.dest_addr.sw_addr, b.dest_addr.sw_addr);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.dest_addr.port == b.dest_addr.port)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest Port mismatch %d != %d", a.dest_addr.port, b.dest_addr.port);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.dest_addr.flag == b.dest_addr.flag)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Dest Flag mismatch %d != %d", a.dest_addr.flag, b.dest_addr.flag);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

        // Src Address
        assert (a.src_addr.hw_addr == b.src_addr.hw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src HW Addr mismatch %d != %d", a.src_addr.hw_addr, b.src_addr.hw_addr);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

        assert (a.src_addr.sw_addr == b.src_addr.sw_addr)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src SW Addr mismatch %d != %d", a.src_addr.sw_addr, b.src_addr.sw_addr);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.src_addr.port == b.src_addr.port)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src Port mismatch %d != %d", a.src_addr.port, b.src_addr.port);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  
        assert (a.src_addr.flag == b.src_addr.flag)
        else begin 
            $sformat(message, "%m: - TEST ERROR: Src Flag mismatch %d != %d", a.src_addr.flag, b.src_addr.flag);
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
            $sformat(message, "%m: - TEST ERROR: Data mismatch %d != %d", a.data, b.data);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end  

    endtask : checkPacket

    task automatic sendPacket(input packet_t packet);
        tb.dircc_avalon_st_packet_sender_inst_packet_data = packet;
        tb.dircc_avalon_st_packet_sender_inst_write_packet = 1;
        @(posedge tb.dircc_avalon_st_packet_sender_inst_sending);
        tb.dircc_avalon_st_packet_sender_inst_write_packet = 0;
    endtask : sendPacket

    task automatic test_resetCorrect();
        automatic bool rv = TRUE;

        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);
        setupTest();

        tb.dircc_avalon_st_packet_sender_inst_reset_bfm.reset_assert();
        printAssert(tb.dircc_avalon_st_packet_sender_inst_output_valid, 0, rv);
        printAssert(tb.dircc_avalon_st_packet_sender_inst_sending, 0, rv);

        printSuccess(rv);
    endtask : test_resetCorrect

    task automatic test_sendPacket();
        automatic bool rv = TRUE;
        automatic packet_t received_packet;
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

        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);
        setupTest();

        sendPacket(packetToSend);
        waitForMessage(TIMEOUT, rv);

        receivePacket(received_packet, rv);
        checkPacket(packetToSend, received_packet, rv);

        printSuccess(rv);
    endtask : test_sendPacket

    task automatic test_backPressure();
        automatic bool rv = TRUE;
        automatic packet_t received_packet;
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
        
        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);
        setupTest();

        sendPacket(packetToSend);
        repeat(3) @(posedge clk);

        tb.dircc_avalon_st_packet_sender_inst_output_bfm.set_ready(0);

        repeat(10) @(posedge clk);


        tb.dircc_avalon_st_packet_sender_inst_output_bfm.set_ready(1);

        repeat(10) @(posedge clk);

        receivePacket(received_packet, rv);
        checkPacket(packetToSend, received_packet, rv);

        printSuccess(rv);
    endtask : test_backPressure

    initial begin
        repeat(100) @(posedge clk);
        $sformat(message, "%m: - Starting Tests.");
        print(VERBOSITY_INFO, message);  
        test_resetCorrect();
        test_sendPacket();
        test_backPressure();
    end

endmodule : dircc_avalon_st_packet_sender_test