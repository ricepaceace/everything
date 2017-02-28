//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Tue Feb 28 08:18:19 2017
//Host        : gregbox running 64-bit Ubuntu 16.04.2 LTS
//Command     : generate_target full_system_wrapper.bd
//Design      : full_system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module full_system_wrapper
   (CS,
    CS_1,
    CS_2,
    CS_3,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    MISO,
    MISO_1,
    MISO_2,
    MISO_3,
    SCLK,
    SCLK_1,
    SCLK_2,
    SCLK_3,
    btns_5bits_0_tri_i,
    gpio_tri_o);
  output CS;
  output CS_1;
  output CS_2;
  output CS_3;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input MISO;
  input MISO_1;
  input MISO_2;
  input MISO_3;
  output SCLK;
  output SCLK_1;
  output SCLK_2;
  output SCLK_3;
  input [4:0]btns_5bits_0_tri_i;
  output [7:0]gpio_tri_o;

  wire CS;
  wire CS_1;
  wire CS_2;
  wire CS_3;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire MISO;
  wire MISO_1;
  wire MISO_2;
  wire MISO_3;
  wire SCLK;
  wire SCLK_1;
  wire SCLK_2;
  wire SCLK_3;
  wire [4:0]btns_5bits_0_tri_i;
  wire [7:0]gpio_tri_o;

  full_system full_system_i
       (.CS(CS),
        .CS_1(CS_1),
        .CS_2(CS_2),
        .CS_3(CS_3),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .GPIO_tri_o(gpio_tri_o),
        .MISO(MISO),
        .MISO_1(MISO_1),
        .MISO_2(MISO_2),
        .MISO_3(MISO_3),
        .SCLK(SCLK),
        .SCLK_1(SCLK_1),
        .SCLK_2(SCLK_2),
        .SCLK_3(SCLK_3),
        .btns_5bits_0_tri_i(btns_5bits_0_tri_i));
endmodule
