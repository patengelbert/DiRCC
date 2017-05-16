`timescale 1ns/100ps
interface dircc_router_if (input clk);

  logic reset_n;
  logic[7:0] address;

  logic in_ready;
  logic in_valid;
  logic[7:0] in_data;
  logic in_startofpacket;
  logic in_endofpacket;
  logic in_empty;

  logic out_ready;
  logic out_valid;
  logic[7:0] out_data;
  logic out_startofpacket;
  logic out_endofpacket;
  logic[2:0] out_channel;
  logic out_empty;

  clocking cb @(posedge clk);
    default input #1 output #1;
    output reset_n;

    input  in_ready;
    output in_valid;
    output in_data;
    output in_startofpacket;
    output in_endofpacket;
    output in_empty;

    output out_ready;
    input out_valid;
    input out_data;
    input out_startofpacket;
    input out_endofpacket;
    input out_channel;
    input out_empty;
  endclocking : cb
   
  modport TB(clocking cb, output reset_n, output address);
endinterface : dircc_router_if
