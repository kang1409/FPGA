`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 16:43:03
// Design Name: 
// Module Name: seg_dynatic
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


module seg_dynatic#(
    parameter CNT_MAX = 27'd49_999_999,
    parameter CNT_MS = 15'd15_000
)(
    input wire sys_clk,
    input wire sys_rst_n,

    output reg [7:0] seg,//段选
    output reg [3:0] sel,//位选

    output reg [7:0] seg2,//段选
    output reg [3:0] sel2//位选

    );

    parameter   SEG_0 = 8'b1111_1100;
    parameter   SEG_1 = 8'b0110_0000;
    parameter   SEG_2 = 8'b1101_1010;
    parameter   SEG_3 = 8'b1111_0010;
    parameter   SEG_4 = 8'b0110_0110;
    parameter   SEG_5 = 8'b1011_0110;
    parameter   SEG_6 = 8'b1011_1110;
    parameter   SEG_7 = 8'b1110_0000;
    parameter   SEG_8 = 8'b1111_1110;
    parameter   SEG_9 = 8'b1111_0110;
    parameter   SEG_A = 8'b1110_1110;
    parameter   SEG_B = 8'b0011_1110;
    parameter   SEG_C = 8'b1001_1100;
    parameter   SEG_D = 8'b0111_1010;
    parameter   SEG_E = 8'b1001_1110;
    parameter   SEG_F = 8'b1000_1110;
    parameter   NULL  = 8'b1111_1111;   //不显示状态

    reg         add_flag ;
    reg [26:0]  cnt_wait ;
    reg [3:0]   num      ;

    //1秒计数器
    always @(posedge sys_clk or posedge sys_rst_n) begin
        if (sys_rst_n == 1'b1)
            cnt_wait <= 1'b0;
        else if(cnt_wait == CNT_MS )
            cnt_wait <= 1'b0;
        else
            cnt_wait <= cnt_wait + 1'b1; 
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            num <= 4'b0001;
        else if(cnt_wait == CNT_MS - 1)
            case (num)
                4'b0001: num <= 4'b0010;
                4'b0010: num <= 4'b0100;
                4'b0100: num <= 4'b1000; 
                default: num <= 4'b0001;
            endcase
        else 
            num <= num;
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            sel <= 4'b1000;
        else
            sel <= num;
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            seg <= NULL;
        else
            case (num)
                4'b0001:  seg <= SEG_3;
                4'b0010:  seg <= SEG_2;
                4'b0100:  seg <= SEG_0;
                4'b1000:  seg <= SEG_2;
                
                default: seg <= NULL;
            endcase
    end
///////////////////////////////////
always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            sel2 <= 4'b1000;
        else
            sel2 <= num;
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            seg2 <= NULL;
        else
            case (num)
                4'b0001:  seg2 <= SEG_7;
                4'b0010:  seg2 <= SEG_1;
                4'b0100:  seg2 <= SEG_9;
                4'b1000:  seg2 <= SEG_0;
                
                default: seg2 <= NULL;
            endcase
    end

endmodule
