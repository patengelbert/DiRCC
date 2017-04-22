
`timescale 1ps/1ps

module dircc_address_gen 
#(parameter ADDRESS = 0)
(
    output wire[31:0] address_processing,
    output wire[31:0] address_routing
);

assign address_processing = ADDRESS;
assign address_routing = ADDRESS;

endmodule : dircc_address_gen