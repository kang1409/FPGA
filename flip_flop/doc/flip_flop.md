# 时序逻辑--寄存器

## 理论学习

​	组合逻辑的缺点是竞争冒险，常常会引起电路的不稳定和工作时的不确定性。使用时序逻辑会避免这种情况的出些，时序逻辑的最基本单元就是寄存器，寄存器具有存储功能，一般由D触发器构成，由时钟脉冲控制。

​	区分一个设计是组合逻辑还是时序逻辑，是看数据工作是否在时钟沿下进行的。

## 实验

### 实验内容

使用D触发器，实现当按键没有按下时led灯处于熄灭状态，按下按键时，led灯被点亮。

### 程序设计

#### 模块框图

![](F:\project\flip_flop\doc\flip_flop.png)

#### 信号描述

| 信号    | 位宽 | 类型             | 功能描述             |
| ------- | ---- | ---------------- | -------------------- |
| sys_clk | 1bit | input     (wire) | 工作时钟，频率100MHz |
| sys_rst | 1bit | input     (wire) | 复位信号，低电平有效 |
| key_in  | 1bit | input     (wire) | 按键输入             |
| led_out | 1bit | output     (reg) | 输出控制信号         |

#### 波形图设计

D触发器根据复位方式分为俩种，一种是同步复位，一种是异步复位。

##### 同步复位设计

​	同步复位的D触发器中的同步是指与工作时钟同步。及当时钟上升沿（或下降沿）到来的时候检测复位信号是否有效。

![](F:\project\flip_flop\doc\flip_flop_1.png)

##### 异步复位设计

异步复位是指D触发器中的异步复位是指与工作时钟不同步，及当按键被按下就执行复位操作。

![](F:\project\flip_flop\doc\flip_flop_2.png)

**时序电路特点：1、对电路中的毛刺现象有很好的屏蔽，2、有延一拍的效果。**

### 代码的编写

#### 同步复位

```verilog
`timescale 1ns/1ns
module flip_flop(
    input wire sys_clk,
    input wire sys_rst_n,
    input wire key_in,

    output reg led_out
);

always @(posedge sys_clk) begin
    if (sys_rst_n == 1'b0)
        led_out <= 1'b0;
    else
        led_out <= key_in;    
end

endmodule
```

### 异步复位

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 18:56:21
// Design Name: 
// Module Name: flip_flop_1
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


module flip_flop_1(
    input wire sys_clk,
    input wire sys_rst_n,
    input wire key_in,

    output reg led_out
    );

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            led_out <= 1'b0;
        else
            led_out <= key_in;
        
    end
endmodule

```

