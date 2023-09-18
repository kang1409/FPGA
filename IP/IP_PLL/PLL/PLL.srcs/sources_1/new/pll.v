`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 16:23:17
// Design Name: 
// Module Name: pll
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pll(
    input   wire    clk,                    //100MHZ时钟信号

    output  wire    clk_mul_2,              //2倍频信号
    output  wire    clk_div_2,              //2分频信号
    output  wire    clk_phase_90,           //相移90
    output  wire    clk_ducle_20,           //占空比为20%
    output  wire    locked                  //检测锁相器是否已经锁定
                                            //只有当该信号为高电平时，输出的时钟信号是稳定的；
    );

    pll_ip  pll_ip_inst(
        .clk_in1 (clk),
        .clk_out1(clk_mul_2),
        .clk_out2(clk_div_2),
        .clk_out3(clk_phase_90),
        .clk_out4(clk_ducle_20),
        .locked(locked)
    );    
endmodule
