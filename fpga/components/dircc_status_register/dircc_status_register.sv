
module dircc_status_register(
    clk,
    reset_n,

    mem_address,     //              mem.address
    mem_write,       //                 .write
    mem_readdata,    //                 .readdata
    mem_writedata,   //                 .writedata
);
    // Do not change these paramters!!
    parameter MEM_WIDTH = 16;
    parameter DATA_WIDTH = 32;
    parameter ADDRESS_WIDTH = 15;
    parameter BYTE_WIDTH = 8;
    parameter DEV_MEM_WIDTH = 12;
    parameter EDGE_MEM_WIDTH = 12;

    input clk;
    input reset_n;

	input	 [ADDRESS_WIDTH-1:0]	mem_address;
	input		                    mem_write;
	output reg	[MEM_WIDTH-1:0]	    mem_readdata;
	input	    [MEM_WIDTH-1:0]	    mem_writedata;

    reg [BYTE_WIDTH-1:0] dev_mem [DEV_MEM_WIDTH-1:0];

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            for (int i = 0; i < DEV_MEM_WIDTH; i++) begin
                dev_mem[i] <= 0;
            end
            mem_readdata <= 0;
        end else begin
            if(mem_write) begin
                // We are writing the device data
                {dev_mem[mem_address+1], dev_mem[mem_address]} <= mem_writedata;
            end
            // Read
            // We are reading the device data
            mem_readdata <= {dev_mem[mem_address+1], dev_mem[mem_address]};
        end
    end

    task getDevUserState(output bit[(BYTE_WIDTH*8)-1:0] rv);
        rv = {dev_mem[11], dev_mem[10], dev_mem[9],dev_mem[8],dev_mem[7],dev_mem[6],dev_mem[5],dev_mem[4]};
    endtask : getDevUserState

    task getDirccState(output bit[(BYTE_WIDTH*2)-1:0] rv);
        rv = {dev_mem[1],dev_mem[0]};
    endtask : getDirccState

    task getDirccExtraState(output bit[(BYTE_WIDTH*2)-1:0] rv);
        rv = {dev_mem[3],dev_mem[2]};
    endtask : getDirccExtraState

    task setDirccState(input bit[(BYTE_WIDTH*2)-1:0] state, input bit[(BYTE_WIDTH*2)-1:0] extraData);
        {dev_mem[1],dev_mem[0]} |= state;
        {dev_mem[3],dev_mem[2]} = extraData;
    endtask : setDirccState

    task setExclusiveDirccState(input bit[(BYTE_WIDTH*2)-1:0] state, input bit[(BYTE_WIDTH*2)-1:0] extraData);
        {dev_mem[1],dev_mem[0]} = state;
        {dev_mem[3],dev_mem[2]} = extraData;
    endtask : setExclusiveDirccState


endmodule : dircc_status_register