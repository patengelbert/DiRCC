
`timescale 1 ps / 1 ps

module dircc_routing_test;
    parameter TIMEOUT = 1000000000;

    event setup_done, reset_asserted, reset_deasserted;
    
    dircc_routing_tb tb();

    initial
        $error("Not yet implemented");

endmodule : dircc_routing_test