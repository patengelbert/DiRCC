

module dircc_receive_handler(
    clk,
    reset_n,

    address,

    receive_done,
    packet_in,
    packet_in_valid,
    packet_handled,

    edge_id,
    port_id,

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

    input wire                      clk;
    input wire                      reset_n;

    input wire [ADDRESS_MEM_WIDTH-1:0] address;

    input wire                      receive_done;
    input packet_data_t             packet_in;
    input wire                      packet_in_valid;
    output reg                      packet_handled;
    input wire [7:0]                edge_id;
    input wire [7:0]                port_id;

    input device_state_t            read_state;

    output device_state_t           write_state;
    output reg                      write_state_valid;

    typedef struct packed {
        bit[PACKET_DATA_WIDTH-1:0] tick;
    } tick_msg_t;

    typedef struct packed {
        bit [15:0] rts;
        bit [15:0] count;
    } dev_state_t;

    tick_msg_t packet_data;

    dev_state_t dev_state_new;
    dev_state_t dev_state_old;

    assign packet_data = packet_in;
    assign dev_state_old = read_state.user_state[31:0];
    assign write_state.user_state = {'0, dev_state_new};

    // assign write_state.dircc_state = read_state.dircc_state;
    assign write_state.dircc_state_extra = read_state.dircc_state_extra;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            write_state_valid <= 0;
            packet_handled <= 0;
            dev_state_new <= 0;
        end else begin
            write_state.dircc_state <= read_state.dircc_state;
            assert (dev_state_old.rts >= 0);
            if (receive_done) begin
                $display("Old Count: %d", dev_state_old.count);
                dev_state_new.count <= dev_state_old.count + 16'h0001;
                write_state_valid <= 1;
                if (dev_state_old.count + 16'h0001 >= dircc_thread_contexts[address].graphProps.maxTime) begin
                    $display("Woo! Device has finished");
                    write_state.dircc_state <= (DIRCC_STATE_DONE | (dev_state_old.rts ? read_state.dircc_state : DIRCC_STATE_STOPPED));
                    dev_state_new.rts <= dev_state_old.rts;
                end else begin
                    dev_state_new.rts <= dev_state_old.rts + 16'h0001;
                end
                packet_handled <= 1;
            end else begin;
                write_state_valid <= 0;
                packet_handled <= 0;
            end
        end
    end

endmodule : dircc_receive_handler