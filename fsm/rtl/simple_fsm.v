`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 16:22:41
// Design Name: 
// Module Name: simple_fsm
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


module simple_fsm(
    input wire sys_clk,     //时钟
    input wire sys_rst_n,   //复位键
    input wire pi_money,    //投币键

    output reg po_cola      //可乐的输出
    );

    //只有四种状态，使用独热码；
    parameter NULL = 3'b001;
    parameter ONE = 3'b010;
    parameter TWO = 3'b100;


    reg [2:0] state;

    //第一个状态机，描述如何跳转到下一个状态；
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            state <= NULL;
        else case (state)
            NULL:if(pi_money == 1'b1)
                    state <= ONE;
                 else
                    state <= NULL;

            ONE: if(pi_money == 1'b1)
                    state <= TWO;
                else
                    state <= ONE;
            
            TWO: if(pi_money == 1'b1)
                    state <= NULL;
                else
                    state <= TWO;
            default: state <= NULL;
        endcase 
    end

    //第二个状态机，描述 state影响po_cola;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            po_cola <= 1'b0;
        else if (state == TWO && pi_money == 1'b1)
            po_cola <= 1'b1;
        else
            po_cola <= 1'b0;
    end
endmodule
