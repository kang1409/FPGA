`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 20:27:49
// Design Name: 
// Module Name: ram
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


module ram(
    input wire          clk,
    input wire [7:0]    addra,      //输入ram读写地址
    input wire [7:0]    dina,       //输入ram写入地址
    input wire          wea,        //输入ram写使能
    output wire [7:0]   douta       //输出读ram数据
    );

    ram_256x8 ram_256x8_inst(
        .clka(clk),
        .addra(addra),
        .dina(dina),
        .wea(wea),
        .douta(douta)
    );
endmodule
