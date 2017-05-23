

module dircc_receive_handler(
    clk,
    reset_n,

    address,

    receive_done,
    packet_in,
    packet_in_valid,
    packet_handled,

    read_state,

    write_state,
    write_state_valid
);

    parameter MEM_ADDRESS_WIDTH = 32;
    parameter MAX_DEVICE_USER_STATE_BYTES = 8;

    import dircc_types_pkg::*;
    import dircc_application_pkg::*;

    input wire                      clk;
    input wire                      reset_n;

    input wire [MEM_ADDRESS_WIDTH-1:0] address;

    input wire                      receive_done;
    input wire [95:0]               packet_in;
    input wire                      packet_in_valid;
    output reg                      packet_handled;

    input device_state_t            read_state;

    output device_state_t           write_state;
    output reg                      write_state_valid;

    typedef struct packed {
        bit [63:0] tick;
    } tick_msg_t;

    typedef struct packed {
        bit [15:0] rts;
        bit [15:0] count;
    } dev_state_t;

    tick_msg_t packet_data;

    dev_state_t dev_state_new;
    dev_state_t dev_state_old;

    assign packet_data = packet_in[63:0];
    assign dev_state_old = read_state.user_state[31:0];
    assign write_state.user_state = {'0, dev_state_new};

    assign write_state.dircc_state = read_state.dircc_state;
    assign write_state.dircc_state_extra = read_state.dircc_state_extra;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            write_state_valid <= 0;
            packet_handled <= 0;
        end else begin
            if (receive_done && packet_in_valid) begin
                dev_state_new.count <= dev_state_old.count + 16'h0001;
                dev_state_new.rts <= 1;
                write_state_valid <= 1;
                packet_handled <= 1;
            end else begin;
                write_state_valid <= 0;
                packet_handled <= 0;
            end
        end
    end

endmodule : dircc_receive_handler