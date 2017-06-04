
`timescale 1 ps / 1 ps

import verbosity_pkg::*;
import dircc_types_pkg::*;

module dircc_router_test();
    parameter TIMEOUT = 1000000000;

    event setup_done, reset_asserted, reset_deasserted;

    dircc_router_tb tb();

    alias clk = tb.dircc_router_inst_clk_bfm_clk_clk;
    alias reset_n = tb.dircc_router_inst_reset_bfm_reset_reset;

    task automatic setupTest();
        tb.dircc_router_inst_reset_bfm.reset_assert();
        tb.dircc_router_inst_address = 32'h00010001;
        ->reset_asserted;
        repeat(10) @(posedge clk);
        tb.dircc_router_inst_reset_bfm.reset_deassert();
        tb.dircc_router_inst_output_bfm.set_ready(1);
        repeat(2) @(posedge clk);
        ->reset_deasserted;
    endtask : setupTest

    task automatic waitForResponse(input event ev, input int timeout, inout bool rv);
        fork: WaitWithTimeout 
            begin : checkReceived
                wait(ev.triggered); 
                rv = TRUE;
                disable WaitWithTimeout;
            end : checkReceived
            begin : checkTimout
                repeat(timeout) @(posedge clk);
                $sformat(message, "%m: - TEST Timeout %d", timeout);
                rv = FALSE;
                print(VERBOSITY_ERROR, message);  
                disable WaitWithTimeout;
            end : checkTimout 
        join : WaitWithTimeout
        // Prevent this from happening multiple times in the same clock cycle
        @(posedge clk);
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

    task automatic printAssert(input longint a, input longint b, inout bool rv);
        assert(a == b)
        else begin
            rv = FALSE;
            $sformat(message, "%m: - Expected: %d. Got %d", a, b);
            print(VERBOSITY_ERROR, message);
        end

    endtask

    task automatic sendPacket(packet_t packet, int startPacket, int endPacket);

        if (startPacket <= 0 && endPacket >= 0) begin
        // Word 1
        tb.dircc_router_inst_input_bfm.set_transaction_data(packet.dest_addr.hw_addr);
        tb.dircc_router_inst_input_bfm.set_transaction_sop(1);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end
        
        if (startPacket <= 1 && endPacket >= 1) begin
        // Word 2
        tb.dircc_router_inst_input_bfm.set_transaction_data(
            {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag, 8'b0});
        tb.dircc_router_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 2 && endPacket >= 2) begin

        // Word 3
        tb.dircc_router_inst_input_bfm.set_transaction_data(packet.src_addr.hw_addr);
        tb.dircc_router_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 3 && endPacket >= 3) begin

        // Word 4
        tb.dircc_router_inst_input_bfm.set_transaction_data(
            {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag, 8'b0});
        tb.dircc_router_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end 

        if (startPacket <= 4 && endPacket >= 4) begin

        // Word 5
        tb.dircc_router_inst_input_bfm.set_transaction_data(packet.lamport);
        tb.dircc_router_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 5 && endPacket >= 5) begin

        // Word 6
        tb.dircc_router_inst_input_bfm.set_transaction_data(packet.data[31:0]);
        tb.dircc_router_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 6 && endPacket >= 6) begin

        // Word 7
        tb.dircc_router_inst_input_bfm.set_transaction_data(packet.data[63:32]);
        tb.dircc_router_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end

        if (startPacket <= 7 && endPacket >= 7) begin

        // Word 8
        tb.dircc_router_inst_input_bfm.set_transaction_data(packet.data[95:64]);
        tb.dircc_router_inst_input_bfm.set_transaction_sop(0);
        tb.dircc_router_inst_input_bfm.set_transaction_eop(1);
        tb.dircc_router_inst_input_bfm.set_transaction_empty(0);
        tb.dircc_router_inst_input_bfm.push_transaction();

        end

        $sformat(message, "%m: - Sent %d words", endPacket - startPacket + 1);
        print(VERBOSITY_INFO, message);

    endtask : sendPacket

    task automatic receivePacket(output packet_t packet, input int expected_channel, inout bool rv);

        assert(tb.dircc_router_inst_output_bfm.get_transaction_queue_size() >= 8) else begin
            $sformat(message, "%m: - TEST ERROR: Only %d/%d words received", tb.dircc_router_inst_output_bfm.get_transaction_queue_size(), 8);
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 1
        tb.dircc_router_inst_output_bfm.pop_transaction();
        packet.dest_addr.hw_addr = tb.dircc_router_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 1
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 0 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        
        // Word 2
        tb.dircc_router_inst_output_bfm.pop_transaction();
        {packet.dest_addr.sw_addr, packet.dest_addr.port, packet.dest_addr.flag} = 
        tb.dircc_router_inst_output_bfm.get_transaction_data()[31:8];
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 1 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 3
        tb.dircc_router_inst_output_bfm.pop_transaction();
        packet.src_addr.hw_addr = tb.dircc_router_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 2 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 4
        tb.dircc_router_inst_output_bfm.pop_transaction();
        {packet.src_addr.sw_addr, packet.src_addr.port, packet.src_addr.flag} = 
        tb.dircc_router_inst_output_bfm.get_transaction_data()[31:8];
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 3 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 5
        tb.dircc_router_inst_output_bfm.pop_transaction();
        packet.lamport = tb.dircc_router_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 4 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 6
        tb.dircc_router_inst_output_bfm.pop_transaction();
        packet.data[31:0] = tb.dircc_router_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 5 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end

        // Word 7
        tb.dircc_router_inst_output_bfm.pop_transaction();
        packet.data[63:32] = tb.dircc_router_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 6 Metadata mismatch");
            print(VERBOSITY_ERROR, message);
            rv = FALSE;
        end
        // Word 8
        tb.dircc_router_inst_output_bfm.pop_transaction();
        packet.data[95:64] = tb.dircc_router_inst_output_bfm.get_transaction_data();
        assert (tb.dircc_router_inst_output_bfm.get_transaction_sop() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_eop() == 1
                && tb.dircc_router_inst_output_bfm.get_transaction_empty() == 0
                && tb.dircc_router_inst_output_bfm.get_transaction_channel() == expected_channel)
        else begin
            $sformat(message, "%m: - TEST ERROR: Word 7 Metadata mismatch %d != %d", tb.dircc_router_inst_output_bfm.get_transaction_sop(), 0);
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

    task automatic test_correctOutputChannel();
        automatic bool rv = TRUE;
        automatic packet_t packet_out;
        automatic packet_t packetsToSend[$] = '{
            '{
                dest_addr: '{
                    hw_addr: 32'h00010001,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00010002,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00000001,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00020001,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            }
        };

        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);

        setupTest();

        for (int i=0; i < 5; i++) begin
            sendPacket(packetsToSend[i], 0, 7);
            repeat(10) @(posedge clk);
        end

        // 3 Clock cycles input packet -> state change
        // -1 as waitForResponse has 1 included
        repeat(10) @(posedge clk);
        

        $sformat(message,  "%m: -  Checking packet 0");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 0, rv);
        checkPacket(packet_out, packetsToSend[0], rv);
        
        $sformat(message,  "%m: -  Checking packet 1");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 3, rv);
        checkPacket(packet_out, packetsToSend[1], rv);
        
        $sformat(message,  "%m: -  Checking packet 2");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 4, rv);
        checkPacket(packet_out, packetsToSend[2], rv);
        
        $sformat(message,  "%m: -  Checking packet 3");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 1, rv);
        checkPacket(packet_out, packetsToSend[3], rv);
        
        $sformat(message,  "%m: -  Checking packet 4");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 2, rv);
        checkPacket(packet_out, packetsToSend[4], rv);

        printSuccess(rv);
    endtask : test_correctOutputChannel

    task automatic test_backPressure();
        automatic bool rv;
        automatic packet_t packet_out;
        automatic packet_t packetsToSend[$] = '{
            '{
                dest_addr: '{
                    hw_addr: 32'h00010001,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00010002,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00000001,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            },
            '{
                dest_addr: '{
                    hw_addr: 32'h00020001,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                src_addr: '{
                    hw_addr: 32'h00010000,
                    sw_addr: 0,
                    port: 0,
                    flag: 0
                },
                lamport: 1,
                data: $random
            }
        };

        $sformat(message,  "%m: -  Starting Test %m");
        print(VERBOSITY_INFO, message);

        setupTest();

        for (int i=0; i < 5; i++) begin
            sendPacket(packetsToSend[i], 0, 7);
        end
        repeat(20) @(posedge clk);

        tb.dircc_router_inst_output_bfm.set_ready(0);

        repeat(10) @(posedge clk);
        

        $sformat(message,  "%m: -  Checking packet 0");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 0, rv);
        checkPacket(packet_out, packetsToSend[0], rv);
        
        $sformat(message,  "%m: -  Checking packet 1");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 3, rv);
        checkPacket(packet_out, packetsToSend[1], rv);

        tb.dircc_router_inst_output_bfm.set_ready(1);

        waitForResponse(tb.dircc_router_inst_input_bfm.signal_src_transaction_complete, TIMEOUT, rv);
        repeat(10) @(posedge clk);

        $sformat(message,  "%m: -  Checking packet 2");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 4, rv);
        checkPacket(packet_out, packetsToSend[2], rv);
        
        $sformat(message,  "%m: -  Checking packet 3");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 1, rv);
        checkPacket(packet_out, packetsToSend[3], rv);

        $sformat(message,  "%m: -  Checking packet 4");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 2, rv);
        checkPacket(packet_out, packetsToSend[4], rv);

        sendPacket(packetsToSend[0], 0, 7);
        waitForResponse(tb.dircc_router_inst_input_bfm.signal_src_transaction_complete, TIMEOUT, rv);
        repeat(1) @(posedge clk);

        $sformat(message,  "%m: -  Checking packet 5");
        print(VERBOSITY_INFO, message);
        receivePacket(packet_out, 0, rv);
        checkPacket(packet_out, packetsToSend[0], rv);

        printSuccess(rv);
    endtask : test_backPressure

    initial begin
        repeat(100) @(posedge clk);
        test_correctOutputChannel();
        test_backPressure();
    end

endmodule : dircc_router_test
