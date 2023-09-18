`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 16:41:46
// Design Name: 
// Module Name: tb_pll
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


module tb_pll();

    reg clk;

    wire clk_mul_2;
    wire clk_div_2;
    wire clk_phase_90;
    wire clk_ducle_20;
    wire locked;

    initial begin
        clk = 1'b0;
    end

    always #5 clk = ~clk;

    pll pll_inst(
        .clk(clk),
        .clk_div_2(clk_div_2),
        .clk_ducle_20 (clk_ducle_20),
        .clk_mul_2(clk_mul_2),
        .clk_phase_90 (clk_phase_90),
        .locked(locked)
    );
endmodule
