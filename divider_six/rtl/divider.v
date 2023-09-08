`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/06 13:26:10
// Design Name: 
// Module Name: divider
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


module divider(
    input wire sys_clk,
    input wire sys_rst_n,
    input reg clk_flag,
    output wire led_out
    );

    reg [2:0] cnt;

    //计数器记0——5下降沿
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt <= 3'b0;
        else if(cnt == 3'd5)
            cnt <= 3'b0;
        else
            cnt <= cnt + 1'b1;
    end

    //实现分频
    always @(posedge sys_clk or negedge sys_rst_n ) begin
        if (sys_rst_n == 1'b0)
            clk_flag <= 1'b0;
        else if(cnt == 3'd4)
            clk_flag <= 1'b1;
        else
            clk_flag <= 1'b0;
    end

endmodule
