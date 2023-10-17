// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Oct 13 14:05:58 2023
// Host        : LAPTOP-03UPN56G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/project/VGA/vga_rom/vivado/project_1.srcs/sources_1/ip/pll_clk/pll_clk_stub.v
// Design      : pll_clk
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module pll_clk(clk_108, clk_25, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_108,clk_25,reset,locked,clk_in1" */;
  output clk_108;
  output clk_25;
  input reset;
  output locked;
  input clk_in1;
endmodule
