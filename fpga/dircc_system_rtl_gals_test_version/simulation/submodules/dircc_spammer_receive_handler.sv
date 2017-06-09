

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

    tick_msg_t packet_data;

    dev_state_t dev_state_new;
    dev_state_t dev_state_old;

    assign packet_data = packet_in;
    assign dev_state_old = read_state.user_state[63:0];
    assign write_state.user_state = dev_state_new;

    assign write_state.dircc_state_extra = read_state.dircc_state_extra;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            write_state_valid <= 0;
            packet_handled <= 0;
            dev_state_new <= 0;
        end else begin
            dev_state_new <= dev_state_old;
            write_state.dircc_state <= read_state.dircc_state;
            if (receive_done) begin
                // if (dircc_thread_contexts[address].devices[DEVICE_ID].properties.isSender) begin
                //     $display("%0t:THREAD %d - ERROR: Received packet even though not designated receiver", $time, (THREAD_COUNT - address - 1));
                //     write_state_valid <= 0;
                // end else begin
                //     if (packet_data.isDesignatedPacket) begin
                //     $display("%0t:THREAD %d - Received packet %d after %0t clk", $time, (THREAD_COUNT - address - 1), packet_data.id, (($time/2000)-packet_data.tick));
                //         dev_state_new.count <= dev_state_old.count + 1;
                //     end else begin
                //         dev_state_new.count <= dev_state_old.count;
                //     end
                //     write_state_valid <= 1;
                // end
                packet_handled <= 1;
            end else begin;
                write_state_valid <= 0;
                packet_handled <= 0;
            end
        end
    end

endmodule : dircc_receive_handler