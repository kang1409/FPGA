`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/06 22:08:26
// Design Name: 
// Module Name: tb_rs232
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


module tb_rs232();
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

    always #10 clk = ~clk;

    initial begin
        rx_bit(8'd0);
        rx_bit(8'd1);
        rx_bit(8'd2);
        rx_bit(8'd3);
        rx_bit(8'd4);
        rx_bit(8'd5);
        rx_bit(8'd6);
        rx_bit(8'd7);
    end

    task rx_bit(
        input [7:0] data
    );

    integer i;

    for (i = 0; i<10; i=i+1) begin
        case (i)
            0:rx <= 1'b0;
            1:rx <= data[0];
            2:rx <= data[1];
            3:rx <= data[2];
            4:rx <= data[3];
            5:rx <= data[4];
            6:rx <= data[5];
            7:rx <= data[6];
            8:rx <= data[7];
            9:rx <= 1'b1;
            default: rx <= 1'b1;
        endcase
        # (10416*10);
    end

    uart_rx uart_rx_inst(
        .clk(clk),
        .rst(rst),
        .rx(rx),

        .po_data(po_data),
        .po_data_flag(po_data_flag)
    );
endmodule
