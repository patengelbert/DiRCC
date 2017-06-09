// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Thu Jul 11 11:26:45 2013
// ============================================================================

`define ENABLE_HPS

module DE1_SoC(

//      ///////// ADC /////////
//      output             ADC_CS_N,
//      output             ADC_DIN,
//      input              ADC_DOUT,
//      output             ADC_SCLK,
//
//      ///////// AUD /////////
//      input              AUD_ADCDAT,
//      inout              AUD_ADCLRCK,
//      inout              AUD_BCLK,
//      output             AUD_DACDAT,
//      inout              AUD_DACLRCK,
//      output             AUD_XCK,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

//      ///////// DRAM /////////
//      output      [12:0] DRAM_ADDR,
//      output      [1:0]  DRAM_BA,
//      output             DRAM_CAS_N,
//      output             DRAM_CKE,
//      output             DRAM_CLK,
//      output             DRAM_CS_N,
//      inout       [15:0] DRAM_DQ,
//      output             DRAM_LDQM,
//      output             DRAM_RAS_N,
//      output             DRAM_UDQM,
//      output             DRAM_WE_N,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
      inout       [35:0] GPIO_0,
      inout       [35:0] GPIO_1,
 

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

//      ///////// IRDA /////////
//      input              IRDA_RXD,
//      output             IRDA_TXD,

      ///////// KEY /////////
      input       [3:0]  KEY,

      ///////// LEDR /////////
      output      [9:0]  LEDR,

//      ///////// PS2 /////////
//      inout              PS2_CLK,
//      inout              PS2_CLK2,
//      inout              PS2_DAT,
//      inout              PS2_DAT2,

      ///////// SW /////////
      input       [9:0]  SW

//      ///////// TD /////////
//      input              TD_CLK27,
//      input       [7:0]  TD_DATA,
//      input              TD_HS,
//      output             TD_RESET_N,
//      input              TD_VS,
//
//      ///////// VGA /////////
//      output      [7:0]  VGA_B,
//      output             VGA_BLANK_N,
//      output             VGA_CLK,
//      output      [7:0]  VGA_G,
//      output             VGA_HS,
//      output      [7:0]  VGA_R,
//      output             VGA_SYNC_N,
//      output             VGA_VS
);


//=======================================================
//  REG/WIRE declarations
//=======================================================





//=======================================================
//  Structural coding
//=======================================================

dircc_system_rtl_gals dircc_system (
    .clk_clk            (CLOCK_50),             //    clk.clk
    .memory_mem_a       (HPS_DDR3_ADDR),        // memory.mem_a
    .memory_mem_ba      (HPS_DDR3_BA),          //       .mem_ba
    .memory_mem_ck      (HPS_DDR3_CK_P),        //       .mem_ck
    .memory_mem_ck_n    (HPS_DDR3_CK_N),        //       .mem_ck_n
    .memory_mem_cke     (HPS_DDR3_CKE),         //       .mem_cke
    .memory_mem_cs_n    (HPS_DDR3_CS_N),        //       .mem_cs_n
    .memory_mem_ras_n   (HPS_DDR3_RAS_N),       //       .mem_ras_n
    .memory_mem_cas_n   (HPS_DDR3_CAS_N),       //       .mem_cas_n
    .memory_mem_we_n    (HPS_DDR3_WE_N),        //       .mem_we_n
    .memory_mem_reset_n (HPS_DDR3_RESET_N),     //       .mem_reset_n
    .memory_mem_dq      (HPS_DDR3_DQ),          //       .mem_dq
    .memory_mem_dqs     (HPS_DDR3_DQS_P),       //       .mem_dqs
    .memory_mem_dqs_n   (HPS_DDR3_DQS_N),       //       .mem_dqs_n
    .memory_mem_odt     (HPS_DDR3_ODT),         //       .mem_odt
    .memory_mem_dm      (HPS_DDR3_DM),          //       .mem_dm
    .memory_oct_rzqin   (HPS_DDR3_RZQ),         //       .oct_rzqin
    .hps_io_hps_io_gpio_inst_GPIO53(HPS_LED),   //       .hps_io_gpio_inst_GPIO53
    .hps_io_hps_io_gpio_inst_GPIO54(HPS_KEY),   //       .hps_io_gpio_inst_GPIO54
    .reset_reset_n      (KEY[0])                //  reset.reset_n
);





endmodule
