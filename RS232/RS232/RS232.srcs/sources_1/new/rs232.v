`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/06 19:33:36
// Design Name: 
// Module Name: rs232
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
// rx 接收数据 ；tx 发送数据
// 空闲状态时为高电平
//每bit数据在100MHZ时钟下要计数10416次
//////////////////////////////////////////////////////////////////////////////////


module rs232
(
    input wire clk,
    input wire rst,
    input wire rx,

    output wire tx
    );

    wire [7:0] data;
    wire       flag;

    parameter  UART_BPS = 14'd9600;
    parameter  CLK      = 27'd100_000_000;

    uart_rx     
    #(
        .UART_BPS (UART_BPS),
        .CLK      (CLK)
    )
    uart_rx_inst
    (

        .clk(clk),
        .rst(rst),
        .rx(rx),

        .po_data(data),
        .po_data_flag(flag)
    );

    uart_tx 
    #(
        .UART_BPS (UART_BPS),
        .CLK      (CLK)
    ) 
    uart_tx_inst
   (
        .clk(clk),
        .rst(rst),
        .pi_data(data),
        .pi_data_flag(flag),

        .tx(tx)
    );
    
endmodule
