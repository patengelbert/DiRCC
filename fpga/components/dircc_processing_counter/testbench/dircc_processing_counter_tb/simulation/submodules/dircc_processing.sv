
`define DIRCC_RTS_FLAGS_COMPUTE 'h80000000
`define DEVICE_ID 0

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
    parameter MEM_WIDTH = 16;
    parameter ADDRESS_WIDTH = 15;
    parameter BYTE_WIDTH = 8;
    parameter DEV_MEM_WIDTH = 12;
    parameter EDGE_MEM_WIDTH = 12;
    parameter MEM_ADDRESS_WIDTH = 32;

    import dircc_types_pkg::*;
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

    input	 [ADDRESS_WIDTH-1:0]	    mem_address;
    input		                        mem_write;
    output reg	[MEM_WIDTH-1:0]	        mem_readdata;
    input	    [MEM_WIDTH-1:0]	        mem_writedata;

    input    [MEM_ADDRESS_WIDTH-1:0] address;

    wire receive_done, receive_nearly_done;
    wire sending;

    packet_t packet_in, packet_out;

    reg write_state_valid;
    wire write_state_state_valid_send_handler, write_state_state_valid_receive_handler, write_state_state_valid_compute_handler;
    device_state_t read_state, write_state, write_state_receive_handler, write_state_send_handler, write_state_compute_handler;

    reg [31:0] lamport;

    reg packet_out_header_data_valid, packet_out_user_data_valid;

    wire [31:0] rts_ready_new;
    reg  [31:0] rts_ready;

    logic [4:0] port_index;
    
    wire packet_out_valid, packet_in_valid, receive_handler_handled;

    reg [95:0] send_handler_packet_out_data;
    reg        send_handler_packet_out_valid; 

    reg [31:0] target_id;

    assign packet_out_valid = packet_out_user_data_valid && packet_out_header_data_valid;

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
        .receive_done           (receive_done)
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

    dircc_status_register status_register (
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
        .MEM_ADDRESS_WIDTH(MEM_ADDRESS_WIDTH)
    ) receive_handler (
        .clk            (clk),
        .reset_n        (reset_n),

        .address        (address),

        .receive_done   (receive_done),
        .packet_in      (packet_in.data),
        .packet_in_valid(packet_in_valid),
        .packet_handled (receive_handler_handled),

        .read_state                     (read_state),                                //  read_state.state

        .write_state                    (write_state_receive_handler),               //  write_state.state
        .write_state_valid              (write_state_state_valid_receive_handler)    //             .valid
    );

    dircc_rts_handler #(
        .MEM_ADDRESS_WIDTH(MEM_ADDRESS_WIDTH)
    ) rts_handler (
        .clk            (clk),
        .reset_n        (reset_n),

        .address        (address),

        .rts_ready      (rts_ready_new),

        .read_state     (read_state)                        //  read_state.state

    );

    dircc_send_handler #(
        .MEM_ADDRESS_WIDTH(MEM_ADDRESS_WIDTH)
    ) send_handler (
        .clk                            (clk),
        .reset_n                        (reset_n),

        .address                        (address),

        .packet_out                     (send_handler_packet_out_data),
        .packet_out_valid               (send_handler_packet_out_valid),

        .read_state                     (read_state),                                    //  read_state.state

        .write_state                    (write_state_send_handler),                      //  write_state.state
        .write_state_valid              (write_state_state_valid_send_handler)           //             .valid
    );

    dircc_compute_handler #(
        .MEM_ADDRESS_WIDTH(MEM_ADDRESS_WIDTH)
    ) compute_handler (
        .clk                            (clk),
        .reset_n                        (reset_n),

        .address                        (address),

        .read_state                     (read_state),                                       //  read_state.state

        .write_state                    (write_state_compute_handler),                      //  write_state.state
        .write_state_valid              (write_state_state_valid_compute_handler)           //             .valid
    );


    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin

            lamport <= 0;
            write_state_valid <= 0;
            packet_out_header_data_valid <= 0;
            packet_out_user_data_valid <= 0;
            rts_ready <= 0;
            target_id <= 0;

        end else begin

            packet_out_header_data_valid <= 0;

            if (receive_done) begin
                // update lamport on receive, before handler
                lamport <= ((lamport > packet_in.lamport) ? lamport : packet_in.lamport) + 1;
            end


            if (rts_ready && !sending && !packet_out_valid) begin
                // Send next outstanding packet

                // Get the correct output header
                packet_out.dest_addr <= dircc_thread_contexts[address].devices[`DEVICE_ID].targets[port_index].targets[target_id];
                packet_out_header_data_valid <= 1;
                packet_out.lamport <= lamport;

                packet_out.src_addr <= '{
                    hw_addr: address,
                    sw_addr: `DEVICE_ID,
                    port: port_index,
                    flag: 0
                };
                $display("Sent packet through port %d to target %d", port_index, target_id);

                if (dircc_thread_contexts[address].devices[`DEVICE_ID].targets[port_index].numTargets - target_id != 1) begin
                    // There are still targets to send to
                    target_id <= target_id + 1;
                end else begin
                    // Clear flag for sent target
                    rts_ready <= 0;
                end
            end


            if (receive_handler_handled) begin
                // Update state after receive handler has processed the packet

                $display("Calling receive handler");
                write_state_valid <= write_state_state_valid_receive_handler;
                write_state <= write_state_receive_handler;

            end else if (rts_ready_new && !rts_ready && !packet_out_valid) begin
                // We have sent all outstanding packets
                // Run the send handler once
                rts_ready <= rts_ready_new & ~`DIRCC_RTS_FLAGS_COMPUTE;

                $display("Calling send handler");

                lamport <= lamport + 1;
                write_state_valid <= write_state_state_valid_send_handler;
                write_state <= write_state_send_handler;

                // Store data for all outgoing packets
                packet_out <= send_handler_packet_out_data;
                packet_out_user_data_valid <= send_handler_packet_out_valid;

                // Set initial target
                target_id <= 0;
            end else begin
                // Compute

                write_state_valid <= write_state_state_valid_compute_handler;
                write_state <= write_state_compute_handler;

            end
        end
    end

    always_comb begin : right_most_one
        port_index='0;
        
        // We do not care about the last bit
        // This is the compute flag
        for (int i=30; i >= 0; i--) begin
            if (rts_ready[i]) begin
                port_index = i[4:0];
            end
        end
    end : right_most_one
    
endmodule : dircc_processing

// TODO: Add multicast messages
// TODO: Add multi cycle support for send, compute and rts handler