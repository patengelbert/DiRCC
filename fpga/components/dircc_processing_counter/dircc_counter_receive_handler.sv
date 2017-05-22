

module dircc_receive_handler(
    clk,
    reset_n,

    receive_done,
    packet_in,
    packet_in_valid,
    packet_handled,

    read_state,

    write_state,
    write_state_valid
);

    import dircc_types_pkg::*;

    input wire                      clk;
    input wire                      reset_n;

    input wire                      receive_done;
    input packet_t                  packet_in;
    input wire                      packet_in_valid;
    output reg                      packet_handled;

    input dircc_state_t             read_state;

    output dircc_state_t            write_state;
    output reg                      write_state_valid;

    struct packed {
        bit [63:0] tick;
    } tick_msg;

    struct packed {
        bit [15:0] count;
        bit [15:0] rts;
    } dev_state;

    union {
        bit [95:0] data;
        tick_msg   formatted_data;
    } packet_data_u;

    union {
        bit [(8*`MAX_DEVICE_USER_STATE_BYTES)-1:0] data;
        dev_state formatted_data;
    } user_state_u;

    packet_data_u packet_data;

    dev_state_u dev_state_new;
    dev_state_u dev_state_old;

    assign packet_data.data = packet_in.data;
    assign dev_state_old.data = read_state.user_state;
    assign write_state.user_state = dev_state_new.data;

    assign write_state.dircc_state = read_state.dircc_state;
    assign write_state.dircc_state_extra = read_state.dircc_state_extra;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            write_state_valid <= 0;
            packet_handled <= 0;
        end else begin
            if (receive_done && packet_in_valid) begin
                dev_state_new.formatted_data.count <= dev_state_old.formatted_data.count + 1;
                dev_state_new.formatted_data.rts <= 1;
                write_state_valid <= 1;
                packet_handled <= 1;
            end else begin;
                write_state_valid <= 0;
                packet_handled <= 0;
            end
        end
    end

endmodule : dircc_counter_receive_handler