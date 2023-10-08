`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/06 19:32:12
// Design Name: 
// Module Name: uart_rx
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


module uart_rx
#(
    parameter  UART_BPS = 14'd9600,
    parameter  CLK      = 27'd100_000_000
)(
    input wire clk,
    input wire rst,
    input wire rx,

    output reg [7:0] po_data,
    output reg       po_data_flag
    );
    localparam BAUD_CNT_MAX = CLK / UART_BPS;
    localparam CNT_BIT_MAX = 4'd9;

    reg rx_reg1;
    reg rx_reg2;
    reg rx_reg3;

    reg stat_work;
    reg work_en;

    reg [13:0]  cnt;
    reg [3:0]   cnt_bit;

    reg         bit_flag;
    reg [7:0]   rx_data;
    reg         rx_flag;
    //通过二级寄存器消除亚稳态
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            rx_reg1 <= 1'b1;
        else
            rx_reg1 <= rx;
    end

    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            rx_reg2 <= 1'b1;
        else
            rx_reg2 <= rx_reg1;
    end

    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            rx_reg3 <= 1'b1;
        else
            rx_reg3 <= rx_reg2;
    end

    //reg2 与  reg3  下降沿判断
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            stat_work <= 1'b0;
        else if(((~rx_reg2) && (rx_reg3)) == 1'b1)
            stat_work <= 1'b1;
        else 
            stat_work <= 1'b0;
    end

    //就收数据使能信号   work_en
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            work_en <= 1'b0;
        else if(stat_work == 1'b1) 
            work_en <= 1'b1;
        else if((bit_flag == 1'b1) && (cnt_bit == 4'd8))
            work_en <= 1'b0;
        else 
            work_en <= work_en;

    end

    //计数器 0~BAUD_CNT_MAX
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            cnt <= 1'b0;
        else if(cnt == BAUD_CNT_MAX)
            cnt <= 1'b0;
        else if(work_en == 1'b1)
            cnt <= cnt + 1'b1;
        else 
            cnt <= 1'b0;
    end
    //计数器比特数
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            cnt_bit <= 1'b0;
        else if((cnt_bit == 4'd8) && (bit_flag == 1'b1))
            cnt_bit <= 1'b0;
        else if(cnt == BAUD_CNT_MAX - 1'b1)
            cnt_bit <= cnt_bit + 1'b1;
        else 
            cnt_bit <= cnt_bit;
    end

    // 计数器中间时数据最稳定,标志信号 可对除法进行优化
    always @( negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            bit_flag <= 1'b0;
        else if(cnt == (BAUD_CNT_MAX / 2) - 1)
            bit_flag <= 1'b1;
        else 
            bit_flag <= 1'b0;
    end

    //拿取数据进行移位拼凑;
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            rx_data <= 8'b0;
        else if((bit_flag == 1'b1) && (cnt_bit >= 4'd1) && (cnt_bit <= 4'd8)) 
            rx_data <= {rx_reg3, rx_data[7:1]};
        else
            rx_data <= rx_data;
    end

    // 取到完整数据之后。生成标志信号
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            rx_flag <= 1'b0;
        else if((bit_flag == 1'b1) && (cnt_bit == 4'd8))
            rx_flag <= 1'b1;
        else 
            rx_flag <= 1'b0;
    end

    //输出数据与标志信号
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            po_data <= 8'd0;
        else if(rx_flag == 1'b1)
            po_data <= rx_data;
        else 
            po_data <= po_data;
    end
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            po_data_flag <= 1'b0;
        else 
            po_data_flag <= rx_flag;
    end
endmodule
