`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 16:37:49
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input wire in1,
    input wire in2,
    input wire cin,
    
    output wire sum,
    output wire cout
    );
    wire harf1_cout;
    wire harf2_cout;
    wire h1_sum;
    
    harf_adder  harf_adder1(
        .in1    (in1),
        .in2    (in2),
        
        .cout   (harf1_cout),
        .sum    (h1_sum)
    );
    
    harf_adder  harf_adder2(
        .in1    (h1_sum),
        .in2    (cin),
        
        .sum    (sum),
        .cout   (harf2_cout)
    );
    
    assign cout = harf1_cout | harf2_cout;
    
endmodule
