
module dircc_status_register(
    clk,
    reset_n,

    mem_address,                //    mem.address
    mem_write,                  //       .write
    mem_readdata,               //       .readdata
    mem_writedata,              //       .writedata

    state_user_state,           //  state.user_state
    state_dircc_state,          //       .dircc_state
    state_dircc_extra_state,    //       .extra_state

    write_state_user_state,           //  write_state.user_state
    write_state_dircc_state,          //             .dircc_state
    write_state_dircc_extra_state,    //             .extra_state
    write_state_valid                 //             .valid
    
);
    // Do not change these paramters!!
    parameter MEM_WIDTH = 16;
    parameter DATA_WIDTH = 32;
    parameter ADDRESS_WIDTH = 15;
    parameter BYTE_WIDTH = 8;
    parameter DEV_MEM_WIDTH = 12;
    parameter EDGE_MEM_WIDTH = 12;

    input                               clk;
    input                               reset_n;

	input	 [ADDRESS_WIDTH-1:0]	    mem_address;
	input		                        mem_write;
	output reg	[MEM_WIDTH-1:0]	        mem_readdata;
	input	    [MEM_WIDTH-1:0]	        mem_writedata;

    output wire  [(BYTE_WIDTH*8)-1:0]   state_user_state;
    output wire  [(BYTE_WIDTH*2)-1:0]   state_dircc_state;
    output wire  [(BYTE_WIDTH*2)-1:0]   state_dircc_extra_state;

    input wire  [(BYTE_WIDTH*8)-1:0]    write_state_user_state;
    input wire  [(BYTE_WIDTH*2)-1:0]    write_state_dircc_state;
    input wire  [(BYTE_WIDTH*2)-1:0]    write_state_dircc_extra_state;

    input                               write_state_valid;

    reg [BYTE_WIDTH-1:0] dev_mem [DEV_MEM_WIDTH-1:0];

    assign state_user_state = {dev_mem[11], dev_mem[10], dev_mem[9],dev_mem[8],dev_mem[7],dev_mem[6],dev_mem[5],dev_mem[4]};
    assign state_dircc_state = {dev_mem[1],dev_mem[0]};
    assign state_dircc_extra_state = {dev_mem[3],dev_mem[2]};

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            for (int i = 0; i < DEV_MEM_WIDTH; i++) begin
                dev_mem[i] <= 0;
            end
            mem_readdata <= 0;
        end else begin
            if (write_state_valid) begin
                // Update existing state from internal
                {dev_mem[11], dev_mem[10], dev_mem[9],dev_mem[8],dev_mem[7],dev_mem[6],dev_mem[5],dev_mem[4]} <= write_state_user_state;
                {dev_mem[1],dev_mem[0]} <= write_state_dircc_state;
                {dev_mem[3],dev_mem[2]} <= write_state_dircc_extra_state;
            end else if(mem_write) begin
                // We are writing the device data
                {dev_mem[mem_address+1], dev_mem[mem_address]} <= mem_writedata;
            end
            // Read
            // We are reading the device data
            mem_readdata <= {dev_mem[mem_address+1], dev_mem[mem_address]};

        end
    end


endmodule : dircc_status_register