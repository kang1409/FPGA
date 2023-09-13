# 按键消抖

## 理论学习

​			按键是最常见的电子元件，按键开关最常见的是机械弹性按键，当机械触点断开，闭合时。由于机械触点的弹性作用，一个按键在闭合或者断开时不会一次性断开，会出现一些抖动，在波形图中表现为毛刺；

​			当按键数目比较少时，可以使用硬件消抖，及使用俩个非门构成的RS触发器，搭建双稳态电路；

​			当按键数目过多时，应当使用软件消抖，及使用延时程序，抖动时间一般为5~10ms，使用可以产生20ms的延时，检测电路是否稳定；

## 模块框图

![image-20230912213748249](F:\project\key_filter\doc\key_flist_diagram.png)

## 信号描述

| 信号      | 位宽 | 类型   | 功能描述 |
| --------- | ---- | ------ | -------- |
| sys_clk   | 1'b  | input  | 时钟信号 |
| sys_rst_n | 1'b  | input  | 复位信号 |
| key_in    | 1'b  | input  | 按键输入 |
| key_flag  | 1'b  | output | 按键输出 |

## 代码编写

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/12 21:52:11
// Design Name: 
// Module Name: key_filter
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


module key_filter
# (
    parameter  CNT_MAX = 20'd999_999
)
(
    input wire key_in,
    input wire sys_clk,
    input wire sys_rst_n,

    output reg key_flag
);

    reg [19:0] cut_20ms;

    always @(posedge sys_clk or negedge sys_rst_n ) begin
        if (sys_rst_n == 1'b0)
            cut_20ms <= 20'b0;
        else if(key_in == 1'b1)
            cut_20ms <= 20'b0;
        else if (key_in == 1'b0 && cut_20ms == CNT_MAX)
            cut_20ms <= cut_20ms;
        else
            cut_20ms <= cut_20ms + 1'b1;
    end

    always @(negedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            key_flag <= 1'b0;
        else if(cut_20ms == CNT_MAX - 1'b1)
            key_flag <= 1'b1;
        else
            key_flag <= 1'b0;
    end
endmodule

```

## 测试代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/12 22:05:08
// Design Name: 
// Module Name: tb_key_filter
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


module tb_key_filter();

parameter     CNT_1MS  = 20'd19  ,
    CNT_11MS = 21'd69  ,
    CNT_41MS = 22'd149 ,
    CNT_51MS = 22'd199 ,
    CNT_61MS = 22'd249 ;

    reg sys_clk;
    reg sys_rst_n;
    reg key_in;
    reg [21:0] tb_cnt;      //模拟按键抖动计数器

    wire key_flag;

    initial begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        key_in <= 1'b0;
        #20
        sys_rst_n <= 1'b1;
    end

    always #10 sys_clk = ~sys_clk;

    //产生计数器
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            tb_cnt <= 22'b0;
        else if (tb_cnt == CNT_61MS)
            tb_cnt <= 22'b0;
        else
            tb_cnt <= tb_cnt + 22'b1;
    end

    //key_in
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_clk == 1'b0)
            key_in <= 1'b1;
        else if((tb_cnt >= CNT_1MS && tb_cnt <= CNT_11MS) || (tb_cnt >= CNT_41MS && tb_cnt <= CNT_51MS))
            key_in <= {$random} % 2;
        else if (tb_cnt >= CNT_11MS && tb_cnt <= CNT_41MS)
            key_in <= 1'b0;
        else 
            key_in <= 1'b1;
    end

    key_filter 
    #(
        .CNT_MAX (20'd10)
    )
    key_filter_inst(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .key_in (key_in),

        .key_flag (key_flag)
    );
endmodule

```

## 总结

​			使用parameter define 将参数化的时间值缩短，从而缩短仿真时间；
