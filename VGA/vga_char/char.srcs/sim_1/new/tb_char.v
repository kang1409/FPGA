`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/26 21:23:08
// Design Name: 
// Module Name: tb_char
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


module tb_char();
    reg clk;
    reg rst;

    wire hsync;
    wire vsync;
    wire [11:0] rgb;
    wire        led;

    initial begin
        clk = 1'b1;
        rst <= 1'b1;
        #5
        rst = 1'b0;
    end

    always #5 clk = ~clk ;

    wire clk_108 = vga_char.clk_108;
    
    wire pi_en = vga_pic.pi_en;

    wire [10:0] pi_x = vga_pic.pi_x;
    wire [10:0] pi_y = vga_pic.pi_y;
    wire [10:0] cnt_c = vga_ctrl.cnt_c;
    wire [10:0] cnt_h = vga_ctrl.cnt_h;
    // wire [255:0] char = vga_ctrl.char[4];

    wire valid = vga_ctrl.valid;

    vga_char vga_char_inst(
        .clk(clk),
        .rst(rst),

        .led(led),
        .hsync(hsync),
        .vsync (vsync),
        .rgb(rgb)
    );
endmodule
