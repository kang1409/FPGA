`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/12 21:52:11
// Design Name: 
// Module Name: key_filter
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


module key_filter
# (
    parameter  CNT_MAX = 20'd999_999
)
(
    input wire key_in,
    input wire sys_clk,
    input wire sys_rst_n,

    output reg key_flag
);

    reg [19:0] cut_20ms;

    always @(posedge sys_clk or negedge sys_rst_n ) begin
        if (sys_rst_n == 1'b0)
            cut_20ms <= 20'b0;
        else if(key_in == 1'b1)
            cut_20ms <= 20'b0;
        else if (key_in == 1'b0 && cut_20ms == CNT_MAX)
            cut_20ms <= cut_20ms;
        else
            cut_20ms <= cut_20ms + 1'b1;
    end

    always @(negedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            key_flag <= 1'b0;
        else if(cut_20ms == CNT_MAX - 1'b1)
            key_flag <= 1'b1;
        else
            key_flag <= 1'b0;
    end
endmodule
