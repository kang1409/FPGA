module Mux2_1(
    input wire in1,
    input wire in2,
    input wire sel,
    
    output reg out
    );

always @(*)
    if(sel == 1'b1)
        out = in2;
    else
        out = in1;

endmodule