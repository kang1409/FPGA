# 数码管的静态点亮

## 理论学习

​			本次使用的是八段数码管；数码管为共阴极数码管，即公共极输入低电平。共阴极由三极管驱动，FPGA需要提供正向信号。同时段选端连接高电平，数码管上的对应位置才可以被点亮。因此，FPGA输出有效的片选信号和段选信号都应该是高电平。

![](F:\project\seg_static\doc\Nixie_tube_8_chart.png)

## ego1数码管引脚分配	

1. 按键按下是高电平。

2. 数码管共有8个分为俩组；

   | 名称   | 原理图标号 | FPGA IO PIN |
   | ------ | ---------- | ----------- |
   | A0     | LED0_CA    | B4          |
   | B0     | LED0_CB    | A4          |
   | C0     | LED0_CC    | A3          |
   | D0     | LED0_CD    | B1          |
   | E0     | LED0_CE    | A1          |
   | F0     | LED0_CF    | B3          |
   | G0     | LED0_CG    | B2          |
   | DP0    | LED0_DP    | D5          |
   | A1     | LED1_CA    | D4          |
   | B1     | LED1_CB    | E3          |
   | C1     | LED1_CC    | D3          |
   | D1     | LED1_CD    | F4          |
   | E1     | LED1_CE    | F3          |
   | F1     | LED1_CF    | E2          |
   | G1     | LED1_CG    | D2          |
   | DP1    | LED1_DP    | H2          |
   | DN0_K1 | LED_BIT1   | G2          |
   | DN0_K2 | LED_BIT2   | C2          |
   | DN0_K3 | LED_BIT3   | C1          |
   | DN0_K4 | LED_BIT4   | H1          |
   | DN1_K1 | LED_BIT5   | G1          |
   | DN1_K2 | LED_BIT6   | F1          |
   | DN1_K3 | LED_BIT7   | E1          |
   | DN1_K4 | LED_BIT8   | G6          |

   位选信号：用于控制哪个数码管亮;
   段选信号：用于控制数码管显示的内容;

   8个位选引脚；

   | DN0_K1 | LED_BIT1 | G2   |
   | ------ | -------- | ---- |
   | DN0_K2 | LED_BIT2 | C2   |
   | DN0_K3 | LED_BIT3 | C1   |
   | DN0_K4 | LED_BIT4 | H1   |
   | DN1_K1 | LED_BIT5 | G1   |
   | DN1_K2 | LED_BIT6 | F1   |
   | DN1_K3 | LED_BIT7 | E1   |
   | DN1_K4 | LED_BIT8 | G6   |

   前四个数码管的段选引脚

   | A0   | LED0_CA | B4   |
   | ---- | ------- | ---- |
   | B0   | LED0_CB | A4   |
   | C0   | LED0_CC | A3   |
   | D0   | LED0_CD | B1   |
   | E0   | LED0_CE | A1   |
   | F0   | LED0_CF | B3   |
   | G0   | LED0_CG | B2   |
   | DP0  | LED0_DP | D5   |

   后四个数码管的段选码引脚

   | A1   | LED1_CA | D4   |
   | ---- | ------- | ---- |
   | B1   | LED1_CB | E3   |
   | C1   | LED1_CC | D3   |
   | D1   | LED1_CD | F4   |
   | E1   | LED1_CE | F3   |
   | F1   | LED1_CF | E2   |
   | G1   | LED1_CG | D2   |
   | DP1  | LED1_DP | H2   |

数码管图像控制十六进制显示

```verilog
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
    parameter   SEG_A = 8'b1000_1000;
    parameter   SEG_B = 8'b1000_0011;
    parameter   SEG_C = 8'b1100_0110;
    parameter   SEG_D = 8'b1010_0001;
    parameter   SEG_E = 8'b1000_0110;
    parameter   SEG_F = 8'b1000_1110;
    parameter   NULL  = 8'b1111_1111;   //不显示状态
```

## 实验内容

​		实现四个数码管的调用，在每隔1秒，切换一次数字，在0~16的六进制来回闪烁；

## 模块设计

​	![image-20230915161431662](F:\project\seg_static\doc\seg_static.png)

### 信号描述

| 信号      | 位宽 | 类型   | 功能        |
| --------- | ---- | ------ | ----------- |
| sys_clk   | 1'b  | input  | 时钟信号    |
| sys_rst_n | 1'b  | input  | 复位信号    |
| sel       | 4'b  | output | 位选码      |
| seg       | 8'b  | output | 段选码      |
| led       | 1'b  | output | led灯的输出 |



## 代码

```verilog
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

    output reg led,
    output reg [7:0] seg,//段选
    output reg [3:0] sel//位选

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
        else if(cnt_wait == CNT_MAX )
            cnt_wait <= 1'b0;
        else
            cnt_wait <= cnt_wait + 1'b1; 
    end

    //获取标志信号
    always @(posedge sys_clk or posedge sys_rst_n) begin
        if (sys_rst_n == 1'b1)
            add_flag <= 1'b0;
        else if(cnt_wait == CNT_MAX - 1)
            add_flag <= 1'b1;
        else 
            add_flag <= 1'b0;
    end

    //灯光闪烁
    always @(posedge sys_clk or posedge sys_rst_n) begin
        if (sys_rst_n == 1'b1)
            led <= 1'b0;
        else if(add_flag == 1'b0)
            led <= 1'b1;
        else 
            led <= 1'b0;
    end
    //num 进行循环
    always @(posedge sys_clk or posedge sys_rst_n) begin
        if (sys_rst_n == 1'b1)
            num <= 4'b0;
        else if (add_flag == 1'b1)
            num <= num + 1'b1;
        else if(num == 4'b1111)
            num <= 4'b0;
        else
            num <= num;
    end

    //sel 选中4个数码管
    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            sel <= 4'b0000;
        else 
            sel <= 4'b1111;
    end

    //将num与seg对应
    always @(posedge sys_clk or posedge sys_rst_n) begin
        if (sys_rst_n == 1'b1)
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

```

![image-20230916181757814](F:\project\seg_static\doc\seg_static_sel.png)

![image-20230916181917531](F:\project\seg_static\doc\seg_static_seg.png)

# 总结

​				在对静态数码管的学习中，应该学会，脱离书籍自己添加一些想法，加入到代码中，从而更好地理解知识点和设计思路。









