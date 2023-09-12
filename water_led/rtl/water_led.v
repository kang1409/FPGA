`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/06 14:30:09
// Design Name: 
// Module Name: water_led
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


module water_led
#(
    parameter CNT_MAX = 27'd99_999_999
)
(
    input wire sys_clk,
    input wire sys_rst_n,

    output wire [7:0]led_out
    );

    reg [26:0] cnt;
    reg cnt_flag;
    reg [7:0] led_out_reg;

    always @(posedge sys_clk or negedge sys_rst_n ) begin
        if(sys_rst_n == 1'b1)
            cnt <=27'b0;
        else if(cnt == CNT_MAX)
            cnt <= 17'b0;
        else
            cnt <= cnt + 1'b1;
    end

    always @(posedge sys_clk or negedge sys_rst_n ) begin
        if(sys_rst_n == 1'b1)
            cnt_flag <= 1'b0;
        else if(cnt == CNT_MAX-1)
            cnt_flag <= 1'b1;
        else
            cnt_flag <= 1'b0; 
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b1)
            led_out_reg <= 8'b00_000_001;
        else if(led_out_reg == 8'b10_000_000 && cnt_flag == 1'b1)
            led_out_reg <= 8'b00_000_001;
        else if(cnt_flag == 1'b1)
            led_out_reg <= led_out_reg << 1'b1;
    end

    assign led_out = led_out_reg;

endmodule
