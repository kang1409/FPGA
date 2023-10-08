`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/07 20:39:01
// Design Name: 
// Module Name: tb_uart_tx
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


module tb_uart_tx();
    reg clk ;
    reg rst ;
    reg [7:0] pi_data;
    reg pi_data_flag;

    wire tx;

    initial begin
        clk = 1'b1;
        rst <= 1'b1;

        #20
        rst <= 1'b0;
    end

    initial begin
        pi_data <= 1'b0;
        pi_data_flag <= 1'b0;
        #2000
        pi_data <= 8'b0000_0001;
        pi_data_flag <= 1'b1;
        #10
        pi_data_flag <= 1'b0;

        #(10416 * 10 * 10)
        pi_data <= 8'b0000_0010;
        pi_data_flag <= 1'b1;
        #10
        pi_data_flag <= 1'b0;

        #(10416 * 10 * 10)
        pi_data <= 8'b0000_0100;
        pi_data_flag <= 1'b1;
        #10
        pi_data_flag <= 1'b0;

        #(10416 * 10 * 10)
        pi_data <= 8'b0000_1000;
        pi_data_flag <= 1'b1;
        #10
        pi_data_flag <= 1'b0;

        #(10416 * 10 * 10)
        pi_data <= 8'b0001_0000;
        pi_data_flag <= 1'b1;
        #10
        pi_data_flag <= 1'b0;

    end

    always #5 clk = ~clk;

    wire  [13:0] cnt      = uart_tx.cnt;
    wire  [3:0]bit_cnt    = uart_tx.bit_cnt; 
    wire work_en          = uart_tx.work_en; 

    uart_tx  uart_tx_inst(
        .clk(clk),
        .rst(rst),
        .pi_data(pi_data),
        .pi_data_flag(pi_data_flag),
        
        .tx(tx)
    );
endmodule
