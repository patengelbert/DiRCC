//Legal Notice: (C)2017 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dircc_system_node_single_node_0_processing_fifo_in_dual_clock_fifo (
                                                                            // inputs:
                                                                             aclr,
                                                                             data,
                                                                             rdclk,
                                                                             rdreq,
                                                                             wrclk,
                                                                             wrreq,

                                                                            // outputs:
                                                                             q,
                                                                             rdempty,
                                                                             wrempty,
                                                                             wrfull,
                                                                             wrusedw
                                                                          )
  /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101" */ ;

  output  [ 31: 0] q;
  output           rdempty;
  output           wrempty;
  output           wrfull;
  output  [  3: 0] wrusedw;
  input            aclr;
  input   [ 31: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input            wrreq;


wire             int_wrfull;
wire    [ 31: 0] q;
wire             rdempty;
wire             wrempty;
wire             wrfull;
wire    [  3: 0] wrusedw;
  assign wrfull = (wrusedw >= 16-3) | int_wrfull;
  dcfifo dual_clock_fifo
    (
      .aclr (aclr),
      .data (data),
      .q (q),
      .rdclk (rdclk),
      .rdempty (rdempty),
      .rdreq (rdreq),
      .wrclk (wrclk),
      .wrempty (wrempty),
      .wrfull (int_wrfull),
      .wrreq (wrreq),
      .wrusedw (wrusedw)
    );

  defparam dual_clock_fifo.add_ram_output_register = "OFF",
           dual_clock_fifo.clocks_are_synchronized = "FALSE",
           dual_clock_fifo.intended_device_family = "CYCLONEV",
           dual_clock_fifo.lpm_hint = "DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT",
           dual_clock_fifo.lpm_numwords = 16,
           dual_clock_fifo.lpm_showahead = "OFF",
           dual_clock_fifo.lpm_type = "dcfifo",
           dual_clock_fifo.lpm_width = 32,
           dual_clock_fifo.lpm_widthu = 4,
           dual_clock_fifo.overflow_checking = "ON",
           dual_clock_fifo.underflow_checking = "ON",
           dual_clock_fifo.use_eab = "OFF";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dircc_system_node_single_node_0_processing_fifo_in_dcfifo_with_controls (
                                                                                 // inputs:
                                                                                  data,
                                                                                  rdclk,
                                                                                  rdreq,
                                                                                  rdreset_n,
                                                                                  wrclk,
                                                                                  wrclk_control_slave_address,
                                                                                  wrclk_control_slave_read,
                                                                                  wrclk_control_slave_write,
                                                                                  wrclk_control_slave_writedata,
                                                                                  wrreq,
                                                                                  wrreset_n,

                                                                                 // outputs:
                                                                                  q,
                                                                                  rdempty,
                                                                                  wrclk_control_slave_readdata,
                                                                                  wrfull,
                                                                                  wrlevel
                                                                               )
;

  output  [ 31: 0] q;
  output           rdempty;
  output  [ 31: 0] wrclk_control_slave_readdata;
  output           wrfull;
  output  [  4: 0] wrlevel;
  input   [ 31: 0] data;
  input            rdclk;
  input            rdreq;
  input            rdreset_n;
  input            wrclk;
  input   [  2: 0] wrclk_control_slave_address;
  input            wrclk_control_slave_read;
  input            wrclk_control_slave_write;
  input   [ 31: 0] wrclk_control_slave_writedata;
  input            wrreq;
  input            wrreset_n;


wire    [ 31: 0] q;
wire             rdempty;
wire             rdreq_sync;
reg              wrclk_control_slave_almostempty_n_reg;
wire             wrclk_control_slave_almostempty_pulse;
wire             wrclk_control_slave_almostempty_signal;
reg     [  4: 0] wrclk_control_slave_almostempty_threshold_register;
reg              wrclk_control_slave_almostfull_n_reg;
wire             wrclk_control_slave_almostfull_pulse;
wire             wrclk_control_slave_almostfull_signal;
reg     [  4: 0] wrclk_control_slave_almostfull_threshold_register;
reg              wrclk_control_slave_empty_n_reg;
wire             wrclk_control_slave_empty_pulse;
wire             wrclk_control_slave_empty_signal;
reg              wrclk_control_slave_event_almostempty_q;
wire             wrclk_control_slave_event_almostempty_signal;
reg              wrclk_control_slave_event_almostfull_q;
wire             wrclk_control_slave_event_almostfull_signal;
reg              wrclk_control_slave_event_empty_q;
wire             wrclk_control_slave_event_empty_signal;
reg              wrclk_control_slave_event_full_q;
wire             wrclk_control_slave_event_full_signal;
reg              wrclk_control_slave_event_overflow_q;
wire             wrclk_control_slave_event_overflow_signal;
wire    [  5: 0] wrclk_control_slave_event_register;
reg              wrclk_control_slave_event_underflow_q;
wire             wrclk_control_slave_event_underflow_signal;
reg              wrclk_control_slave_full_n_reg;
wire             wrclk_control_slave_full_pulse;
wire             wrclk_control_slave_full_signal;
reg     [  5: 0] wrclk_control_slave_ienable_register;
wire    [  4: 0] wrclk_control_slave_level_register;
wire    [ 31: 0] wrclk_control_slave_read_mux;
reg     [ 31: 0] wrclk_control_slave_readdata;
reg              wrclk_control_slave_status_almostempty_q;
wire             wrclk_control_slave_status_almostempty_signal;
reg              wrclk_control_slave_status_almostfull_q;
wire             wrclk_control_slave_status_almostfull_signal;
reg              wrclk_control_slave_status_empty_q;
wire             wrclk_control_slave_status_empty_signal;
reg              wrclk_control_slave_status_full_q;
wire             wrclk_control_slave_status_full_signal;
reg              wrclk_control_slave_status_overflow_q;
wire             wrclk_control_slave_status_overflow_signal;
wire    [  5: 0] wrclk_control_slave_status_register;
reg              wrclk_control_slave_status_underflow_q;
wire             wrclk_control_slave_status_underflow_signal;
wire    [  4: 0] wrclk_control_slave_threshold_writedata;
wire             wrempty;
wire             wrfull;
wire    [  4: 0] wrlevel;
wire             wroverflow;
wire             wrreq_valid;
wire             wrunderflow;
wire    [  3: 0] wrusedw;
  //the_dcfifo, which is an e_instance
  dircc_system_node_single_node_0_processing_fifo_in_dual_clock_fifo the_dcfifo
    (
      .aclr    (~(rdreset_n && wrreset_n)),
      .data    (data),
      .q       (q),
      .rdclk   (rdclk),
      .rdempty (rdempty),
      .rdreq   (rdreq),
      .wrclk   (wrclk),
      .wrempty (wrempty),
      .wrfull  (wrfull),
      .wrreq   (wrreq_valid),
      .wrusedw (wrusedw)
    );

  altera_std_synchronizer rdreq_sync_i
    (
      .clk (wrclk),
      .din (rdreq),
      .dout (rdreq_sync),
      .reset_n (wrreset_n)
    );

  defparam rdreq_sync_i.depth = 4;

  assign wrlevel = {1'b0,
    wrusedw};

  assign wrreq_valid = wrreq & ~wrfull;
  assign wroverflow = wrreq & wrfull;
  assign wrunderflow = rdreq_sync & wrempty;
  assign wrclk_control_slave_threshold_writedata = (wrclk_control_slave_writedata < 1) ? 1 :
    (wrclk_control_slave_writedata > 12) ? 12 :
    wrclk_control_slave_writedata[4 : 0];

  assign wrclk_control_slave_event_almostfull_signal = wrclk_control_slave_almostfull_pulse;
  assign wrclk_control_slave_event_almostempty_signal = wrclk_control_slave_almostempty_pulse;
  assign wrclk_control_slave_status_almostfull_signal = wrclk_control_slave_almostfull_signal;
  assign wrclk_control_slave_status_almostempty_signal = wrclk_control_slave_almostempty_signal;
  assign wrclk_control_slave_event_full_signal = wrclk_control_slave_full_pulse;
  assign wrclk_control_slave_event_empty_signal = wrclk_control_slave_empty_pulse;
  assign wrclk_control_slave_status_full_signal = wrclk_control_slave_full_signal;
  assign wrclk_control_slave_status_empty_signal = wrclk_control_slave_empty_signal;
  assign wrclk_control_slave_event_overflow_signal = wroverflow;
  assign wrclk_control_slave_event_underflow_signal = wrunderflow;
  assign wrclk_control_slave_status_overflow_signal = wroverflow;
  assign wrclk_control_slave_status_underflow_signal = wrunderflow;
  assign wrclk_control_slave_empty_signal = wrempty;
  assign wrclk_control_slave_empty_pulse = wrclk_control_slave_empty_signal & wrclk_control_slave_empty_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_empty_n_reg <= 0;
      else 
        wrclk_control_slave_empty_n_reg <= !wrclk_control_slave_empty_signal;
    end


  assign wrclk_control_slave_full_signal = wrfull;
  assign wrclk_control_slave_full_pulse = wrclk_control_slave_full_signal & wrclk_control_slave_full_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_full_n_reg <= 0;
      else 
        wrclk_control_slave_full_n_reg <= !wrclk_control_slave_full_signal;
    end


  assign wrclk_control_slave_almostempty_signal = wrlevel <= wrclk_control_slave_almostempty_threshold_register;
  assign wrclk_control_slave_almostempty_pulse = wrclk_control_slave_almostempty_signal & wrclk_control_slave_almostempty_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostempty_n_reg <= 0;
      else 
        wrclk_control_slave_almostempty_n_reg <= !wrclk_control_slave_almostempty_signal;
    end


  assign wrclk_control_slave_almostfull_signal = wrlevel >= wrclk_control_slave_almostfull_threshold_register;
  assign wrclk_control_slave_almostfull_pulse = wrclk_control_slave_almostfull_signal & wrclk_control_slave_almostfull_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostfull_n_reg <= 0;
      else 
        wrclk_control_slave_almostfull_n_reg <= !wrclk_control_slave_almostfull_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostempty_threshold_register <= 1;
      else if ((wrclk_control_slave_address == 5) & wrclk_control_slave_write)
          wrclk_control_slave_almostempty_threshold_register <= wrclk_control_slave_threshold_writedata;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostfull_threshold_register <= 12;
      else if ((wrclk_control_slave_address == 4) & wrclk_control_slave_write)
          wrclk_control_slave_almostfull_threshold_register <= wrclk_control_slave_threshold_writedata;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_ienable_register <= 0;
      else if ((wrclk_control_slave_address == 3) & wrclk_control_slave_write)
          wrclk_control_slave_ienable_register <= wrclk_control_slave_writedata[5 : 0];
    end


  assign wrclk_control_slave_level_register = wrlevel;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_underflow_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[5])
          wrclk_control_slave_event_underflow_q <= 0;
      else if (wrclk_control_slave_event_underflow_signal)
          wrclk_control_slave_event_underflow_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_overflow_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[4])
          wrclk_control_slave_event_overflow_q <= 0;
      else if (wrclk_control_slave_event_overflow_signal)
          wrclk_control_slave_event_overflow_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_almostempty_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[3])
          wrclk_control_slave_event_almostempty_q <= 0;
      else if (wrclk_control_slave_event_almostempty_signal)
          wrclk_control_slave_event_almostempty_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_almostfull_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[2])
          wrclk_control_slave_event_almostfull_q <= 0;
      else if (wrclk_control_slave_event_almostfull_signal)
          wrclk_control_slave_event_almostfull_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_empty_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[1])
          wrclk_control_slave_event_empty_q <= 0;
      else if (wrclk_control_slave_event_empty_signal)
          wrclk_control_slave_event_empty_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_full_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[0])
          wrclk_control_slave_event_full_q <= 0;
      else if (wrclk_control_slave_event_full_signal)
          wrclk_control_slave_event_full_q <= -1;
    end


  assign wrclk_control_slave_event_register = {wrclk_control_slave_event_underflow_q,
    wrclk_control_slave_event_overflow_q,
    wrclk_control_slave_event_almostempty_q,
    wrclk_control_slave_event_almostfull_q,
    wrclk_control_slave_event_empty_q,
    wrclk_control_slave_event_full_q};

  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_underflow_q <= 0;
      else 
        wrclk_control_slave_status_underflow_q <= wrclk_control_slave_status_underflow_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_overflow_q <= 0;
      else 
        wrclk_control_slave_status_overflow_q <= wrclk_control_slave_status_overflow_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_almostempty_q <= 0;
      else 
        wrclk_control_slave_status_almostempty_q <= wrclk_control_slave_status_almostempty_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_almostfull_q <= 0;
      else 
        wrclk_control_slave_status_almostfull_q <= wrclk_control_slave_status_almostfull_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_empty_q <= 0;
      else 
        wrclk_control_slave_status_empty_q <= wrclk_control_slave_status_empty_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_full_q <= 0;
      else 
        wrclk_control_slave_status_full_q <= wrclk_control_slave_status_full_signal;
    end


  assign wrclk_control_slave_status_register = {wrclk_control_slave_status_underflow_q,
    wrclk_control_slave_status_overflow_q,
    wrclk_control_slave_status_almostempty_q,
    wrclk_control_slave_status_almostfull_q,
    wrclk_control_slave_status_empty_q,
    wrclk_control_slave_status_full_q};

  assign wrclk_control_slave_read_mux = ({32 {(wrclk_control_slave_address == 0)}} & wrclk_control_slave_level_register) |
    ({32 {(wrclk_control_slave_address == 1)}} & wrclk_control_slave_status_register) |
    ({32 {(wrclk_control_slave_address == 2)}} & wrclk_control_slave_event_register) |
    ({32 {(wrclk_control_slave_address == 3)}} & wrclk_control_slave_ienable_register) |
    ({32 {(wrclk_control_slave_address == 4)}} & wrclk_control_slave_almostfull_threshold_register) |
    ({32 {(wrclk_control_slave_address == 5)}} & wrclk_control_slave_almostempty_threshold_register) |
    ({32 {(~((wrclk_control_slave_address == 0))) && (~((wrclk_control_slave_address == 1))) && (~((wrclk_control_slave_address == 2))) && (~((wrclk_control_slave_address == 3))) && (~((wrclk_control_slave_address == 4))) && (~((wrclk_control_slave_address == 5)))}} & wrclk_control_slave_level_register);

  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_readdata <= 0;
      else if (wrclk_control_slave_read)
          wrclk_control_slave_readdata <= wrclk_control_slave_read_mux;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dircc_system_node_single_node_0_processing_fifo_in_map_avalonst_to_avalonmm (
                                                                                     // inputs:
                                                                                      avalonst_data,

                                                                                     // outputs:
                                                                                      avalonmm_data
                                                                                   )
