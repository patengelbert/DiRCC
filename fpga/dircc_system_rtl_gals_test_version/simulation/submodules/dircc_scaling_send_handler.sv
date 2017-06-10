

module dircc_send_handler(
    clk,
    reset_n,

    address,

    packet_out,
    packet_out_valid,

    read_state,

    write_state,
    write_state_valid

);

    parameter ADDRESS_MEM_WIDTH = 32;
    parameter NODE_TYPE = "default";
    parameter DEVICE_ID = 0;

    import dircc_types_pkg::*;
    import dircc_system_states_pkg::*;
    import dircc_application_pkg::*;

    input wire                          clk;
    input wire                          reset_n;

    input wire [ADDRESS_MEM_WIDTH-1:0]  address;
    
    output packet_data_t                packet_out;
    output reg                          packet_out_valid;

    input device_state_t                read_state;

    output device_state_t               write_state;
    output reg                          write_state_valid;
    
    dev_state_t dev_state_old;
    dev_state_t dev_state_new;

    tick_msg_t packet_data;

    assign dev_state_old = read_state.user_state;
    assign packet_out = packet_data;

    assign write_state.dircc_state = read_state.dircc_state;
    assign write_state.dircc_state_extra = read_state.dircc_state_extra;
    assign write_state.user_state = {'0, dev_state_new};

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            packet_out_valid <= 0;
            write_state_valid <= 0;
        end else begin
            dev_state_new.count <= dev_state_old.count;
            dev_state_new.accumulate <= dev_state_old.accumulate;
            dev_state_new.sent <= 1'b1;
            packet_data.count <= dev_state_old.count;
            packet_data.source <= (THREAD_COUNT - address - 1);
            packet_out_valid <= 1;
            
            write_state_valid <= 1;
        end
    end

endmodule : dircc_send_handler