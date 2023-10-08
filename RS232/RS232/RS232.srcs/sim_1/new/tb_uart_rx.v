`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/07 14:48:39
// Design Name: 
// Module Name: tb_uart_rx
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
// rx¿ÕÏÐ×´Ì¬ÏÂÖÃ¸ß
//////////////////////////////////////////////////////////////////////////////////


module tb_uart_rx();
    reg clk;
    reg rst;
    reg rx;

    wire [7:0] po_data;
    wire       po_data_flag;

    initial begin
        clk = 1'b1;
        rst <= 1'b1;
        rx <= 1'b1;
        #10;
        rst <= 1'b0;
    end

    initial begin
        #2000;
        rx_bit(8'd1);
        #20000;
        rx <= 1'b1;
        #2000;
        rx_bit(8'd2);
        rx_bit(8'd3);
        rx_bit(8'd4);
        rx_bit(8'd5);
        rx_bit(8'd6);
        rx_bit(8'd7);
        rx_bit(8'd8);
    end

    always #5 clk = ~clk;

    task rx_bit(
        input [7:0] data
    );

        integer i;

        for (i = 0; i<10; i=i+1) begin
            case (i)
                0:rx <= 1'd0;
                1:rx <= data[0];
                2:rx <= data[1];
                3:rx <= data[2];
                4:rx <= data[3];
                5:rx <= data[4];
                6:rx <= data[5];
                7:rx <= data[6];
                8:rx <= data[7];
                9:rx <= 1'b1;
            endcase
            # (10416*10);
        end
    endtask

    wire rx_reg1 = uart_rx.rx_reg1;
    wire rx_reg2 = uart_rx.rx_reg2;
    wire rx_reg3 = uart_rx.rx_reg3;
    wire [13:0] cnt = uart_rx.cnt;
    wire [4:0] cnt_bit = uart_rx.cnt_bit;
    wire bit_flag = uart_rx.bit_flag;

    wire work_en = uart_rx.work_en;

    uart_rx uart_rx_inst(
        .clk(clk),
        .rst(rst),
        .rx(rx),

        .po_data(po_data),
        .po_data_flag(po_data_flag)
    );

endmodule
