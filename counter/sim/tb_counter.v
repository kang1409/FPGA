`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 21:50:31
// Design Name: 
// Module Name: tb_counter
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


module tb_counter();
    reg sys_clk;
    reg sys_rst_n;
    wire led_out;

    initial begin
        sys_clk = 1;
        sys_rst_n <= 1'b0;
        #20
        sys_rst_n <= 1'b1;
    end

    always #5 sys_clk = ~sys_clk;
//每隔5ns翻转一次，产生100MHz的时钟信号；

    counter 
    #(
        .CNT_MAX (27'd24)
    )
    counter_inst(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .led_out (led_out)
    );


endmodule
