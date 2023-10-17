`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 20:41:25
// Design Name: 
// Module Name: vga_rom
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


module vga_rom(
    input wire              clk,
    input wire              rst,

    output  wire            hsync,
    output  wire            vsync,
    output  wire [11:0]     rgb         //RGBÍ¼ÏñÉ«²ÊÐÅÏ¢
    );

    wire clk_108;
    wire clk_25;
    wire locked;
    wire rst_n;
    wire [11:0] pi_data;
    wire [10:0] pi_x;
    wire [10:0] pi_y;

    assign rst_n = (rst | ~locked);

    vga_pic vga_pic_inst(
        .clk        (clk_108),
        .rst        (rst_n),
        .pi_x       (pi_x),
        .pi_y       (pi_y),
        
        .pi_data    (pi_data)
    );

    vga_ctrl vga_ctrl_inst(
        .clk        (clk_108),
        .rst        (rst_n),
        .pi_data    (pi_data),
        
        .pi_x       (pi_x),
        .pi_y       (pi_y),
        .rgb        (rgb),
        .hsync      (hsync),
        .vsync      (vsync)
    );

    pll_clk pll_clk_inst(
        .clk_in1    (clk),
        .reset      (rst),

        .clk_108    (clk_108),
        .clk_25     (clk_25),
        .locked     (locked)
    );
endmodule
