
module dircc_compute_handler(
    clk,
    reset_n,

    address,

    read_state,

    write_state,
    write_state_valid
);

    parameter ADDRESS_MEM_WIDTH = 32;
    parameter DEVICE_ID = 0;
    parameter NODE_TYPE = "default";

    import dircc_types_pkg::*;
    import dircc_system_states_pkg::*;
    import dircc_application_pkg::*;

    input wire                  clk;
    input wire                  reset_n;

    input wire [ADDRESS_MEM_WIDTH-1:0] address;

    input device_state_t         read_state;

    output device_state_t        write_state;
    output reg                   write_state_valid;
    
    dev_state_t dev_state_old;
    dev_state_t dev_state_new;

    assign dev_state_old = read_state.user_state;

    assign write_state.dircc_state = read_state.dircc_state;
    assign write_state.dircc_state_extra = read_state.dircc_state_extra;
    assign write_state.user_state = {'0, dev_state_new};


    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            dev_state_new.count <= 0;
            write_state_valid <= 0;
        end else begin
            if ((read_state.dircc_state & DIRCC_STATE_RUNNING) && 
                dev_state_old.count <= dircc_thread_contexts[address].properties.count_limit &&
                dev_state_old.sent == 0
                ) begin
                dev_state_new.count <= dev_state_old.count + 1;
                dev_state_new.accumulate <= dev_state_old.accumulate;
                dev_state_new.sent <= dev_state_old.sent;
                write_state_valid <= 1;
                $display("%0t:THREAD %d - Increased count to %d", $time, (THREAD_COUNT - address - 1), dev_state_old.count + 1);
            end else begin
                write_state_valid <= 0;
            end
        end
    end

endmodule : dircc_compute_handler