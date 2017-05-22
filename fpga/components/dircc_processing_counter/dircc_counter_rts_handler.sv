

module dircc_rts_handler(
    clk,
    reset_n,

    read_state,

    rts_ready
);

    import dircc_types_pkg::*;
    import dircc_application_pkg::*;

    input wire                      clk;
    input wire                      reset_n;

    input dircc_state_t             read_state;

    output reg                      rts_ready;

    struct packed {
        bit [15:0] count;
        bit [15:0] rts;
    } dev_state;

    union {
        bit [(8*`MAX_DEVICE_USER_STATE_BYTES)-1:0] data;
        dev_state formatted_data;
    } user_state_u;
    
    dev_state_u dev_state;
    assign dev_state.data = read_state.user_state;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            rts_ready <= 0;
        end else begin
            if (dev_state.formatted_data.rts && 
                (dev_state.data.count < inst_props.max_time) // stillGoing
                ) begin
                rts_ready <= OUTPUT_FLAG_dev_out;
            end else begin
                rts_ready <= 0;
            end
        end
    end

endmodule : dircc_counter_receive_handler