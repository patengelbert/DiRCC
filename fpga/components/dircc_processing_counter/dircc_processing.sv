
module dircc_processing (
    clk,
    reset_n,

    input_data,
    input_empty,
    input_startofpacket,
    input_endofpacket,
    input_ready,
    input_valid,

    output_data,
    output_empty,
    output_startofpacket,
    output_endofpacket,
    output_ready,
    output_valid,

    mem_address,
    mem_readdata,
    mem_write,
    mem_writedata,

    address
);

    parameter BITS_PER_SYMBOL = 8;
    parameter SYMBOLS_PER_BEAT = 4;
    parameter INPUT_FIFO_DEPTH = 8;
    localparam DATA_WIDTH = BITS_PER_SYMBOL * SYMBOLS_PER_BEAT;
    localparam EMPTY_WIDTH = $clog2(SYMBOLS_PER_BEAT);

        // Do not change these paramters!!
    parameter STATUS_MEM_WIDTH = 16;
    parameter STATUS_ADDRESS_WIDTH = 15;
    parameter STATUS_BYTE_WIDTH = 8;
    parameter STATUS_DEV_MEM_WIDTH = 12;
    parameter STATUS_EDGE_MEM_WIDTH = 12;
    parameter ADDRESS_MEM_WIDTH = 32;

    parameter RTS_READY_WIDTH = 32;
    localparam PORT_INDEX_WIDTH = $clog2(RTS_READY_WIDTH);

    parameter DEVICE_ID = 32'h0;
    parameter DIRCC_RTS_FLAGS_COMPUTE = 32'h80000000;

    parameter NODE_TYPE = "default";

    import dircc_types_pkg::*;
    import dircc_system_states_pkg::*;
    import dircc_application_pkg::*;

    input                        clk;
    input                        reset_n;
    
    input      [DATA_WIDTH-1:0]  input_data;
    input      [EMPTY_WIDTH-1:0] input_empty;
    input                        input_startofpacket;
    input                        input_endofpacket;
    input                        input_valid;
    output reg                   input_ready;

    output reg [DATA_WIDTH-1:0]  output_data;
    output reg [EMPTY_WIDTH-1:0] output_empty;
    output reg                   output_startofpacket;
    output reg                   output_endofpacket;
    output reg                   output_valid;
    input                        output_ready;

    input	 [STATUS_ADDRESS_WIDTH-1:0]	    mem_address;
    input		                            mem_write;
    output reg	[STATUS_MEM_WIDTH-1:0]	    mem_readdata;
    input	    [STATUS_MEM_WIDTH-1:0]	    mem_writedata;

    input    [ADDRESS_MEM_WIDTH-1:0] address;

    typedef enum {RECEIVE_HANDLER, SEND_HANDLER, COMPUTE_HANDLER} handler_update_t;

    wire receive_done, receive_nearly_done;
    wire sending;

    packet_t packet_in, packet_out;

    reg write_state_valid;
    wire write_state_state_valid_send_handler, write_state_state_valid_receive_handler, write_state_state_valid_compute_handler;
    device_state_t read_state, write_state, write_state_receive_handler, write_state_send_handler, write_state_compute_handler;

    lamport_t lamport;

    reg packet_out_header_data_valid, packet_out_user_data_valid;

    wire [RTS_READY_WIDTH-1:0] rts_ready_new;
    reg  [RTS_READY_WIDTH-1:0] rts_ready;

    logic [PORT_INDEX_WIDTH-1:0] port_index;
    
    wire packet_out_valid, packet_in_valid, receive_handler_handled;

    packet_data_t send_handler_packet_out_data;
    reg           send_handler_packet_out_valid; 

    reg [31:0] target_id;

    reg           booting;

    handler_update_t handler_updater;

    reg [ADDRESS_MEM_WIDTH-1:0] thread_index;

    reg [7:0] edge_id;
    wire [7:0] port_id;

    assign packet_out_valid = packet_out_user_data_valid && packet_out_header_data_valid;

    assign port_id = packet_in.dest_addr.port;

    dircc_avalon_st_packet_receiver #(
        .BITS_PER_SYMBOL(BITS_PER_SYMBOL),
        .SYMBOLS_PER_BEAT(SYMBOLS_PER_BEAT)
        ) avalon_st_in (

        .clk(clk),
        .reset_n(reset_n),

        .data           (input_data),
        .empty          (input_empty),
        .startofpacket  (input_startofpacket),
        .endofpacket    (input_endofpacket),
        .ready          (input_ready),
        .valid          (input_valid),

        .packet_valid   (packet_in_valid),
        .packet_data    (packet_in),

        .receive_nearly_done    (receive_nearly_done),
        .receive_done           (receive_done),

        .booting                (booting)
    );

    dircc_avalon_st_packet_sender #(
        .BITS_PER_SYMBOL(BITS_PER_SYMBOL),
        .SYMBOLS_PER_BEAT(SYMBOLS_PER_BEAT)
        ) avalon_st_out (

        .clk(clk),
        .reset_n(reset_n),

        .data           (output_data),
        .empty          (output_empty),
        .startofpacket  (output_startofpacket),
        .endofpacket    (output_endofpacket),
        .ready          (output_ready),
        .valid          (output_valid),

        .write_packet   (packet_out_valid),
        .packet_data    (packet_out),
        .sending        (sending)
    );

    dircc_status_register #(
        .MEM_WIDTH(STATUS_MEM_WIDTH),
        .ADDRESS_WIDTH(STATUS_ADDRESS_WIDTH),
        .DEV_MEM_WIDTH(STATUS_DEV_MEM_WIDTH),
        .EDGE_MEM_WIDTH(STATUS_EDGE_MEM_WIDTH)
        ) status_register (
        .clk                            (clk),
        .reset_n                        (reset_n),

        .mem_address                    (mem_address),
        .mem_write                      (mem_write),
        .mem_readdata                   (mem_readdata),
        .mem_writedata                  (mem_writedata),

        .read_state                     (read_state),                       //  read_state.state

        .write_state                    (write_state),                      //  write_state.state
        .write_state_valid              (write_state_valid)                 //             .valid
    );

    dircc_receive_handler #(
        .ADDRESS_MEM_WIDTH(ADDRESS_MEM_WIDTH),
        .DEVICE_ID(DEVICE_ID),
        .NODE_TYPE(NODE_TYPE)
    ) receive_handler (
        .clk            (clk),
        .reset_n        (reset_n),

        .address        (thread_index),

        .receive_done   (receive_done),
        .packet_in      (packet_in.data),
        .packet_in_valid(packet_in_valid),
        .packet_handled (receive_handler_handled),

        .port_id        (port_id),
        .edge_id        (edge_id),

        .read_state                     (read_state),                                //  read_state.state

        .write_state                    (write_state_receive_handler),               //  write_state.state
        .write_state_valid              (write_state_state_valid_receive_handler)    //             .valid
    );

    dircc_rts_handler #(
        .ADDRESS_MEM_WIDTH(ADDRESS_MEM_WIDTH),
        .DEVICE_ID(DEVICE_ID),
        .NODE_TYPE(NODE_TYPE)
    ) rts_handler (
        .clk            (clk),
        .reset_n        (reset_n),

        .address        (thread_index),

        .rts_ready      (rts_ready_new),

        .read_state     (read_state)                        //  read_state.state

    );

    dircc_send_handler #(
        .ADDRESS_MEM_WIDTH(ADDRESS_MEM_WIDTH),
        .DEVICE_ID(DEVICE_ID),
        .NODE_TYPE(NODE_TYPE)
    ) send_handler (
        .clk                            (clk),
        .reset_n                        (reset_n),

        .address                        (thread_index),

        .packet_out                     (send_handler_packet_out_data),
        .packet_out_valid               (send_handler_packet_out_valid),

        .read_state                     (read_state),                                    //  read_state.state

        .write_state                    (write_state_send_handler),                      //  write_state.state
        .write_state_valid              (write_state_state_valid_send_handler)           //             .valid
    );

    dircc_compute_handler #(
        .ADDRESS_MEM_WIDTH(ADDRESS_MEM_WIDTH),
        .DEVICE_ID(DEVICE_ID),
        .NODE_TYPE(NODE_TYPE)
    ) compute_handler (
        .clk                            (clk),
        .reset_n                        (reset_n),

        .address                        (thread_index),

        .read_state                     (read_state),                                       //  read_state.state

        .write_state                    (write_state_compute_handler),                      //  write_state.state
        .write_state_valid              (write_state_state_valid_compute_handler)           //             .valid
    );

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin

            lamport <= 0;
            packet_out_header_data_valid <= 0;
            packet_out_user_data_valid <= 0;
            rts_ready <= 0;
            target_id <= 0;

            edge_id <= 0;

            // This will be picked up on the first non-reset clk cycle
            write_state <= '{
                dircc_state : DIRCC_STATE_BOOTED,
                dircc_state_extra : '0,
                user_state : '0
            };
            write_state_valid <= 1;
            booting <= 1;

        end else begin

            packet_out_header_data_valid <= 0;
            write_state_valid <= 0;

            if (receive_done) begin
                // update lamport on receive, before handler
                $display("%0t:THREAD %d - Read packet from %d. Lamport : %d for state %d", $time, thread_index, packet_in.src_addr.hw_addr, packet_in.lamport, read_state.dircc_state);
                lamport <= ((lamport > packet_in.lamport) ? lamport : packet_in.lamport) + 1;
                assert(packet_in_valid && packet_in.dest_addr == '{
                    hw_addr: address,
                    sw_addr: DEVICE_ID,
                    port: 0,
                    flag: 0
                }) else $display("%0t:THREAD %d - ERROR: Received unexpected packet to %d:%d:%d:%d", $time, thread_index,
                    packet_in.dest_addr.hw_addr, packet_in.dest_addr.sw_addr, packet_in.dest_addr.port, packet_in.dest_addr.flag);
            end


            if (rts_ready && !sending && !packet_out_valid) begin
                // Send next outstanding packet

                // Get the correct output header
                packet_out.dest_addr <= dircc_thread_contexts[thread_index].devices[DEVICE_ID].targets[port_index].targets[target_id];
                packet_out_header_data_valid <= 1;

                packet_out.src_addr <= '{
                    hw_addr: address,
                    sw_addr: DEVICE_ID,
                    port: port_index,
                    flag: 0
                };
                $display("%0t:THREAD %0d - Sent packet through port %0d to target %0d", $time, thread_index, port_index, dircc_thread_contexts[thread_index].devices[DEVICE_ID].targets[port_index].targets[target_id].hw_addr);

                if (dircc_thread_contexts[thread_index].devices[DEVICE_ID].targets[port_index].numTargets - target_id != 1) begin
                    // There are still targets to send to
                    $display("%0t:THREAD %0d - %0d packets left to send", $time, thread_index, dircc_thread_contexts[thread_index].devices[DEVICE_ID].targets[port_index].numTargets - target_id - 1);
                    target_id <= target_id + 1;
                end else begin
                    $display("%0t:THREAD %0d - No packets left to send", $time, thread_index);
                    // Clear flag for sent target
                    rts_ready <= 0;
                end
            end

            if (read_state.dircc_state & DIRCC_STATE_RUNNING) begin

                booting <= 0;
                // We are running
                if (receive_handler_handled) begin
                    // Update state after receive handler has processed the packet

                    $display("%0t:THREAD %0d - Calling receive handler", $time, thread_index);
                    write_state_valid <= write_state_state_valid_receive_handler;
                    write_state <= write_state_receive_handler;

                end else if (rts_ready_new && !rts_ready && !packet_out_valid) begin
                    // We have sent all outstanding packets
                    // Run the send handler once
                    rts_ready <= rts_ready_new & ~DIRCC_RTS_FLAGS_COMPUTE;

                    $display("%0t:THREAD %0d - Calling send handler", $time, thread_index);

                    lamport <= lamport + 1;
                    write_state_valid <= write_state_state_valid_send_handler;
                    write_state <= write_state_send_handler;

                    // Store data for all outgoing packets
                    packet_out.data <= send_handler_packet_out_data;
                    packet_out_user_data_valid <= send_handler_packet_out_valid;
                    packet_out.lamport <= lamport + 1;

                    // Set initial target
                    target_id <= 0;
                end else begin
                    // Compute

                    write_state_valid <= write_state_state_valid_compute_handler;
                    write_state <= write_state_compute_handler;

                end
            end else if (read_state.dircc_state & (DIRCC_STATE_DISABLED | DIRCC_STATE_STOPPED)) begin

                booting <= 0;
                // Swallow all packets and throw error if any received
                write_state.dircc_state <= (read_state.dircc_state | DIRCC_STATE_ERROR);
                write_state_valid <= receive_done;
                if (receive_done) begin
                    // Show error on received packet
                    $display("%m:THREAD %0d - ERROR: Received unextpected packet to %d:%d:%d:%d", $time,
                    packet_in.dest_addr.hw_addr, packet_in.dest_addr.sw_addr, packet_in.dest_addr.port, packet_in.dest_addr.flag);
                end
            end
        end
    end

    always_comb begin : select_thread_index
        thread_index = 'x;
        for (int i = 0; i < THREAD_COUNT; i++) begin
            if (dircc_thread_contexts[i].threadId == address) begin
                thread_index = i[ADDRESS_MEM_WIDTH-1:0];
                $display("%0t:Using thread index %0d for address %0d", $time, thread_index, address);
            end
        end
    end : select_thread_index

    always_comb begin : right_most_one
        port_index='0;
        
        // We do not care about the last bit
        // This is the compute flag
        for (int i=RTS_READY_WIDTH-2; i >= 0; i--) begin
            if (rts_ready[i]) begin
                port_index = i[PORT_INDEX_WIDTH-1:0];
            end
        end
    end : right_most_one
    
endmodule : dircc_processing

// TODO: Add multi cycle support for send, compute and rts handler