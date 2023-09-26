`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:37:30
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

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_data <= WHITE;
        else if ((pi_x >= 11'd0) && (pi_x <= H_VALID / 10))
            pi_data <= ORANGE;
        else if ((pi_x >= H_VALID / 10 * 1) && (pi_x <= H_VALID / 10 * 2))
            pi_data <= YELLOW;
        else if ((pi_x >= H_VALID / 10 * 2) && (pi_x <= H_VALID / 10 * 3))
            pi_data <= GREEN;
        else if ((pi_x >= H_VALID / 10 * 3) && (pi_x <= H_VALID / 10 * 4))
            pi_data <= CYAN;
        else if ((pi_x >= H_VALID / 10 * 4) && (pi_x <= H_VALID / 10 * 5))
            pi_data <= BLUE;
        else if ((pi_x >= H_VALID / 10 * 5) && (pi_x <= H_VALID / 10 * 6))
            pi_data <= PURPPLE;
        else if ((pi_x >= H_VALID / 10 * 6) && (pi_x <= H_VALID / 10 * 7))
            pi_data <= BLACK;
        else if ((pi_x >= H_VALID / 10 * 7) && (pi_x <= H_VALID / 10 * 8))
            pi_data <= WHITE;
        else if ((pi_x >= H_VALID / 10 * 8) && (pi_x <= H_VALID / 10 * 9))
            pi_data <= GRAY;
        else if ((pi_x >= H_VALID / 10 * 9) && (pi_x <= H_VALID))
            pi_data <= RED;
        else
            pi_data <= BLACK;
    end
    
endmodule
