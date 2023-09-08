# 二路选择器

## 使用工具：

1. vivado 2019.2
2. notepaid++ 7.6.6
3. visio
4. EGO 1
   1. xc7a35t  csg324c -1
   2. 100MHz时钟信号
5. modelsim SE 10.5

## 实验目标：

设计并实现二选一多路选择器，主要功能是通过宣统控制信号S确定宣统A路或B路作为信号输出，当S为1时A输出，当S为0时B输出，

sel 为 0 时选择 in1，sel 为1 时 选择 in2

## 实验内容：

### 真值表：

| 输入 | 输入 | 输入 | 输出 |
| ---- | ---- | ---- | ---- |
| in1  | in2  | sel  | out  |
| 0    | 1    | 0    | 0    |
| 1    | 0    | 0    | 1    |
| 0    | 1    | 1    | 1    |
| 1    | 0    | 1    | 0    |

### 波形图：

![image-20230901195231857](F:\progect\mux2_1\doc\mux2_1波形.png)

### 代码展示：

```verilog
module Mux2_1(
    input wire in1,
    input wire in2,
    input wire sel,
    
    output reg out
    );

always @(*)
    if(sel == 1'b1)
        out = in2;
    else
        out = in1;

endmodule
```

### 测试代码：

```verilog
`timescale 1ns/1ns 

module tb_Mux2_1();
    reg in1;
    reg in2;
    reg sel;
    
    wire out;
    
    initial 
        begin
            in1 <= 1'b0;
            in2 <= 1'b0;
            sel <= 1'b0;
        end 
    always #10 in1 <= {$random} % 2;
    always #10 in2 <= {$random} % 2;
    always #10 sel <= {$random} % 2;
  
////////////////////////////////////////////////////////
    initial 
        begin
            $timefromat(-9, 0, "ns",6);
            $monitor("@time %t:in1=%b in2=%b sel=%b out=%b",$time,in1,in2,sel,out);
        end
////////////////////////////////////////////////////////  

    Mux2_1 Mux2_1_inst(
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .out(out)
    );
    
endmodule
```

### 测试波形：

![image-20230901195657295](F:\progect\mux2_1\doc\测试波形.png)