;

  output  [ 31: 0] avalonmm_data;
  input   [ 31: 0] avalonst_data;


wire    [ 31: 0] avalonmm_data;
  assign avalonmm_data[7 : 0] = avalonst_data[31 : 24];
  assign avalonmm_data[15 : 8] = avalonst_data[23 : 16];
  assign avalonmm_data[23 : 16] = avalonst_data[15 : 8];
  assign avalonmm_data[31 : 24] = avalonst_data[7 : 0];

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dircc_system_node_single_node_0_processing_fifo_in_dual_clock_fifo_for_other_info (
                                                                                           // inputs:
                                                                                            aclr,
                                                                                            data,
                                                                                            rdclk,
                                                                                            rdreq,
                                                                                            wrclk,
                                                                                            wrreq,

                                                                                           // outputs:
                                                                                            q
                                                                                         )
  /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101" */ ;

  output  [  3: 0] q;
  input            aclr;
  input   [  3: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input            wrreq;


wire    [  3: 0] q;
  dcfifo dual_clock_fifo
    (
      .aclr (aclr),
      .data (data),
      .q (q),
      .rdclk (rdclk),
      .rdreq (rdreq),
      .wrclk (wrclk),
      .wrreq (wrreq)
    );

  defparam dual_clock_fifo.add_ram_output_register = "OFF",
           dual_clock_fifo.clocks_are_synchronized = "FALSE",
           dual_clock_fifo.intended_device_family = "CYCLONEV",
           dual_clock_fifo.lpm_hint = "DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT",
           dual_clock_fifo.lpm_numwords = 16,
           dual_clock_fifo.lpm_showahead = "OFF",
           dual_clock_fifo.lpm_type = "dcfifo",
           dual_clock_fifo.lpm_width = 4,
           dual_clock_fifo.lpm_widthu = 4,
           dual_clock_fifo.overflow_checking = "ON",
           dual_clock_fifo.underflow_checking = "ON",
           dual_clock_fifo.use_eab = "OFF";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dircc_system_node_single_node_0_processing_fifo_in_map_avalonst_to_avalonmm_other_info (
                                                                                                // inputs:
                                                                                                 avalonst_other_info,

                                                                                                // outputs:
                                                                                                 avalonmm_other_info
                                                                                              )
;

  output  [ 31: 0] avalonmm_other_info;
  input   [  3: 0] avalonst_other_info;


wire    [  7: 0] avalonmm_channel;
wire    [  5: 0] avalonmm_empty;
wire             avalonmm_eop;
wire    [  7: 0] avalonmm_error;
wire    [ 31: 0] avalonmm_other_info;
wire             avalonmm_sop;
  assign avalonmm_sop = avalonst_other_info[0];
  assign avalonmm_eop = avalonst_other_info[1];
  assign avalonmm_empty = {4'b0,
    avalonst_other_info[3 : 2]};

  assign avalonmm_channel = 8'b0;
  assign avalonmm_error = 8'b0;
  assign avalonmm_other_info = {8'b0,
    avalonmm_error,
    avalonmm_channel,
    avalonmm_empty,
    avalonmm_eop,
    avalonmm_sop};


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dircc_system_node_single_node_0_processing_fifo_in (
                                                            // inputs:
                                                             avalonmm_read_slave_address,
                                                             avalonmm_read_slave_read,
                                                             avalonst_sink_data,
                                                             avalonst_sink_empty,
                                                             avalonst_sink_endofpacket,
                                                             avalonst_sink_startofpacket,
                                                             avalonst_sink_valid,
                                                             rdclock,
                                                             rdreset_n,
                                                             wrclk_control_slave_address,
                                                             wrclk_control_slave_read,
                                                             wrclk_control_slave_write,
                                                             wrclk_control_slave_writedata,
                                                             wrclock,
                                                             wrreset_n,

                                                            // outputs:
                                                             avalonmm_read_slave_readdata,
                                                             avalonmm_read_slave_waitrequest,
                                                             avalonst_sink_ready,
                                                             wrclk_control_slave_readdata
                                                          )
;

  output  [ 31: 0] avalonmm_read_slave_readdata;
  output           avalonmm_read_slave_waitrequest;
  output           avalonst_sink_ready;
  output  [ 31: 0] wrclk_control_slave_readdata;
  input            avalonmm_read_slave_address;
  input            avalonmm_read_slave_read;
  input   [ 31: 0] avalonst_sink_data;
  input   [  1: 0] avalonst_sink_empty;
  input            avalonst_sink_endofpacket;
  input            avalonst_sink_startofpacket;
  input            avalonst_sink_valid;
  input            rdclock;
  input            rdreset_n;
  input   [  2: 0] wrclk_control_slave_address;
  input            wrclk_control_slave_read;
  input            wrclk_control_slave_write;
  input   [ 31: 0] wrclk_control_slave_writedata;
  input            wrclock;
  input            wrreset_n;


wire    [ 31: 0] avalonmm_map_data_out;
wire    [ 31: 0] avalonmm_other_info_map_out;
reg              avalonmm_read_slave_address_delayed;
reg              avalonmm_read_slave_read_delayed;
wire    [ 31: 0] avalonmm_read_slave_readdata;
wire             avalonmm_read_slave_waitrequest;
wire    [ 31: 0] avalonst_map_data_in;
wire    [  3: 0] avalonst_other_info_map_in;
wire             avalonst_sink_ready;
wire    [ 31: 0] data;
wire             deassert_waitrequest;
wire             no_stop_write;
reg              no_stop_write_d1;
wire    [ 31: 0] q;
wire             rdclk;
wire             rdempty;
wire             rdreq;
wire             rdreq_driver;
wire             ready_0;
wire             ready_1;
wire             ready_selector;
wire             wrclk;
wire    [ 31: 0] wrclk_control_slave_readdata;
wire             wrfull;
wire    [  4: 0] wrlevel;
wire             wrreq;
  //the_dcfifo_with_controls, which is an e_instance
  dircc_system_node_single_node_0_processing_fifo_in_dcfifo_with_controls the_dcfifo_with_controls
    (
      .data                          (data),
      .q                             (q),
      .rdclk                         (rdclk),
      .rdempty                       (rdempty),
      .rdreq                         (rdreq),
      .rdreset_n                     (rdreset_n),
      .wrclk                         (wrclk),
      .wrclk_control_slave_address   (wrclk_control_slave_address),
      .wrclk_control_slave_read      (wrclk_control_slave_read),
      .wrclk_control_slave_readdata  (wrclk_control_slave_readdata),
      .wrclk_control_slave_write     (wrclk_control_slave_write),
      .wrclk_control_slave_writedata (wrclk_control_slave_writedata),
      .wrfull                        (wrfull),
      .wrlevel                       (wrlevel),
      .wrreq                         (wrreq),
      .wrreset_n                     (wrreset_n)
    );

  //out, which is an e_avalon_slave
  assign deassert_waitrequest = avalonmm_read_slave_address & avalonmm_read_slave_read;
  assign avalonmm_read_slave_waitrequest = !deassert_waitrequest & rdempty;
  //the_map_avalonst_to_avalonmm, which is an e_instance
  dircc_system_node_single_node_0_processing_fifo_in_map_avalonst_to_avalonmm the_map_avalonst_to_avalonmm
    (
      .avalonmm_data (avalonmm_map_data_out),
      .avalonst_data (avalonst_map_data_in)
    );

  assign wrclk = wrclock;
  assign rdclk = rdclock;
  assign rdreq_driver = (avalonmm_read_slave_address == 0) & avalonmm_read_slave_read;
  assign avalonst_map_data_in = q;
  assign rdreq = rdreq_driver;
  assign data = avalonst_sink_data;
  assign wrreq = avalonst_sink_valid & no_stop_write_d1;
  assign no_stop_write = (ready_selector & ready_1) | (!ready_selector & ready_0);
  assign ready_1 = !wrfull;
  assign ready_0 = !wrfull & !avalonst_sink_valid;
  assign ready_selector = wrlevel < 12;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          no_stop_write_d1 <= 0;
      else 
        no_stop_write_d1 <= no_stop_write;
    end


  assign avalonst_sink_ready = no_stop_write & no_stop_write_d1;
  //the_dcfifo_other_info, which is an e_instance
  dircc_system_node_single_node_0_processing_fifo_in_dual_clock_fifo_for_other_info the_dcfifo_other_info
    (
      .aclr  (~(wrreset_n && rdreset_n)),
      .data  ({avalonst_sink_empty,
avalonst_sink_endofpacket,
avalonst_sink_startofpacket}),
      .q     (avalonst_other_info_map_in),
      .rdclk (rdclk),
      .rdreq ((avalonmm_read_slave_address == 0) & avalonmm_read_slave_read),
      .wrclk (wrclk),
      .wrreq (avalonst_sink_valid & no_stop_write_d1)
    );

  //the_map_avalonst_to_avalonmm_other_info, which is an e_instance
  dircc_system_node_single_node_0_processing_fifo_in_map_avalonst_to_avalonmm_other_info the_map_avalonst_to_avalonmm_other_info
    (
      .avalonmm_other_info (avalonmm_other_info_map_out),
      .avalonst_other_info (avalonst_other_info_map_in)
    );

  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          avalonmm_read_slave_address_delayed <= 0;
      else 
        avalonmm_read_slave_address_delayed <= avalonmm_read_slave_address;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          avalonmm_read_slave_read_delayed <= 0;
      else 
        avalonmm_read_slave_read_delayed <= avalonmm_read_slave_read;
    end


  assign avalonmm_read_slave_readdata = ({32 {((avalonmm_read_slave_address_delayed == 1) & avalonmm_read_slave_read_delayed)}} & avalonmm_other_info_map_out) |
    ({32 {((avalonmm_read_slave_address_delayed == 0) & avalonmm_read_slave_read_delayed)}} & avalonmm_map_data_out);

  //in, which is an e_atlantic_slave
  //in_csr, which is an e_avalon_slave

endmodule

