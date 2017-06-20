

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

    generate
    
    if(NODE_TYPE == "sender") begin : generate_sender
        dircc_receive_handler_sender #(
            .ADDRESS_MEM_WIDTH(ADDRESS_MEM_WIDTH),
            .DEVICE_ID(DEVICE_ID)
        ) handler (
            .clk(clk),
            .reset_n(reset_n),
            .address(address),
            .receive_done(receive_done),
            .packet_in(packet_in),
            .packet_in_valid(packet_in_valid),
            .packet_handled(packet_handled),
            .edge_id(edge_id),
            .port_id(port_id),
            .read_state(read_state),
            .write_state(write_state),
            .write_state_valid(write_state_valid)
        );
    end else if (NODE_TYPE == "receiver") begin : generate_receiver
        dircc_receive_handler_receiver #(
            .ADDRESS_MEM_WIDTH(ADDRESS_MEM_WIDTH),
            .DEVICE_ID(DEVICE_ID)
        ) handler (
            .clk(clk),
            .reset_n(reset_n),
            .address(address),
            .receive_done(receive_done),
            .packet_in(packet_in),
            .packet_in_valid(packet_in_valid),
            .packet_handled(packet_handled),
            .edge_id(edge_id),
            .port_id(port_id),
            .read_state(read_state),
            .write_state(write_state),
            .write_state_valid(write_state_valid)
        );
    end

    endgenerate

endmodule : dircc_receive_handler