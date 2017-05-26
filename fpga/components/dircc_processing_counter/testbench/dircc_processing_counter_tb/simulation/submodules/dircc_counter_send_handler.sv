

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


    typedef struct packed {
        bit[PACKET_DATA_WIDTH-1:0] tick;
    } tick_msg_t;

    typedef struct packed {
        bit [15:0] rts;
        bit [15:0] count;
    } dev_state_t;
    
    dev_state_t dev_state_old;
    dev_state_t dev_state_new;

    tick_msg_t packet_data;

    assign dev_state_old = read_state.user_state[31:0];
    assign packet_out = packet_data;

    assign packet_data.tick = {'0, dev_state_new.count};

    assign dev_state_new.count = dev_state_old.count;

    assign write_state.dircc_state_extra = read_state.dircc_state_extra;
    assign write_state.user_state = {'0, dev_state_new};

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            packet_out_valid <= 0;
            write_state_valid <= 0;
        end else begin
            assert (dev_state_old.rts >= 0);
            if (dev_state_old.rts) begin
                write_state.dircc_state <= read_state.dircc_state;
                write_state_valid <= 1;
                packet_out_valid <= 1;
                dev_state_new.rts <= dev_state_old.rts - 16'h0001;
                if (dev_state_old.rts - 1 == 0 && read_state.dircc_state & DIRCC_STATE_DONE) begin
                    // We have finished and transmitted all p=outstanding packets
                    write_state.dircc_state <= (DIRCC_STATE_DONE | DIRCC_STATE_STOPPED);
                end
            end else begin
                packet_out_valid <= 0;
                write_state_valid <= 0;
            end
        end
    end

endmodule : dircc_send_handler