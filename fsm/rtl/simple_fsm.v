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
    input wire sys_clk,     //ʱ��
    input wire sys_rst_n,   //��λ��
    input wire pi_money,    //Ͷ�Ҽ�

    output reg po_cola      //���ֵ����
    );

    //ֻ������״̬��ʹ�ö����룻
    parameter NULL = 3'b001;
    parameter ONE = 3'b010;
    parameter TWO = 3'b100;


    reg [2:0] state;

    //��һ��״̬�������������ת����һ��״̬��
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

    //�ڶ���״̬�������� stateӰ��po_cola;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            po_cola <= 1'b0;
        else if (state == TWO && pi_money == 1'b1)
            po_cola <= 1'b1;
        else
            po_cola <= 1'b0;
    end
endmodule
