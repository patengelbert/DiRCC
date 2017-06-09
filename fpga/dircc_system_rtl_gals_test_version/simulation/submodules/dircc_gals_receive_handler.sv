

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

    temp_msg_t packet_data;

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

                if (dircc_thread_contexts[address].devices[DEVICE_ID].properties.isSender && packet_data.isDesignatedPacket) begin
                    $display("%0t:THREAD %d - ERROR: Received packet even though not designated receiver", $time, (THREAD_COUNT - address - 1));
                end else if (packet_data.isDesignatedPacket) begin
                    $display("%0t:THREAD %d - Received packet %d after %0t->%0t=%0t clk", $time, (THREAD_COUNT - address - 1), packet_data.t, packet_data.count,($time/2000), (packet_data.count-($time/2000)));
                end

                if(packet_data.t == dev_state_old.t) begin
                    $display("%0t:THREAD %d - Received packet for current time -> %d from source %d", $time, (THREAD_COUNT - address - 1), packet_data.t, (THREAD_COUNT - packet_data.source - 1));
                    dev_state_new.seenNow <= dev_state_old.seenNow + 1;
                    dev_state_new.accNow <= dev_state_old.accNow + (packet_data.temp * dircc_thread_contexts[address].devices[DEVICE_ID].sources[port_id].sourceBindings[edge_id].properties.weight);
                end else if (packet_data.t == (dev_state_old.t + 1)) begin
                    $display("%0t:THREAD %d - Received packet for next time -> %d from source %d", $time, (THREAD_COUNT - address - 1), packet_data.t, (THREAD_COUNT - packet_data.source - 1));
                    dev_state_new.seenNext <= dev_state_old.seenNext + 1;
                    dev_state_new.accNext <= dev_state_old.accNext + (packet_data.temp * dircc_thread_contexts[address].devices[DEVICE_ID].sources[port_id].sourceBindings[edge_id].properties.weight);
                end else begin
                    $display("%0t:THREAD %d - ERROR: Received packet of unknown timestamp %d from source %d", $time, (THREAD_COUNT - address - 1), packet_data.t, (THREAD_COUNT - packet_data.source - 1));
                end
                write_state_valid <= 1;
                packet_handled <= 1;

                if (dev_state_old.t == dircc_thread_contexts[address].properties.maxTime
                    && dev_state_old.seenNow + 1 == dircc_thread_contexts[address].devices[DEVICE_ID].properties.neighbourCount) begin
                    $display("%0t:THREAD %d - Woo! Device has finished", $time, (THREAD_COUNT - address - 1));
                    write_state.dircc_state <= (DIRCC_STATE_DONE | DIRCC_STATE_STOPPED);
                end
            end else begin;
                write_state_valid <= 0;
                packet_handled <= 0;
            end
        end
    end

endmodule : dircc_receive_handler