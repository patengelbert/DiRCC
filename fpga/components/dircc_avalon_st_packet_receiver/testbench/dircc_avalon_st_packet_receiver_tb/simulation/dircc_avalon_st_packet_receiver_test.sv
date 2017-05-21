
`timescale 1 ps / 1 ps

module dircc_avalon_st_packet_receiver_test;
    parameter TIMEOUT = 10000;

    dircc_avalon_st_packet_receiver_tb tb();

    string message = "*uninitialized*";

    import dircc_types_pkg::*;
    import verbosity_pkg::*;

    alias reset = tb.dircc_avalon_st_packet_receiver_inst_reset_bfm_reset_reset;
    alias clk = tb.dircc_avalon_st_packet_receiver_inst_clk_bfm_clk_clk;

    event reset_asserted, reset_deasserted, receiving_done;

    always @(posedge tb.dircc_avalon_st_packet_receiver_inst_receive_done) begin
        -> receiving_done;
    end

    task automatic setupTest();
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_assert();
        tb.dircc_avalon_st_packet_receiver_inst_read_packet = 0;
        -> reset_asserted;
        repeat(10) @(posedge clk);
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_deassert();
        repeat(2) @(posedge clk);
        -> reset_deasserted;
    endtask : setupTest

    task automatic waitWithTimeout(input event ev, input int timeout);
        fork: waitWithTimeoutFork 
            begin : checkReceived
                wait(ev.triggered);
                disable waitWithTimeoutFork;
            end : checkReceived
            begin : checkTimout
                repeat(timeout) @(posedge clk);
                $sformat(message, "%m: - TEST Timeout %d", timeout);
                print(VERBOSITY_ERROR, message);  
                disable waitWithTimeoutFork;
            end : checkTimout 
        join : waitWithTimeoutFork
    endtask : waitWithTimeout

    task automatic sendPacket(packet_t packet);
        // Word 1
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.dest_addr.hw_addr);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(1);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();
        
        // Word 2
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(
            {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag, 8'b0});
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        // Word 3
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.src_addr.hw_addr);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        // Word 4
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(
            {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag, 8'b0});
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        // Word 5
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.lamport);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        // Word 6
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.data[31:0]);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        // Word 7
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.data[63:32]);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

        // Word 8
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_data(packet.data[95:64]);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_eop(1);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_avalon_st_packet_receiver_inst_input_bfm.push_transaction();

    endtask : sendPacket

    task automatic checkPacket(packet_t a, packet_t b, output bool rv);
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
            $sformat(message, "%m: - TEST ERROR: Src Flagismatch");
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

    task automatic receivePacket(output packet_t packet);
        tb.dircc_avalon_st_packet_receiver_inst_read_packet = 1;
        @(posedge tb.dircc_avalon_st_packet_receiver_inst_packet_valid);
        packet = tb.dircc_avalon_st_packet_receiver_inst_packet_data;
    endtask : receivePacket

    task automatic test_resetCorrect();
        automatic bool rv = FALSE;
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
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_assert();
        repeat(10) @(posedge clk);
        tb.dircc_avalon_st_packet_receiver_inst_reset_bfm.reset_deassert();
        repeat(10) @(posedge clk);
        assert (!tb.dircc_avalon_st_packet_receiver_inst_receive_done)
        else begin
            $sformat(message, "%m: - TEST ERROR");
            print(VERBOSITY_ERROR, message);  
        end
        sendPacket(packetToSend);
        waitWithTimeout(tb.dircc_avalon_st_packet_receiver_inst_input_bfm.signal_src_transaction_complete, TIMEOUT);

        rv = tb.dircc_avalon_st_packet_receiver_inst_input_bfm.get_transaction_queue_size() == 0 ? TRUE : FALSE;

        assert(rv == TRUE) begin
            $sformat(message, "%m: - TEST SUCCESS");
            print(VERBOSITY_INFO, message);  
        end else begin
            $sformat(message, "%m: - TEST ERROR");
            print(VERBOSITY_ERROR, message);  
        end

        $sformat(message, "%m: - Test Complete.");
        print(VERBOSITY_INFO, message);  
    endtask : test_resetCorrect

    task automatic test_receivePacket();
        automatic bool rv = FALSE;
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
        setupTest();

        sendPacket(packetToSend);
        waitWithTimeout(tb.dircc_avalon_st_packet_receiver_inst_input_bfm.signal_src_transaction_complete, TIMEOUT);

        rv = tb.dircc_avalon_st_packet_receiver_inst_input_bfm.get_transaction_queue_size() == 0 ? TRUE : FALSE;

        assert(rv == TRUE) else begin
            $sformat(message, "%m: - TEST ERROR");
            print(VERBOSITY_ERROR, message);  
        end
        
        waitWithTimeout(receiving_done, TIMEOUT);

        if(tb.dircc_avalon_st_packet_receiver_inst_receive_done) begin
            receivePacket(receivedPacket); 
            checkPacket (receivedPacket, packetToSend, rv);
        end else begin
            $sformat(message, "%m: - Packet not fully received");
            print(VERBOSITY_ERROR, message);  
            rv = FALSE;
        end

        assert(rv == TRUE) begin
            $sformat(message, "%m: - TEST SUCCESS");
            print(VERBOSITY_INFO, message);  
        end else begin
            $sformat(message, "%m: - TEST ERROR");
            print(VERBOSITY_ERROR, message);  
        end

        $sformat(message, "%m: - Test Complete.");
        print(VERBOSITY_INFO, message);  
    endtask : test_receivePacket

    initial begin
        repeat(100) @(posedge clk);
        $sformat(message, "%m: - Starting Tests.");
        print(VERBOSITY_INFO, message);  
        test_resetCorrect();
        test_receivePacket();
    end

endmodule : dircc_avalon_st_packet_receiver_test