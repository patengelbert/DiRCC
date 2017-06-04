
`timescale 1 ps / 1 ps

module dircc_avalon_st_packet_receiver_test;
    parameter TIMEOUT = 10000;

    dircc_avalon_st_packet_receiver_tb tb();

    string message = "*uninitialized*";

    import dircc_types_pkg::*;
    import verbosity_pkg::*;

    alias reset = tb.dircc_avalon_st_packet_receiver_inst_reset_bfm_reset_reset;
    alias clk = tb.dircc_avalon_st_packet_receiver_inst_clk_bfm_clk_clk;

    event reset_asserted, reset_deasserted;


    task automatic setupTest();
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_assert();
        -> reset_asserted;
        repeat(10) @(posedge clk);
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_deassert();
        tb.dircc_avalon_st_packet_receiver_inst_booting = 0;
        repeat(2) @(posedge clk);
        -> reset_deasserted;
    endtask : setupTest

    task automatic waitWithTimeout(input event ev, input int timeout, inout bool rv);
        fork: WaitWithTimeout 
            begin : checkReceived
                wait(ev.triggered); 
                disable WaitWithTimeout;
            end : checkReceived
            begin : checkTimout
                repeat(timeout) @(posedge clk);
                rv = FALSE;
                $sformat(message, "%m: - TEST Timeout %d", timeout);
                print(VERBOSITY_ERROR, message);  
                disable WaitWithTimeout;
            end : checkTimout 
        join : WaitWithTimeout
        // Prevent this from happening multiple times in the same clock cycle
        @(posedge clk);
    endtask : waitWithTimeout

    task automatic sendPacket(packet_t packet, int startPacket, int endPacket);

        if (startPacket <= 0 && endPacket >= 0) begin
        // Word 1
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.dest_addr.hw_addr);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(1);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end
        
        if (startPacket <= 1 && endPacket >= 1) begin
        // Word 2
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(
            {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag, 8'b0});
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 2 && endPacket >= 2) begin

        // Word 3
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.src_addr.hw_addr);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 3 && endPacket >= 3) begin

        // Word 4
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(
            {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag, 8'b0});
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end 

        if (startPacket <= 4 && endPacket >= 4) begin

        // Word 5
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.lamport);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 5 && endPacket >= 5) begin

        // Word 6
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.data[31:0]);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 6 && endPacket >= 6) begin

        // Word 7
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.data[63:32]);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 7 && endPacket >= 7) begin

        // Word 8
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.data[95:64]);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(1);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        end

        $sformat(message, "%m: - Sent %d words", endPacket - startPacket + 1);
        print(VERBOSITY_INFO, message);

    endtask : sendPacket

    task automatic checkPacket(packet_t a, packet_t b, inout bool rv);
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
            $sformat(message, "%m: - TEST ERROR: Lamport mismatch");
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

    task automatic test_resetCorrect();
        automatic bool rv = TRUE;
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
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_assert();
        repeat(10) @(posedge clk);
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_deassert();
        repeat(10) @(posedge clk);

        printAssert(0, tb.dircc_avalon_st_packet_receiver_inst_receive_nearly_done, rv);
        printAssert(0, tb.dircc_avalon_st_packet_receiver_inst_receive_done, rv);
        printAssert(0, tb.dircc_avalon_st_packet_receiver_inst_packet_valid, rv);

        printSuccess(rv);
    endtask : test_resetCorrect

    task automatic test_receivePacket();
        automatic bool rv = TRUE;
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
        automatic packet_t receivedPacket;

        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);

        setupTest();

        sendPacket(packetToSend, 0, 7);
        
        waitWithTimeout(tb.dircc_avalon_st_packet_receiver_inst_input_bfm.signal_src_transaction_complete, TIMEOUT, rv);

        printAssert(0, tb.dircc_avalon_st_packet_receiver_inst_receive_nearly_done, rv);
        printAssert(1, tb.dircc_avalon_st_packet_receiver_inst_receive_done, rv);
        printAssert(1, tb.dircc_avalon_st_packet_receiver_inst_packet_valid, rv);

        if(rv == TRUE) begin
            checkPacket (tb.dircc_avalon_st_packet_receiver_inst_packet_data, packetToSend, rv);
        end else begin
            $sformat(message, "%m: - Packet not fully received");
            print(VERBOSITY_ERROR, message);  
            rv = FALSE;
        end

        printSuccess(rv);
    endtask : test_receivePacket

    task automatic test_receivePartialPacket();
        automatic bool rv = TRUE;
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
        automatic packet_t receivedPacket;

        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);

        setupTest();

        sendPacket(packetToSend, 0, 6);
        waitWithTimeout(tb.dircc_avalon_st_packet_receiver_inst_input_bfm.signal_src_transaction_complete, TIMEOUT, rv);
        
        printAssert(0, tb.dircc_avalon_st_packet_receiver_inst_receive_done, rv);
        printAssert(1, tb.dircc_avalon_st_packet_receiver_inst_receive_nearly_done, rv);
        printAssert(0, tb.dircc_avalon_st_packet_receiver_inst_packet_valid, rv);

        if (rv == FALSE) begin
            $sformat(message, "%m: - Packet not nearly received");
            print(VERBOSITY_ERROR, message);  
        end

        printSuccess(rv);
    endtask : test_receivePartialPacket

    task automatic test_stallsOnBoot();
        automatic bool rv = TRUE;
        automatic packet_t packetToSend[$] = '{
            '{
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
            }
        };
        automatic packet_t receivedPacket;

        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);
        setupTest();

        tb.dircc_avalon_st_packet_receiver_inst_booting = 1;

        for (int i = 0; i < 5; i++) begin
            sendPacket(packetToSend[0], 0, 7);
            repeat(10) @(posedge clk);
        end

        printAssert((4*8)-1, tb.dircc_avalon_st_packet_receiver_inst_input_bfm.get_transaction_queue_size(), rv);
        if(rv == FALSE) begin
            $sformat(message, "%m: - Did not correctly stall packets");
            print(VERBOSITY_ERROR, message);
        end

        tb.dircc_avalon_st_packet_receiver_inst_booting = 0;

        // 1 to write ready
        // 8 to load data
        // 1 to write to output
        repeat(10) @ (posedge clk);
                
        printAssert(1, tb.dircc_avalon_st_packet_receiver_inst_receive_done, rv);
        printAssert(0, tb.dircc_avalon_st_packet_receiver_inst_receive_nearly_done, rv);
        printAssert(1, tb.dircc_avalon_st_packet_receiver_inst_packet_valid, rv);

        printSuccess(rv);
    endtask : test_stallsOnBoot

    initial begin
        repeat(100) @(posedge clk);
        $sformat(message, "%m: - Starting Tests.");
        print(VERBOSITY_INFO, message);  
        test_resetCorrect();
        test_receivePacket();
        test_receivePartialPacket();
        test_stallsOnBoot();
    end

endmodule : dircc_avalon_st_packet_receiver_test