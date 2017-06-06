
module dircc_status_register(
    clk,
    reset_n,

    mem_address,                //    mem.address
    mem_write,                  //       .write
    mem_readdata,               //       .readdata
    mem_writedata,              //       .writedata

    read_state,

    write_state,
    write_state_valid
    
);
    // Do not change these paramters!!
    parameter MEM_WIDTH = 16;
    parameter DATA_WIDTH = 32;
    parameter ADDRESS_WIDTH = 15;
    parameter DEV_MEM_WIDTH = 12;
    parameter EDGE_MEM_WIDTH = 12;

    import dircc_types_pkg::*;

    input                               clk;
    input                               reset_n;

	input	 [ADDRESS_WIDTH-1:0]	    mem_address;
	input		                        mem_write;
	output reg	[MEM_WIDTH-1:0]	        mem_readdata;
	input	    [MEM_WIDTH-1:0]	        mem_writedata;

    output device_state_t               read_state;

    input device_state_t                write_state;
    input                               write_state_valid;

    byte dev_mem [DEV_MEM_WIDTH-1:0];

    assign read_state.user_state =  write_state_valid ? write_state.user_state : {dev_mem[11], dev_mem[10], dev_mem[9],dev_mem[8],dev_mem[7],dev_mem[6],dev_mem[5],dev_mem[4]};
    assign read_state.dircc_state = write_state_valid ? write_state.dircc_state : {dev_mem[1],dev_mem[0]};
    assign read_state.dircc_state_extra = write_state_valid ? write_state.dircc_state_extra : {dev_mem[3],dev_mem[2]};

    // always_comb begin : display_changes
    //     $display("State updated");
    //     $display("DiRCC State %h", {dev_mem[1],dev_mem[0]});
    //     $display("DiRCC Extra State %h", {dev_mem[3],dev_mem[2]});
    //     $display("User State %h", {dev_mem[11], dev_mem[10], dev_mem[9],dev_mem[8],dev_mem[7],dev_mem[6],dev_mem[5],dev_mem[4]});
    // end

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            for (int i = 0; i < DEV_MEM_WIDTH; i++) begin
                dev_mem[i] <= 0;
            end
            mem_readdata <= 0;
        end else begin
            assert(!(write_state_valid && mem_write)) else $display("ERROR: write_state_valid and mem_write both set");
            if (write_state_valid) begin
                // $display("State updated internal");
                // Update existing state from internal
                {dev_mem[11], dev_mem[10], dev_mem[9],dev_mem[8],dev_mem[7],dev_mem[6],dev_mem[5],dev_mem[4]} <= write_state.user_state;
                {dev_mem[1],dev_mem[0]} <= write_state.dircc_state;
                {dev_mem[3],dev_mem[2]} <= write_state.dircc_state_extra;
            end else if (mem_write) begin
                // $display("State updated external");
                // We are writing the device data
                {dev_mem[mem_address+1], dev_mem[mem_address]} <= mem_writedata;
            end
            // Read
            // We are reading the device data
            mem_readdata <= {dev_mem[mem_address+1], dev_mem[mem_address]};

        end
    end


endmodule : dircc_status_register