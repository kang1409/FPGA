`timescale 1ns / 1ns
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

    wire tx;

    initial begin
        clk = 1'b1;
        rst <= 1'b1;
        rx <= 1'b1;
        #10;
        rst <= 1'b0;
    end

    initial begin
        #2000;
        // rx_bit(8'd1);
        // #20000;
        // rx <= 1'b1;
        // #2000;
        // rx_bit(8'd2);
        // rx_bit(8'd3);
        rx_bit(8'd0);
        # (10416*10);
        rx_bit(8'd1);
        # (10416*20);
        rx_bit(8'd2);
        # (10416*30);
        rx_bit(8'd3);
        # (10416*1000);
        rx_bit(8'd4);
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

    wire [7:0] data = rs232.data;
    wire       flag = rs232.flag;
    wire       work_en = uart_tx.work_en;
    wire [13:0] cnt = uart_tx.cnt;
    wire [3:0] bit_cnt = uart_tx.bit_cnt;

    rs232 rs232_inst(
        .clk(clk),
        .rst(rst),
        .rx(rx),

        .tx(tx)
    );
endmodule
