
module dircc_compute_handler(
    clk,
    reset_n,

    address,

    read_state,

    write_state,
    write_state_valid
);

    parameter MEM_ADDRESS_WIDTH = 32;

    import dircc_types_pkg::*;
    import dircc_application_pkg::*;

    input wire                  clk;
    input wire                  reset_n;

    input wire [MEM_ADDRESS_WIDTH-1:0] address;

    input device_state_t         read_state;

    output device_state_t        write_state;
    output reg                  write_state_valid;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            write_state <= 0;
            write_state_valid <= 0;
        end else begin
            write_state_valid <= 0;
        end
    end

endmodule : dircc_compute_handler