`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:39:04
// Design Name: 
// Module Name: tb_colorbar
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


module tb_colorbar();
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

    wire clk_108 = vag_colorbar.clk_108;
    
    // wire [11:0] pi_data_pic = vga_pic.pi_data;
    wire [10:0] pi_x_pic    = vga_pic.pi_x;
    wire [10:0] pi_y_pic    = vga_pic.pi_y;

    wire [10:0] pi_x_ctrl   = vga_ctrl.pi_x;
    wire [10:0] pi_y_ctrl   = vga_ctrl.pi_y;
    
    // wire [11:0] rgb_ctrl    = vga_ctrl.rgb;
    wire [10:0] cnt_h_ctrl  = vga_ctrl.cnt_h;
    wire [10:0] cnt_c_ctrl  = vga_ctrl.cnt_c;
    // wire        re_en       = vga_ctrl.re_en;
    // wire        valid       = vga_ctrl.valid;
    

    vag_colorbar vag_colorbar_inst(
        .clk(clk),
        .rst(rst),

        .led(led),
        .hsync(hsync),
        .vsync (vsync),
        .rgb(rgb)
    );

endmodule
