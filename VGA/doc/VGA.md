# VGA

## VGA 显示原理

VGA图像显示是通过扫描的方式，让图像在显示器上显示出来；在行同步和场同步的作用下，从上到下，从左到右的顺序扫描到显示器上；借助视觉停留的原理，我们看到的就是一副图像；

## VGA时序标准

为了匹配不同的厂家显示器，VGA有一套VGA时序标准；

1. 行同步时序
2. 场同步时序

### 行同步时序

一个完整的行扫描周期包括：Sync（同步）、Back Porch（后沿）、Left Border（左边框）、Addressable Video（有效图像）、Right Border（右边框）、Front Porch（前沿），这六部分的基本单位是像素，即一个像素周期； 

HSync在Sync时维持高电平，在其他时刻维持低电平；？？（在实际操作中也可进行反向）

### 场同步时序

一个完整的场扫描周期包括：Sync（同步）、Back Porch（后沿）、Top Border（上边框）、Addressable Video（有效图像）、Bottom Border（底边框）、Front Porch（前沿），这六部分的基本单位是行，即一个完整的行扫描周期； 

VSync在Sync时维持高电平，在其他时刻维持低电平；？？（在实际操作中也可进行反向）

## VGA 显示参数

| 显示模式     | 时钟(MHZ) | 行同步 | 行后沿 | 行左边框 | 行有效图像 | 行右边框 | 行前沿 | 行扫描周期 | 场同步 | 场后沿 | 场上边框 | 场有效图像 | 场底边框 | 场前沿 | 场扫描周期 |
| ------------ | --------- | ------ | ------ | -------- | ---------- | -------- | ------ | ---------- | ------ | ------ | -------- | ---------- | -------- | ------ | ---------- |
| 640X480@60   | 25.175    | 96     | 40     | 8        | 640        | 8        | 8      | 800        | 2      | 25     | 8        | 480        | 8        | 2      | 525        |
| 640X480@75   | 31.5      | 64     | 120    | 0        | 640        | 0        | 16     | 840        | 3      | 16     | 0        | 480        | 0        | 1      | 500        |
| 800X600@60   | 40        | 128    | 88     | 0        | 800        | 0        | 40     | 1056       | 4      | 23     | 0        | 600        | 0        | 1      | 628        |
| 800X600@75   | 49.5      | 80     | 160    | 0        | 800        | 0        | 16     | 1056       | 3      | 21     | 0        | 600        | 0        | 1      | 625        |
| 1024X768@60  | 65        | 136    | 160    | 0        | 1024       | 0        | 24     | 1344       | 6      | 29     | 0        | 768        | 0        | 3      | 806        |
| 1024X768@75  | 78.8      | 176    | 176    | 0        | 1024       | 0        | 16     | 1312       | 3      | 28     | 0        | 768        | 0        | 1      | 800        |
| 1280X1024@60 | 108       | 112    | 248    | 0        | 1280       | 0        | 48     | 1688       | 3      | 38     | 0        | 1024       | 0        | 1      | 1066       |

**时钟频率** = 行扫描周期 * 场扫描周期 * 刷新率；   25.175 = 800 * 525 * 60；

## VGA 静态显示

### 实验目标

编写VGA 驱动，使用EGO1 驱动VGA　在屏幕上显示１０条等宽彩条；

### 注意

时序模块计算

```verilog
always @(posedge clk or posedge rst) begin
if(rst == 1'b1)
hsync <= 1'b0;
else if((cnt_h >= 11'd0) && (cnt_h <= H_SYNAC-1'b1))
hsync <= 1'b1;
else
hsync <= 1'b0;
end
```

逻辑模块计算

```verilog
assign hsync = {cnt_h <= H_SYNAC-1'b0} ? 1'b1 : 1'b0 ;
```

### 流程框图

<img src="F:\project\VGA\doc\ｖｇａ＿ｃｏｌｏｂａｒ.png" alt="image-20230926201428960" style="zoom: 67%;" />

### 信号描述

| 信号  | 位宽 | 类型   | 功能       |
| ----- | ---- | ------ | ---------- |
| clk   | 1'b  | input  | 时钟信号   |
| rst   | 1'b  | input  | 复位信号   |
| hsync | 1'b  | output | 行同步信号 |
| vsync | 1'b  | output | 场同步信号 |
| rgb   | 12'b | output | 图像信号   |



### 代码实现

#### vga_pic

该模块实现图像信号；

| 信号    | 位宽 | 类型   | 功能         |
| ------- | ---- | ------ | ------------ |
| clk     | 1'b  | input  |              |
| rst     | 1'b  | input  |              |
| pi_x    | 11'b | input  | 像素点横坐标 |
| pi_y    | 11'b | input  | 像素点纵坐标 |
| pi_data | 12'b | output | 图像信号     |

#### 代码实现

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:37:30
// Design Name: 
// Module Name: vga_pic
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


