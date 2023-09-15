`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 16:43:03
// Design Name: 
// Module Name: seg_dynatic
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


module seg_dynatic
#(
    parameter  CNT_MAX = 26'd49_999_999
)
(
    input   wire            sys_clk,
    input   wire            sys_rst,

    output  reg             led,
    output  reg     [7:0]   sel,
    output  reg     [7:0]   seg0_3,
    output  reg     [7:0]   seg4_7
    );

    wire    cnt_wite ;


endmodule
