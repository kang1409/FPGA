`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/27 20:47:58
// Design Name: 
// Module Name: vga_pic
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


module vga_pic(
    input wire clk,
    input wire rst,
    input wire [10:0] pi_x,
    input wire [10:0] pi_y,
    
    output reg [11:0] pi_data 
    );
    parameter pi_hang = 11'd4;
    parameter pi_zong = 11'd50;

    parameter   H_VALID = 11'd1280,
                C_VALID = 11'd1024;

    parameter   RED     = 12'hF80,
                ORANGE  = 12'hFC0,
                YELLOW  = 12'hFFE,
                GREEN   = 12'h07E,
                CYAN    = 12'h07F,
                BLUE    = 12'h01F,
                PURPPLE = 12'hF81,
                BLACK   = 12'h000,
                WHITE   = 12'hFFF,
                GRAY    = 12'hD69;

    //线宽四个像素点，棋盘共有19横19纵，方格50；

    char1 = 16'h3D0;
    char2 = 16'b3c000000000000

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_data <= WHITE;
        else 
        if(pi_y / 11'd54 >= 11'd0) && (pi_y / 11'd54 <= 11'd3)
                //输出线
    end
    
endmodule
