`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/01 20:07:33
// Design Name: 
// Module Name: tb_decoder3_8
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


module tb_decoder3_8();
    reg in1;
    reg in2;
    reg in3;
    
    wire [7:0] out;
    
    initial begin
    in1 <= 1'b0;
    in2 <= 1'b0;
    in3 <= 1'b0;
    end 
    
    always #10 in1 <= {$random} % 2;
    always #10 in2 <= {$random} % 2;
    always #10 in3 <= {$random} % 2;
    
    initial begin
        $timeformat(-9,0,"ns",6);
        $monitor("@time %t : in1=%b, in2=%b, in3=%b, out=%b",$time,in1,in2,in3,out);
    end 
    
    decoder3_8  decoder3_8_ins(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out(out)
    );
endmodule
