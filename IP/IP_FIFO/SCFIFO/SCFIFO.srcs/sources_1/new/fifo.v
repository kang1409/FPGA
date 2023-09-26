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
    input wire [7:0]    pi_data,        //输入顶层模块的数据，输入FIFO的数据
    input wire          pi_flag,        //输入数据有效标志信号,也是写请求信号
    inout wire          rd_en,          //FIFO读请求信号
    
    output wire [7:0]   po_data,        //FIFO读出的数据
    output wire         empty,          //FIFO空标志信号，高有效；
    output wire         full,           //FIFO满标志信号，高有效；
    output wire [7:0]   data_count      //FIFO存在的个数
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
