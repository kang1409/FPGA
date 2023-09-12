# 半加器

## 理论学习

​	数字电路中的加法器是一种常见的基本器件，主要用于俩个数或者多个数的加和，加法器包括全加器和半加器。**半加器指的是对俩个输入数据位相加，输出一个结果位和进位，没有进位输入的加法器器件。是实现俩个一位二进制数的加法运算电路**

## 实验目标

​	设计并实现一个半加器。

​	选取D1(F6)为和的输出sum，以D8(K2)为进位(cout)的输出，以S3(in1)(V1),S0(in2)(R11)为俩个被加数in1，in2.

## 程序设计

### 模块框图

![image-20230903203409501](F:\progect\harf_adder\doc\harf_adder.png)

### 真值表

| in1  | in2  | sum        | cout |
| :--- | ---- | ---------- | ---- |
| 0    | 0    | 0          | 0    |
| 0    | 1    | 1          | 0    |
| 1    | 0    | 1          | 0    |
| 1    | 1    | 0(本位记0) | 1    |

### 波形图

![image-20230903205440907](F:\progect\harf_adder\doc\harf_adder_2.png)

### 代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/03 20:17:06
// Design Name: 
// Module Name: harf_adder
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


module harf_adder(
    input wire in1,
    input wire in2,
    
    output wire sum,
    output wire cout
    );
    
    assign {cout, sum} = in1 + in2;
    
endmodule

```

### 测试代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/03 20:59:54
// Design Name: 
// Module Name: tb_harf_adder
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
// 仿真没有输入输出，都是自己产生，所以不需要input， output
//时间刻度一般1ns/1ns
//第一步编写变量
//第二步初始化变量
//第三步使用随机数产生模块对变量进行模拟输入
//verilog always #10 中的#10代表延迟10个单位进行
//第四步 （选写）使仿真输出打印所需要的信息
//$timeformat(-9,0,"ns",6);设置时间格式-9 为纳秒（ns），0表示整数，单位为ns，6为小数部分的位数
//第五步连接俩个文件
//
//////////////////////////////////////////////////////////////////////////////////


module tb_harf_adder();
//第一步编写变量
    reg in1;
    reg in2;
    wire sum;
    wire coout;
    
//第二步初始化变量 
    initial begin 
        in1 <= 1'b0;
        in2 <= 1'b0;
    end 
    
//第三步使用随机数产生模块对变量进行模拟输入
    always #10 in1 <= {$random} % 2;
    always #10 in2 <= {$random} % 2;

//第四步（选写）使仿真输出打印所需要的信息
    initial begin
        $timeformat(-9,0,"ns",6);
        $monitor("@time %t:in1=%b in2=%b sum=%b cout=%b",$time ,in1,in2,sum,cout );
    

//第五步连接俩个文件
    harf_adder  harf_adder_inst(
    .in1(in1),
    .in2(in2),
    .sum(sum),
    .cout(cout)
    );

endmodule

```

## 实验总结

​	学习加深测试文件写法，对于数据类型掌握不清