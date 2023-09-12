`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 18:56:21
// Design Name: 
// Module Name: flip_flop_1
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


module flip_flop_1(
    input wire sys_clk,
    input wire sys_rst_n,
    input wire key_in,

    output reg led_out
    );

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            led_out <= 1'b0;
        else
            led_out <= key_in;
        
    end
endmodule
