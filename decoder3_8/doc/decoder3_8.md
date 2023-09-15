# 3-8 译码器

## 理论学习

​	译码是编码的逆过程。

​	译码器是一类多输入多输出的组合逻辑电路器件。

# 实验目标

​	设计并仿真验证8—3译码器。通过８个LED灯进行测试。之后学习完数码管的使用进行数码管仿真测试。

### 程序设计

#### 模块框图

![](F:\project\decoder3_8\doc\decoder3_8.png)

#### 译码器真值表

| ｉｎ１ | ｉｎ２ | ｉｎ３ |  ｏｕｔ［７：０］  |
| :----: | :----: | :----: | :----------------: |
|   ０   |   ０   |   ０   | ００００＿０００１ |
|   ０   |   ０   |   １   | ００００＿００１０ |
|   ０   |   １   |   ０   | ００００＿０１００ |
|   ０   |   １   |   １   | ００００＿１０００ |
|   １   |   ０   |   ０   | ０００１＿００００ |
|   １   |   ０   |   １   | ００１０＿００００ |
|   １   |   １   |   ０   | ０１００＿００００ |
|   １   |   １   |   １   | １０００＿００００ |



#### 代码

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/01 20:07:06
// Design Name: 
// Module Name: decoder3_8
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


module decoder3_8(
    input   wire in1,
    input   wire in2,
    input   wire in3,

    output  reg [7:0]  out
    );
    
    always @(*)
    if ({in1, in2, in3} == 3'b000)
        out = 0000_0001;
    else if ({in1, in2, in3} == 3'b001)
        out = 0000_0010;
    else if ({in1, in2, in3} == 3'b010)
        out = 0000_0100;
    else if ({in1, in2, in3} == 3'b011)
        out = 0000_1000;
    else if ({in1, in2, in3} == 3'b100)
        out = 0001_0000;
    else if ({in1, in2, in3} == 3'b101)
        out = 0010_0000;
    else if ({in1, in2, in3} == 3'b110)
        out = 0100_0000;
    else if ({in1, in2, in3} == 3'b111)
        out = 1000_0000;
    else                            //防止产生大量的冗余逻辑和锁存器
        out = 0000_0001; 
endmodule

```



#### 测试代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/01 20:07:33
// Design Name: 
// Module Name: tb_decoder3_8
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


module tb_decoder3_8();
    reg in1;
    reg in2;
    reg in3;
    
    wire [7:0] out;
    
    initial begin
    in1 <= 1'b0;
    in2 <= 1'b0;
    in3 <= 1'b0;
    end 
    
    always #10 in1 <= {$random} % 2;
    always #10 in2 <= {$random} % 2;
    always #10 in3 <= {$random} % 2;
    
    initial begin
        $timeformat(-9,0,"ns",6);
        $monitor("@time %t : in1=%b, in2=%b, in3=%b, out=%b",$time,in1,in2,in3,out);
    end 
    
    decoder3_8  decoder3_8_ins(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out(out)
    );
endmodule

```

## 总结

使用if—else实现3-8译码器，学习{，} 位拼接运算符。





























