`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/21 19:31:32
// Design Name: 
// Module Name: scfifo
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


module scfifo(

    input wire          clk,
    input wire          rst,
    input wire [7:0]    pi_data,        //���붥��ģ������ݣ�����FIFO������
    input wire          pi_flag,        //����������Ч��־�ź�,Ҳ��д�����ź�
    inout wire          rd_en,          //FIFO�������ź�
    
    output wire [7:0]   po_data,        //FIFO����������
    output wire         empty,          //FIFO�ձ�־�źţ�����Ч��
    output wire         full,           //FIFO����־�źţ�����Ч��
    output wire [7:0]   data_count      //FIFO���ڵĸ���
    );

    scfifo_256x8 scfifo_256x8_inst(
        .clk(clk),
        .srst(rst),
        .din(pi_data),
        .wr_en(pi_flag),
        .rd_en(rd_en),
        
        .dout(po_data),
        .full(full),
        .empty(empty),
        .data_count(data_count)
    );
endmodule
