`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/13 20:37:19
// Design Name: 
// Module Name: seg_ststic
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


module seg_ststic
#(
    parameter CNT_MAX = 27'd99_999_999
)(
    input wire sys_clk,
    input wire sys_rst_n,

    output reg [7:0] seg,//段选
    output reg [7:0] sel//位选

    );

    parameter   SEG_0 = 8'b1100_0000;
    parameter   SEG_1 = 8'b1111_1001;
    parameter   SEG_2 = 8'b1010_0100;
    parameter   SEG_3 = 8'b1011_0000;
    parameter   SEG_4 = 8'b1001_1001;
    parameter   SEG_5 = 8'b1001_0010;
    parameter   SEG_6 = 8'b1000_0010;
    parameter   SEG_7 = 8'b1111_1000;
    parameter   SEG_8 = 8'b1000_0000;
    parameter   SEG_9 = 8'b1001_0000;
    parameter            SEG_A = 8'b1000_1000;
    parameter            SEG_B = 8'b1000_0011;
    parameter            SEG_C = 8'b1100_0110;
    parameter            SEG_D = 8'b1010_0001;
    parameter            SEG_E = 8'b1000_0110;
    parameter            SEG_F = 8'b1000_1110;
    parameter   NULL  = 8'b1111_1111;   //不显示状态

    reg         add_flag ;
    reg [26:0]  cnt_wait ;
    reg [3:0]   num      ;

    //1秒计数器
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt_wait <= 1'b0;
        else if(cnt_wait == CNT_MAX )
            cnt_wait <= 1'b0;
        else
            cnt_wait <= cnt_wait + 1'b1; 
    end

    //获取标志信号
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            add_flag <= 1'b0;
        else if(cnt_wait == CNT_MAX-1)
            add_flag <= 1'b1;
        else 
            add_flag <= 1'b0;
    end

    //num 进行循环
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            num <= 4'b0;
        else if (add_flag == 1'b1)
            num <= num + 1'b0;
        else if(num == 4'b1111)
            num <= 4'b0;
        else
            num <= num;
    end

    //sel 选中8个数码管
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            sel <= 8'b00000000;
        else 
            sel <= 8'b11111111;
    end

    //将num与seg对应
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            seg <= NULL;
        else 
            case (num)
                4'd0: seg <= SEG_0;
                4'd1: seg <= SEG_1;
                4'd2: seg <= SEG_2;
                4'd3: seg <= SEG_3;
                4'd4: seg <= SEG_4;
                4'd5: seg <= SEG_5;
                4'd6: seg <= SEG_6;
                4'd7: seg <= SEG_7;
                4'd8: seg <= SEG_8;
                4'd9: seg <= SEG_9;
                4'd10: seg <= SEG_A;
                4'd11: seg <= SEG_B;
                4'd12: seg <= SEG_C;
                4'd13: seg <= SEG_D;
                4'd14: seg <= SEG_E;
                4'd15: seg <= SEG_F;
                default:seg <= NULL; 
            endcase
    end
                
endmodule
