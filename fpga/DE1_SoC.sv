module DE1_SoC
(
  // Input Ports
  input CLOCK_50,
  input [0:0] KEY,

  // Output Ports
  output [7:0] LEDR

  // Inout Ports
);

  // Module Item(s)
  
  dircc_system_node_dual_external_boot u0 (
      .clk_50_clk       (CLOCK_50),       //   clk_50.clk
      .ledr_export      (LEDR[7:0]),      //     ledr.export
      .reset_50_reset_n (KEY[0])  // reset_50.reset_n
  );

endmodule
