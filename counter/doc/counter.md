# 计数器

## 实验目标

让计数器计数1s间隔，实现led灯间隔闪烁。

### 模块框图

![image-20230906220130250](F:\project\counter\doc\计数器模块.png)

### 信号描述

| 信号      | 位宽 | 类型   | 功能          |
| --------- | ---- | ------ | ------------- |
| Sys_clk   | 1'b  | Input  | 时钟信号      |
| Sys_rst_n | 1'b  | Input  | 复位信号      |
| Led_out   | 1'b  | Output | 输出led灯信号 |

**掌握带标志的计数器脉冲信号**

### 代码实现

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 21:50:06
// Design Name: 
// Module Name: counter
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


module counter

    #(    
    //时钟频率100MHz 1/100_000_000s
    parameter  CNT_MAX = 27'd99_999_999
    )
    (   
    input wire sys_clk,
    input wire sys_rst_n,

    output reg led_out
    );

    reg [26:0] cnt;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            cnt <= 27'b0;
        else
            cnt <= cnt + 1'b1; 
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            led_out <= 1'b0;
        else if(cnt == CNT_MAX)
            led_out <= ~led_out;
        
    end
endmodule

```

## 总结

​	**掌握paramter的用法；**

1. **学会控制计数器，**
2. **了解flag信号脉冲标志信号的意义，如何产生，应用场景。**

​		在FPGA（现场可编程门阵列）中，"flag"信号通常用于表示某个特定事件或条件的发生。它是一个脉冲信号，用于在一个时钟周期内指示事件的发生，并且在事件恢复后立即返回到非活动状态。

产生"flag"信号的方法可以有多种，具体取决于应用场景和设计要求。以下是几种常见的方法：

组合逻辑产生：可以使用组合逻辑电路（例如逻辑门和多路选择器）来检测特定的事件或条件，并在满足条件时生成"flag"信号的脉冲。

时序逻辑产生：可以使用时序逻辑电路（例如触发器和计数器）来跟踪特定的事件或条件，并在满足条件时生成"flag"信号的脉冲。这种方法更适用于需要在多个时钟周期内检测事件的情况。

"flag"信号的应用场景多种多样，以下是一些常见的应用场景：

中断信号：在嵌入式系统中，FPGA可以用于处理中断请求。当外部设备或其他模块需要引起处理器的注意时，可以通过生成一个"flag"信号来触发中断处理程序。

事件触发：当特定事件发生时，可以使用"flag"信号来触发其他模块或电路的操作。例如，在图像处理应用中，当检测到某个对象或特征时，可以生成一个"flag"信号来触发相关的图像处理算法。

状态指示："flag"信号可以用于指示系统的运行状态或特定条件的满足。例如，当某个操作完成时，可以生成一个"flag"信号来指示完成状态，以便其他模块可以进行后续操作。

总而言之，"flag"信号是在FPGA中用于表示特定事件或条件的脉冲信号。它可以通过组合逻辑或时序逻辑产生，并在许多应用场景中用于触发其他模块的操作、指示状态或处理中断等。