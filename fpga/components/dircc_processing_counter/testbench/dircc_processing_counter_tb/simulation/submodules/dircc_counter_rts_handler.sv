


module dircc_rts_handler(
    clk,
    reset_n,

    address,

    read_state,

    rts_ready
);

    parameter MEM_ADDRESS_WIDTH = 32;
    parameter MAX_DEVICE_USER_STATE_BYTES = 8;

    import dircc_types_pkg::*;
    import dircc_application_pkg::*;

    input wire                      clk;
    input wire                      reset_n;

    input wire [MEM_ADDRESS_WIDTH-1:0] address;

    input device_state_t            read_state;

    output reg [31:0]               rts_ready;

    typedef struct packed {
        bit [15:0] rts;
        bit [15:0] count;
    } dev_state_t;
    
    dev_state_t dev_state;

    assign dev_state = read_state.user_state[31:0];

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            rts_ready <= 0;
        end else begin
            if (dev_state.rts && 
                (dev_state.count < dircc_thread_contexts[address].graphProps.maxTime) // stillGoing
                ) begin
                rts_ready <= OUTPUT_FLAG_dev_out;
            end else begin
                rts_ready <= 0;
            end
        end
    end

endmodule : dircc_rts_handler