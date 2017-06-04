// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       dircc_system_rtl_gals_HPS_hps_io_border_hps_io
// role:width:direction:                              hps_io_gpio_inst_GPIO53:1:bidir,hps_io_gpio_inst_GPIO54:1:bidir
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dircc_system_rtl_gals_HPS_hps_io_border_hps_io
(
   sig_hps_io_gpio_inst_GPIO53,
   sig_hps_io_gpio_inst_GPIO54
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   inout wire sig_hps_io_gpio_inst_GPIO53;
   inout wire sig_hps_io_gpio_inst_GPIO54;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_hps_io_gpio_inst_GPIO53_t;
   typedef logic ROLE_hps_io_gpio_inst_GPIO54_t;

   logic sig_hps_io_gpio_inst_GPIO53_oe;
   logic sig_hps_io_gpio_inst_GPIO53_oe_temp = 0;
   reg sig_hps_io_gpio_inst_GPIO53_temp;
   reg sig_hps_io_gpio_inst_GPIO53_out;
   logic [0 : 0] sig_hps_io_gpio_inst_GPIO53_in;
   logic [0 : 0] sig_hps_io_gpio_inst_GPIO53_local;
   logic sig_hps_io_gpio_inst_GPIO54_oe;
   logic sig_hps_io_gpio_inst_GPIO54_oe_temp = 0;
   reg sig_hps_io_gpio_inst_GPIO54_temp;
   reg sig_hps_io_gpio_inst_GPIO54_out;
   logic [0 : 0] sig_hps_io_gpio_inst_GPIO54_in;
   logic [0 : 0] sig_hps_io_gpio_inst_GPIO54_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_hps_io_gpio_inst_GPIO53_change;
   event signal_input_hps_io_gpio_inst_GPIO54_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "16.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // hps_io_gpio_inst_GPIO53
   // -------------------------------------------------------
   function automatic ROLE_hps_io_gpio_inst_GPIO53_t get_hps_io_gpio_inst_GPIO53();
   
      // Gets the hps_io_gpio_inst_GPIO53 input value.
      $sformat(message, "%m: called get_hps_io_gpio_inst_GPIO53");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_gpio_inst_GPIO53_in;
      
   endfunction

   function automatic void set_hps_io_gpio_inst_GPIO53 (
      ROLE_hps_io_gpio_inst_GPIO53_t new_value
   );
      // Drive the new value to hps_io_gpio_inst_GPIO53.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_gpio_inst_GPIO53_temp = new_value;
   endfunction
   
   function automatic void set_hps_io_gpio_inst_GPIO53_oe (
      bit enable
   );
      // bidir port hps_io_gpio_inst_GPIO53 will work as output port when set to 1.
      // bidir port hps_io_gpio_inst_GPIO53 will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_gpio_inst_GPIO53_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // hps_io_gpio_inst_GPIO54
   // -------------------------------------------------------
   function automatic ROLE_hps_io_gpio_inst_GPIO54_t get_hps_io_gpio_inst_GPIO54();
   
      // Gets the hps_io_gpio_inst_GPIO54 input value.
      $sformat(message, "%m: called get_hps_io_gpio_inst_GPIO54");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_gpio_inst_GPIO54_in;
      
   endfunction

   function automatic void set_hps_io_gpio_inst_GPIO54 (
      ROLE_hps_io_gpio_inst_GPIO54_t new_value
   );
      // Drive the new value to hps_io_gpio_inst_GPIO54.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_gpio_inst_GPIO54_temp = new_value;
   endfunction
   
   function automatic void set_hps_io_gpio_inst_GPIO54_oe (
      bit enable
   );
      // bidir port hps_io_gpio_inst_GPIO54 will work as output port when set to 1.
      // bidir port hps_io_gpio_inst_GPIO54 will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_gpio_inst_GPIO54_oe_temp = enable;
   endfunction

   assign sig_hps_io_gpio_inst_GPIO53_oe = sig_hps_io_gpio_inst_GPIO53_oe_temp;
   assign sig_hps_io_gpio_inst_GPIO53 = (sig_hps_io_gpio_inst_GPIO53_oe == 1)? sig_hps_io_gpio_inst_GPIO53_temp:'z;
   assign sig_hps_io_gpio_inst_GPIO53_in = (sig_hps_io_gpio_inst_GPIO53_oe == 0)? sig_hps_io_gpio_inst_GPIO53:'z;
   assign sig_hps_io_gpio_inst_GPIO54_oe = sig_hps_io_gpio_inst_GPIO54_oe_temp;
   assign sig_hps_io_gpio_inst_GPIO54 = (sig_hps_io_gpio_inst_GPIO54_oe == 1)? sig_hps_io_gpio_inst_GPIO54_temp:'z;
   assign sig_hps_io_gpio_inst_GPIO54_in = (sig_hps_io_gpio_inst_GPIO54_oe == 0)? sig_hps_io_gpio_inst_GPIO54:'z;


   always @(sig_hps_io_gpio_inst_GPIO53_in) begin
      if (sig_hps_io_gpio_inst_GPIO53_oe == 0) begin
         if (sig_hps_io_gpio_inst_GPIO53_local != sig_hps_io_gpio_inst_GPIO53_in)
            -> signal_input_hps_io_gpio_inst_GPIO53_change;
         sig_hps_io_gpio_inst_GPIO53_local = sig_hps_io_gpio_inst_GPIO53_in;
      end
   end
   
   always @(sig_hps_io_gpio_inst_GPIO54_in) begin
      if (sig_hps_io_gpio_inst_GPIO54_oe == 0) begin
         if (sig_hps_io_gpio_inst_GPIO54_local != sig_hps_io_gpio_inst_GPIO54_in)
            -> signal_input_hps_io_gpio_inst_GPIO54_change;
         sig_hps_io_gpio_inst_GPIO54_local = sig_hps_io_gpio_inst_GPIO54_in;
      end
   end
   


// synthesis translate_on

endmodule

