`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/01 20:07:06
// Design Name: 
// Module Name: decoder3_8
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


module decoder3_8(
    input   wire in1,
    input   wire in2,
    input   wire in3,

    output  reg [7:0]  out
    );
    
    always @(*)
    if ({in1, in2, in3} == 3'b000)
        out = 0000_0001;
    else if ({in1, in2, in3} == 3'b001)
        out = 0000_0010;
    else if ({in1, in2, in3} == 3'b010)
        out = 0000_0100;
    else if ({in1, in2, in3} == 3'b011)
        out = 0000_1000;
    else if ({in1, in2, in3} == 3'b100)
        out = 0001_0000;
    else if ({in1, in2, in3} == 3'b101)
        out = 0010_0000;
    else if ({in1, in2, in3} == 3'b110)
        out = 0100_0000;
    else if ({in1, in2, in3} == 3'b111)
        out = 1000_0000;
    else                            //防止产生大量的冗余逻辑和锁存器
        out = 0000_0001; 
endmodule
