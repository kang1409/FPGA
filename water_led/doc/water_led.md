# 流水灯

## 理论学习

使led灯依次闪亮。

## 实验

### 目标

**依次点亮8个led灯，每次亮一秒。**按下按键复位停止闪烁，松开继续闪烁

### 模块框图

![image-20230906222739619](F:\project\counter\doc\流水灯.png)

### 信号描述

| 信号      | 位宽 | 类型   | 功能描述       |
| --------- | ---- | ------ | -------------- |
| sys_clk   | 1'b  | input  | 时钟信号       |
| sys_rst_n | 1'b  | input  | 复位信号       |
| led_out   | 1'b  | output | 流水灯输出信号 |

### 代码编写

```verilog
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

```

### 测试代码

```verilog
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

```

## 总结

1. 掌握移位符号；
2. 掌握时钟的计算，计数器的使用；