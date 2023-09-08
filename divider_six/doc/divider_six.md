# 分频器

## 理论学习

所谓分频器就是指，将输入信号的频率变成成倍数的低于输入频率的输出信号。

## 实战

内容包括偶数分频与奇数分频，主要将偶数分频，使用标志脉冲信号可以使其在高速状态下保持稳定。

### 模块框图

![image-20230906221936615](F:\project\divider_six\doc\分频器.png)

### 代码

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/06 13:26:10
// Design Name: 
// Module Name: divider
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


module divider(
    input wire sys_clk,
    input wire sys_rst_n,
    input reg clk_flag,
    output wire led_out
    );

    reg [2:0] cnt;

    //计数器记0——5下降沿
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt <= 3'b0;
        else if(cnt == 3'd5)
            cnt <= 3'b0;
        else
            cnt <= cnt + 1'b1;
    end

    //实现分频
    always @(posedge sys_clk or negedge sys_rst_n ) begin
        if (sys_rst_n == 1'b0)
            clk_flag <= 1'b0;
        else if(cnt == 3'd4)
            clk_flag <= 1'b1;
        else
            clk_flag <= 1'b0;
    end

endmodule

```

## 总结

1. 学会实现任意分频
2. 进一步学会使用脉冲标志信号flag，操作计数器