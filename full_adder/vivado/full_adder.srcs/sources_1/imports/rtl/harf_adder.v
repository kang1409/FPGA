`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/03 20:17:06
// Design Name: 
// Module Name: harf_adder
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


module harf_adder(
    input wire in1,
    input wire in2,
    
    output wire sum,
    output wire cout
    );
    
    assign {cout, sum} = in1 + in2;
    
endmodule
