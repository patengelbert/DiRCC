
module dircc_rts_handler(
    clk,
    reset_n,

    address,

    read_state,

    rts_ready
);

    parameter ADDRESS_MEM_WIDTH = 32;
    parameter NODE_TYPE = "default";
    parameter DEVICE_ID = 0;

    import dircc_types_pkg::*;
    import dircc_system_states_pkg::*;
    import dircc_application_pkg::*;

    input wire                      clk;
    input wire                      reset_n;

    input wire [ADDRESS_MEM_WIDTH-1:0] address;

    input device_state_t            read_state;

    output reg [31:0]               rts_ready;
    
    dev_state_t dev_state_old;

    assign dev_state_old = read_state.user_state;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            rts_ready <= 0;
        end else begin
            if (dev_state_old.count == dircc_thread_contexts[address].properties.count_limit &&
                dev_state_old.sent == 0
                && (read_state.dircc_state & DIRCC_STATE_RUNNING)
                ) begin
                rts_ready <= OUTPUT_FLAG_dev_port0;
            end else begin
                rts_ready <= 0;
            end
        end
    end

endmodule : dircc_rts_handler