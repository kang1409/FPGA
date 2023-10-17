`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
// Design Name: 
// Module Name: vga_ctrl
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


module vga_ctrl(
    input   wire         clk,
    input   wire         rst,
    input   wire [11:0]  pi_data,    //像素点色彩信息
    
    output  wire [10:0]  pi_x,       //用以约束
    output  wire [10:0]  pi_y,
    output  wire         hsync,
    output  wire         vsync,
    output  wire [11:0]  rgb         //RGB图像色彩信息
    );

    parameter H_MAX = 11'd1688;
    parameter C_MAX = 11'd1066;
    parameter PI_X_MAX = 11'd1280;
    parameter PI_Y_MAX = 11'd1024;

    parameter H_SYNAC = 11'd112;
    parameter H_BACK = 11'd248;
    parameter H_LEFT  = 11'd0;
    parameter H_VIDEO = 11'd1280;
    parameter H_RIGHT = 11'd0;
    parameter H_FRONT = 11'd48;
    
    parameter C_SYNAC = 11'd3;
    parameter C_BACK = 11'd38;
    parameter C_TOP  = 11'd0;
    parameter C_VIDEO = 11'd1024;
    parameter C_BOTTOM = 11'd0;
    parameter C_FRONT = 11'd1;

    reg [10:0]  cnt_h;  //行计数器
    reg [10:0]  cnt_c;  //场计数器
    wire        re_en;  //像素信息请求 re_en
    wire        valid;  //vga有效区域

    //产生一个计数器，记到0~1687
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_h <= 11'd0;
        else if(cnt_h == H_MAX - 1'b1)
            cnt_h <= 11'd0;
        else 
            cnt_h <= cnt_h + 1'b1;
    end

    //产生一个计数器， 0~1065
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_c <= 11'd0;
        else if(cnt_c == C_MAX - 1'b1)
            cnt_c <= 11'd0;
        else 
            cnt_c <= cnt_c + 1'b1;
    end

    //行同步信号
    assign hsync = {cnt_h <= H_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //场同步信号
    assign vsync = {cnt_c <= C_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //像素信息请求 re_en
    assign re_en = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT-1'b1))                                //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO-1'b1)))                     //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c >= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //vga有效区域 valid
    assign valid = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT))                                     //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO)))                          //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c >= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //pi_x
    assign pi_x = {re_en == 1'b1} ? {cnt_h - (H_SYNAC+H_BACK+H_LEFT-1'b1)} : 11'd0;
    //pi_y
    assign pi_y = {re_en == 1'b1} ? {cnt_c - (C_SYNAC+C_BACK+C_TOP)} : 11'd0;
    //rgb
    assign rgb = {valid == 1'b1} ? pi_data : 12'd0;
endmodule
