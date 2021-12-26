// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Dec 26 17:44:17 2021
// Host        : Kin running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Kin/Desktop/FPGA/6_clk_ip/6_clk_ip.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_100M, clk_100M_dp, clk_50M, clk_25M, resetn, 
  locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_100M,clk_100M_dp,clk_50M,clk_25M,resetn,locked,clk_in1" */;
  output clk_100M;
  output clk_100M_dp;
  output clk_50M;
  output clk_25M;
  input resetn;
  output locked;
  input clk_in1;
endmodule
