`timescale 1ns/100ps
module top;
  parameter simulation_cycle = 100;
  
  bit sys_clk;
  dircc_router_if top_if(sys_clk);
  test_read_write t(top_if);
  
  dircc_router dut(
    .clk                (top_if.clk),
    .reset_n            (top_if.reset_n),
    .address            (top_if.address),
    .in_ready           (top_if.in_ready),
    .in_valid           (top_if.in_valid),
    .in_data            (top_if.in_data),
    .in_startofpacket   (top_if.in_startofpacket),
    .in_endofpacket     (top_if.in_endofpacket),
    .in_empty           (top_if.in_empty),
    .out_ready          (top_if.out_ready),
    .out_valid          (top_if.out_valid),
    .out_data           (top_if.out_data),
    .out_channel        (top_if.out_channel),
    .out_startofpacket  (top_if.out_startofpacket),
    .out_endofpacket    (top_if.out_endofpacket),
    .out_empty          (top_if.out_empty)
  );
  
  initial begin
    $timeformat(-9, 1, "ns", 10);
    sys_clk = 0;
    forever begin
      #(simulation_cycle/2)
        sys_clk = ~sys_clk;
    end
  end
  
endmodule
    
    
    