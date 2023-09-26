`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/21 20:18:11
// Design Name: 
// Module Name: tb_scfifo
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


module tb_scfifo();

    reg          clk;
    reg          rst;
    reg [7:0]    pi_data;        //���붥��ģ������ݣ�����FIFO������
    reg          pi_flag;        //����������Ч��־�ź�,Ҳ��д�����ź�
    reg          rd_en;          //FIFO�������ź�
    
    wire [7:0]   po_data;        //FIFO����������
    wire         empty;          //FIFO�ձ�־�źţ�����Ч��
    wire         full;           //FIFO����־�źţ�����Ч��
    wire [7:0]   data_count;      //FIFO���ڵĸ���

    reg [1:0]   cnt_baud;

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #20
        rst = 1'b0;
    end

    always #5 clk = ~clk;

    //����4
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            cnt_baud <= 2'b00;
        else if(cnt_baud == 2'b10)
            cnt_baud <= 2'b00;
        else
            cnt_baud <= cnt_baud + 1'b1;
    end

    //����������Ч��־�ź�,Ҳ��д�����ź�
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_flag <= 1'b0;
        else if(cnt_baud == 2'b01)
            pi_flag <= 1'b1;
        else
            pi_flag <= 1'b0;
    end

    //���붥��ģ������ݣ�����FIFO������
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_data <= 8'b0;
        else if((pi_data == 8'd255) && (pi_flag == 1'b1))
            pi_data <= 8'b0;
        else if(pi_flag == 1'b1)
            pi_data <= pi_data + 1'b1;
    end

    //FIFO�������ź�
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            rd_en <= 1'b0;
        else if(full == 1'b1)
            rd_en <= 1'b1;
        else if(empty == 1'b1)
            rd_en <= 1'b0;
    end

    scfifo scfifo_inst(
        .clk        (clk),
        .rst        (rst),
        .pi_data    (pi_data),
        .pi_flag    (pi_flag),
        .rd_en      (rd_en),
        .po_data    (po_data),
        .full       (full),
        .empty      (empty),
        .data_count (data_count)
    );
endmodule