module vga_pic(
    input wire clk,
    input wire rst,
    input wire [10:0] pi_x,
    input wire [10:0] pi_y,
    
    output reg [11:0] pi_data 
    );

    parameter   H_VALID = 11'd1280,
                C_VALID = 11'd1024;

    parameter   RED     = 12'hF80,
                ORANGE  = 12'hFC0,
                YELLOW  = 12'hFFE,
                GREEN   = 12'h07E,
                CYAN    = 12'h07F,
                BLUE    = 12'h01F,
                PURPPLE = 12'hF81,
                BLACK   = 12'h000,
                WHITE   = 12'hFFF,
                GRAY    = 12'hD69;

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_data <= WHITE;
        else if ((pi_x >= 11'd0) && (pi_x <= H_VALID / 10))
            pi_data <= ORANGE;
        else if ((pi_x >= H_VALID / 10 * 1) && (pi_x <= H_VALID / 10 * 2))
            pi_data <= YELLOW;
        else if ((pi_x >= H_VALID / 10 * 2) && (pi_x <= H_VALID / 10 * 3))
            pi_data <= GREEN;
        else if ((pi_x >= H_VALID / 10 * 3) && (pi_x <= H_VALID / 10 * 4))
            pi_data <= CYAN;
        else if ((pi_x >= H_VALID / 10 * 4) && (pi_x <= H_VALID / 10 * 5))
            pi_data <= BLUE;
        else if ((pi_x >= H_VALID / 10 * 5) && (pi_x <= H_VALID / 10 * 6))
            pi_data <= PURPPLE;
        else if ((pi_x >= H_VALID / 10 * 6) && (pi_x <= H_VALID / 10 * 7))
            pi_data <= BLACK;
        else if ((pi_x >= H_VALID / 10 * 7) && (pi_x <= H_VALID / 10 * 8))
            pi_data <= WHITE;
        else if ((pi_x >= H_VALID / 10 * 8) && (pi_x <= H_VALID / 10 * 9))
            pi_data <= GRAY;
        else if ((pi_x >= H_VALID / 10 * 9) && (pi_x <= H_VALID))
            pi_data <= RED;
        else
            pi_data <= BLACK;
    end
    
endmodule

```

#### vga_ctrl

| 信号    | 位宽 | 类型   | 功能           |
| ------- | ---- | ------ | -------------- |
| clk     | 1'b  | input  |                |
| rst     | 1'b  | input  |                |
| pi_data | 12'b | input  | 图像信号       |
| pi_x    | 11'b | output | 像素点横坐标   |
| pi_y    | 11'b | output | 像素点纵坐标   |
| hsync   | 1'b  | output | 行同步信号     |
| vsync   | 1'b  | output | 场同步信号     |
| rgb     | 12'b | output | 最终的图像信号 |

#### 代码实现

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:34:54
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
        else if((cnt_c == C_MAX - 1'b1)&&(cnt_h == C_MAX - 1'b1))
            cnt_c <= 11'd0;
        else if(cnt_h == H_MAX - 1'b1)
            cnt_c <= cnt_c + 1'b1;
        else 
            cnt_c <= cnt_c;
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
                     &&(cnt_c <= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //pi_x
    assign pi_x = {re_en == 1'b1} ? {cnt_h - (H_SYNAC + H_BACK + H_LEFT - 1'b1)} : 11'd0;
    //pi_y
    assign pi_y = {re_en == 1'b1} ? {cnt_c - (C_SYNAC + C_BACK + C_TOP)} : 11'd0;
    //rgb
    assign rgb = {valid == 1'b1} ? pi_data : 12'd0;
endmodule

```

#### vga_colobar

顶层模块

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:32:14
// Design Name: 
// Module Name: vag_colorbar
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


module vag_colorbar(
    input   wire         clk,
    input   wire         rst,

    output  wire         hsync,
    output  wire         vsync,
    output  wire  [11:0] rgb,                //
    output  reg          led
    );

    //通过调用IP核产生108MHZ时钟信号，对应1280x1024@60
    wire    clk_108;
    wire    locked;
    wire    rst_n;

    wire    [11:0] pi_data;
    wire    [10:0] pi_x;
    wire    [10:0] pi_y;



    pll_108 pll_108_inst(
        .clk_in1(clk),
        .reset(rst),

        .locked(locked),
        .clk_out1(clk_108)
    );
    assign rst_n = (rst | ~locked);

    always @(posedge clk_108 or posedge rst_n) begin
        if(rst_n == 1'b1)
            led <= 1'b0;
        else 
            led <= 1'b1;
    end
    // wire [11:0] rgb1;
    //VGA时序控制模块vga_ctrl
    vga_ctrl vga_ctrl_inst (
        .clk(clk_108),
        .rst (rst_n),
        .pi_data(pi_data),

        .pi_x(pi_x),
        .pi_y(pi_y),
        .hsync(hsync),
        .vsync(vsync),
        .rgb(rgb)
    );
    // assign rgb = 12'hFFE;
    //图像数据产生模块vga_pic
    vga_pic vga_pic_inst(
        .clk(clk_108),
        .rst(rst_n),
        .pi_x(pi_x),
        .pi_y(pi_y),

        .pi_data(pi_data)
    );
endmodule

```

## VGA 字符显示