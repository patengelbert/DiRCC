
`DIRCC_RTS_FLAGS_COMPUTE 0x80000000

import dircc_types_pkg::*;
import dircc_application_pkg::*;

module dircc_processing_counter (
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
    output_valid
);

    parameter BITS_PER_SYMBOL = 8;
    parameter SYMBOLS_PER_BEAT = 4;
    parameter INPUT_FIFO_DEPTH = 8;
    localparam DATA_WIDTH = BITS_PER_SYMBOL * SYMBOLS_PER_BEAT;
    localparam EMPTY_WIDTH = $clog2(SYMBOLS_PER_BEAT);


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

    wire receive_done, receive_nearly_done;
    wire sending;

    packet_t write_packet, read_packet;

    reg [31:0] lamport;

    assign packet_out_valid = packet_out_user_data_valid && packet_out_header_data_valid;

    reg write_state_valid;

    device_state_t write_state;

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

        .receive_nearly_done    (receive_nearly_done)
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

    dircc_receive_handler receive_handler (
        .clk            (clk),
        .reset_n        (reset_n),

        .receive_done   (receive_done),
        .packet_in      (packet_in),
        .packet_in_valid(packet_in_valid),
        .packet_handled (receive_handler_handled),

        .read_state                     (read_state),                                //  read_state.state

        .write_state                    (write_state_receive_handler),               //  write_state.state
        .write_state_valid              (write_state_state_valid_receive_handler),   //             .valid
    );

    dircc_rts_handler rts_handler (
        .clk            (clk),
        .reset_n        (reset_n),

        .rts_ready      (rts_ready),

        .read_state     (read_state),                       //  read_state.state

    );

    dircc_send_handler send_handler (
        .clk                            (clk),
        .reset_n                        (reset_n),

        .packet_out                     (packet_out),
        .packet_out_valid               (packet_out_user_data_valid),

        .read_state                     (read_state),                                    //  read_state.state

        .write_state                    (write_state_send_handler),                      //  write_state.state
        .write_state_valid              (write_state_state_valid_send_handler)           //             .valid
    );

    dircc_compute_handler compute_handler (
        .clk                            (clk),
        .reset_n                        (reset_n),

        .read_state                     (read_state),                                       //  read_state.state

        .write_state                    (write_state_compute_handler),                      //  write_state.state
        .write_state_valid              (write_state_state_valid_compute_handler)           //             .valid
    );

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin

            lamport <= 0;
            write_state_valid <= 0;
            packet_out_header_data_valid <= 0;
            output_valid <= 0;

        end else begin

            packet_out.lamport <= lamport;

            if (receive_handler_handled) begin
                // Update state after receive handler has processed the packet
                write_state_valid <= write_state_state_valid_receive_handler;
                write_state <= write_state_receive_handler;
            end else if ((rts_ready & ~DIRCC_RTS_FLAGS_COMPUTE) && !sending) begin
                // Send the packet
                write_state_valid <= write_state_state_valid_send_handler;
                write_state <= write_state_send_handler;
            end else begin
                // Compute
                write_state_valid <= write_state_state_valid_compute_handler;
                write_state <= write_state_compute_handler;
            end
        end
    end

    let max(a,b) = (a > b) ? a : b;
    
endmodule : dircc_processing_counter

// TODO: Add lamport
// TODO: Add multi cycle support for send, compute and rts handler