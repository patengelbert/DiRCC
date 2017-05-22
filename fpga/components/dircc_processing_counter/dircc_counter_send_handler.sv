

module dircc_send_handler(
    clk,
    reset_n,

    packet_out,
    packet_out_valid,

    read_state,

    write_state,
    write_state_valid

);

    import dircc_types_pkg::*;
    import dircc_appplication_pkg::*;

    input wire              clk;
    input wire              reset_n;
    
    output packet_t         packet_out;
    output reg              packet_out_valid;

    input dircc_state_t     read_state;

    output dircc_state_t    write_state;
    output reg              write_state_valid;


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
    
    dev_state_u dev_state_old;
    dev_state_u dev_state_new;

    packet_data_u packet_data;

    assign dev_state_old.data = read_state.user_state;
    assign write_state.user_state = dev_state_new.data;
    assign packet_out.data = packet_data.data;

    assign packet_data.formatted_data.tick = dev_state_new.formatted_data.count;

    assign dev_state_new.formatted_data.rts = 0;
    assign dev_state_new.formatted_data.count = dev_state_old.formatted_data.count;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            packet_out_valid <= 0;
            write_state_valid <= 0;
        end else begin
            if (dev_state_old.formatted_data.rts) begin
                write_state_valid <= 1;
                packet_out_valid <= 1;
            end else begin
                packet_out_valid <= 0;
                write_state_valid <= 0;
            end
        end
    end

endmodule : dircc_send_handler