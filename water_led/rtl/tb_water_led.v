`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/06 14:56:22
// Design Name: 
// Module Name: tb_water_led
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


module tb_water_led();
    wire  [7:0] led_out;
    reg sys_clk;
    reg sys_rst_n;
    
    initial begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        #20
        sys_rst_n <= 1'b1;
    end

    always #5 sys_clk = ~sys_clk;

    water_led
    #(
        .CNT_MAX (27'd24)
    )
    water_led_inst
    (
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .led_out (led_out)
    );

endmodule
