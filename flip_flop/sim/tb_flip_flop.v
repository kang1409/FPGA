`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 18:57:01
// Design Name: 
// Module Name: tb_flip_flop
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


module tb_flip_flop();
    reg sys_clk;
    reg sys_rst_n;
    reg key_in;

    wire led_out;

    initial begin
        sys_clk = 1;
        sys_rst_n <= 1'b0;
        key_in <= 1'b0;
        #20
        sys_rst_n <= 1'b1;
        #210
        sys_rst_n <= 1'b0;
        #40
        sys_rst_n <= 1'b1;
    end

    always #5 sys_clk = ~sys_clk;

    always #10 key_in <= {$random} % 2;

    initial begin
        $timeformat (-9,0,"ns",6);
        $monitor("@time %t: key_in = %b led_out = %b",$time,key_in,led_out);
    end

    flip_flop flip_flop_inst(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .key_in (key_in),
        .led_out (led_out)
    );

    flip_flop_1 flip_flop_1_inst(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .key_in (key_in),
        .led_out (led_out)
    );


endmodule
