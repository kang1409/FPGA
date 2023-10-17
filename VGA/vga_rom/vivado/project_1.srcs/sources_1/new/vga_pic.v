`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
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
    
    wire [11:0] douta;

    parameter H_MAX = 11'd1688;
    parameter C_MAX = 11'd1066;
    parameter PI_X_MAX = 11'd1280;
    parameter PI_Y_MAX = 11'd1024; 

    reg [14:0] addra;

    reg rom_en;
    always @(posedge clk or posedge rst ) begin
        if(rst == 1'b1)
            rom_en <= 1'b0;
        else if(((pi_x >= 11'd1) && (pi_x < 11'd100)) && ((pi_y >= 11'd1) && (pi_y <= 11'd100)))
            rom_en <= 1'b1;
        else 
            rom_en <= 1'b0;
    end 

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            addra <= 1'b0;
        else if(rom_en == 1'b1)
            addra <= (((pi_y - 1'b1) * 11'd100) + pi_x);
        else 
            addra <= 1'b0;
    end

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_data <= 12'b0;
        else if(rom_en == 1'b1)
            pi_data <= douta;
        else 
            pi_data <= 12'b0;
    end

    rom_vga rom_vga_inst
   (
    .clka   (clk),
    .addra   (addra),

    .douta   (douta)
    );
endmodule
