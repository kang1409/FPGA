`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 19:10:03
// Design Name: 
// Module Name: rom
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


module rom(
    input wire clk,
    input wire [7:0]    addra,

    output wire [7:0]   douta
    );

    rom_256x8 rom_256x8_inst(
        .clka (clk),
        .addra (addra),
        .douta (douta)
    );
endmodule
