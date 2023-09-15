# 全加器

## 实验目标

​	通过半加器构建全加器，学习层次化设计。

## 硬件资源

​	输入信号（被加数in1）（V1），（被加数in2）（U4），（进位信号cin）（R11），

​	输出信号（本位sum）(H4)，（进位cout）（J4）

## 程序设计

### 流程框图

#### 顶层模块

![](F:\project\full_adder\doc\full_adder_1.png)

#### 模块整体框图

![](F:\project\full_adder\doc\full_adder_2.png)

#### 真值表

| in1  | in2  | cin  | cout | sum  |
| ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    | 0    |
| 0    | 0    | 1    | 0    | 1    |
| 0    | 1    | 0    | 0    | 1    |
| 0    | 1    | 1    | 1    | 0    |
| 1    | 0    | 0    | 0    | 1    |
| 1    | 0    | 1    | 1    | 0    |
| 1    | 1    | 0    | 1    | 0    |
| 1    | 1    | 1    | 1    | 1    |

#### 顶层模块代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 16:37:49
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input wire in1,
    input wire in2,
    input wire cin,
    
    output wire sum,
    output wire cout
    );
    wire harf1_cout;
    wire harf2_cout;
    wire h1_sum;
    
    harf_adder  harf_adder1(
        .in1    (in1),
        .in2    (in2),
        
        .cout   (harf1_cout),
        .sum    (h1_sum)
    );
    
    harf_adder  harf_adder2(
        .in1    (h1_sum),
        .in2    (cin),
        
        .sum    (sum),
        .cout   (harf2_cout)
    );
    
    assign cout = harf1_cout | harf2_cout;
    
endmodule

```

#### 子模块代码

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

#### 测试模块

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 16:38:29
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder();
    reg in1;
    reg in2;
    reg cin;
    wire sum;
    wire cout;
    
    initial begin
        in1 <= 1'b0;
        in2 <= 1'b0;
        cin <= 1'b0;
    end
    
    always #10 in1 <= {$random} % 2;
    always #10 in2 <= {$random} % 2;
    always #10 cin <= {$random} % 2;
    
    initial begin
        $timeformat (-9,0,"ns",6);
        $monitor ("@time %t :in1=%b,in2=%b,cin=%b,sum=%b",$time ,in1, in2, cin, sum);
        
    end 
    
    full_adder  full_adder_inst(
        .in1    (in1),
        .in2    (in2),
        .cin    (cin),
        .sum    (sum),
        .cout   (cout)
    );
endmodule

```

## 总结

​		连接子模块的用法学习，测试模块数据类型错误会导致仿真卡住。