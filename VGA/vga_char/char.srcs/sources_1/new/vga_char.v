`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
// Design Name: 
// Module Name: vga_char
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


module vga_char(
    input   wire         clk,
    input   wire         rst,

    output  wire         hsync,
    output  wire         vsync,
    output  wire  [11:0] rgb,                //
    output  reg          led
    );

    //通过调用IP核产生108MHZ时钟信号，对应1280x1024@60
    wire    clk_108;
    wire    locked;
    wire    rst_n;

    wire    [11:0] pi_data;
    wire    [10:0] pi_x;
    wire    [10:0] pi_y;



    pll_108 pll_108_inst(
        .clk_in1(clk),
        .reset(rst),

        .locked(locked),
        .clk_out1(clk_108)
    );
    assign rst_n = (rst | ~locked);

    always @(posedge clk_108 or posedge rst_n) begin
        if(rst_n == 1'b1)
            led <= 1'b0;
        else 
            led <= 1'b1;
    end

endmodule
