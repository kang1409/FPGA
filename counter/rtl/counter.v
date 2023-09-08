`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 21:50:06
// Design Name: 
// Module Name: counter
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


module counter

    #(    
    //Ê±ÖÓÆµÂÊ100MHz 1/100_000_000s
    parameter  CNT_MAX = 27'd99_999_999
    )
    (   
    input wire sys_clk,
    input wire sys_rst_n,

    output reg led_out
    );

    reg [26:0] cnt;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            cnt <= 27'b0;
        else
            cnt <= cnt + 1'b1; 
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            led_out <= 1'b0;
        else if(cnt == CNT_MAX)
            led_out <= ~led_out;
        
    end
endmodule
