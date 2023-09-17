# 初识FPGA

## 学习工具

1. vivado 2019.2
2. Visual Studio Code
3. visio
4. EGO 1
   1. xc7a35t  csg324c -1
   2. 100MHz时钟信号
5. modelsim SE 10.5
6. git

## FPGA 介绍

​		FPGA（Field Programmable Gate Array）是一种可编程逻辑器件，它具有灵活性和可重构性，能够根据用户的需求进行编程和重新配置。FPGA通常由大量的可编程逻辑块（CLB）和可编程连接资源组成，通过在这些逻辑块之间建立连接关系，可以实现不同的数字电路功能。

FPGA与ASIC（Application-Specific Integrated Circuit）相比，最大的优势在于其可编程性。ASIC是专门为特定应用而设计的集成电路，它具有高性能和低功耗，但开发成本高且设计周期长。而FPGA允许设计人员在硬件级别上进行编程，可以通过修改配置位流（Configuration Bitstream）来改变电路功能，从而在短时间内快速实现特定应用的设计。

FPGA的应用非常广泛。它常被用于数字信号处理（DSP）、通信系统、图像处理、嵌入式系统、网络加速等领域。由于FPGA的可编程性和并行处理能力，它在需要高性能和实时处理的应用中非常受欢迎。

FPGA的设计通常使用硬件描述语言（HDL）进行，例如VHDL（VHSIC Hardware Description Language）和Verilog。设计人员可以使用这些语言描述电路的功能和结构，并将其综合为逻辑网表。然后，通过对逻辑网表进行布局和布线，生成最终的配置位流，将其下载到FPGA芯片中。

总结一下，FPGA是一种可编程逻辑器件，具有灵活性和可重构性。它通过硬件描述语言进行设计，可以用于实现各种数字电路功能，并广泛应用于多个领域。

## 学习语言：verilog

​		Verilog是一种硬件描述语言（HDL），用于对数字电路进行建模、仿真和综合。它是一种高级语言，允许设计人员以结构化的方式描述电路的功能和行为。

Verilog最初由Gateway Design Automation公司（后来被Cadence收购）于1984年开发，现在已成为一种广泛使用的硬件描述语言标准，被IEEE标准化为IEEE 1364。Verilog的语法和结构与C语言类似，但其语义和目标完全不同。

Verilog主要用于数字系统的设计，如集成电路、FPGA、ASIC等。它提供了一种描述和设计数字电路的方法，使得设计人员可以以模块化的方式组织和设计复杂的电路系统。

Verilog的设计通常由模块（Module）组成。模块是Verilog中的基本单元，用于表示电路的功能模块。每个模块都可以包含输入、输出和内部信号，以及描述其功能和行为的语句。

Verilog提供了多种建模级别，包括结构级建模、行为级建模和寄存器传输级建模。在结构级建模中，可以使用门级逻辑和触发器来描述电路的物理结构。行为级建模则更关注电路的功能和行为，使用过程（Procedural）语句描述电路的操作。寄存器传输级建模则介于结构级和行为级之间，描述电路中寄存器之间的数据传输。

除了建模功能，Verilog还包括用于仿真和综合的特性。它可以与各种仿真工具和综合工具结合使用，进行电路的功能验证和逻辑综合。

总结一下，Verilog是一种硬件描述语言，用于对数字电路进行建模、仿真和综合。它提供了一种结构化的描述方法，允许设计人员以模块化的方式设计复杂的电路系统。Verilog在数字系统设计中广泛应用，并与各种仿真工具和综合工具兼容。

### Verilog基础语法

Verilog的基础语法包括模块声明、端口声明、信号声明和行为语句。下面是一些常见的Verilog语法元素：

1. 模块声明：

   ~~~verilog
   module 模块名 (输入端口, 输出端口);
     // 代码
   endmodule
   ```
   ~~~

2. 端口声明：

   ```verilog
   input 输入端口;
   output 输出端口;
   inout 双向端口;
   ```

3. 信号声明：

   ```verilog
   wire 无驱动信号;
   reg 寄存器信号;
   ```

4. 时钟声明：

   ```verilog
   reg 时钟信号;
   ```

5. 行为语句：

   - 阻塞赋值：

     ```verilog
     寄存器信号 = 表达式;
     ```

   - 非阻塞赋值：

     ```verilog
     寄存器信号 <= 表达式;
     ```

   - 分支语句：

     ```verilog
     if (条件) begin
       // 代码
     end
     else if (条件) begin
       // 代码
     end
     else begin
       // 代码
     end
     ```

   - 循环语句：

     ```verilog
     for (初始条件; 终止条件; 步进) begin
       // 代码
     end
     ```

   - case语句：

     ```verilog
     case (表达式)
       值1: begin
         // 代码
       end
       值2: begin
         // 代码
       end
       default: begin
         // 代码
       end
     endcase
     ```

这只是Verilog语法的一小部分，还有其他语法元素和特性可用于描述更复杂的电路行为和结构。Verilog还支持层次化设计、参数化模块、任务和函数等高级语法，以及各种内置运算符和库函数。

### 仿真文件

在Verilog中，仿真文件通常用于描述测试环境和测试向量，以进行电路的功能验证。仿真文件的语法包括模块声明、端口声明、信号声明、仿真时钟和仿真语句。下面是一个典型的仿真文件的语法示例：

```verilog
`timescale 1ns / 1ns  // 定义时间单位和精度

module 模块名;  // 模块声明
  // 端口声明
  reg 时钟;
  reg [7:0] 输入;
  wire [7:0] 输出;

  // 仿真时钟
  always #5 时钟 = ~时钟;  // 定义一个5ns的时钟信号

  // 设计被测电路的实例化
  设计名 UUT (
    .时钟(时钟),
    .输入(输入),
    .输出(输出)
  );

  // 仿真语句
  initial begin
    // 初始化输入信号
    输入 = 8'b00000000;

    // 激励输入信号
    #10 输入 = 8'b10101010;

    // 检查输出信号
    #20 if (输出 === 8'b01010101)
      $display("测试通过");
    else
      $display("测试失败");

    // 结束仿真
    $finish;
  end
endmodule
```

上述示例中，仿真文件首先使用`timescale`指令定义了时间单位和精度。然后定义了一个模块，并声明了输入端口、输出端口以及仿真时钟信号。接下来，使用`always`语句定义了一个时钟信号的行为，以产生一个5ns周期的时钟信号。然后实例化了被测电路的设计，并将信号连接到对应的端口。最后，在`initial`块中，初始化输入信号、激励输入信号、检查输出信号，并使用`$finish`结束仿真过程。

仿真文件中可以使用各种仿真语句和系统任务，如`initial`、`always`、`$display`、`$monitor`等，来控制仿真过程、激励信号和输出结果的显示。这些语句和任务可以用于生成测试向量、检查输出结果、记录仿真波形等。

`$display`和`$monitor`是在Verilog中用于在仿真过程中打印消息和监视信号的系统任务。

`$display`任务用于在仿真过程中打印消息到仿真控制台。它接受一个或多个参数，可以是字符串、数字或信号。格式化字符串中的格式说明符可以用于打印变量的值。下面是一个示例：

```verilog
reg [7:0] data;
initial begin
  data = 8'b10101010;
  $display("Data: %b", data);  // 打印二进制格式的data值
end
```

上述示例中，`$display`任务打印了变量`data`的二进制值。

`$monitor`任务用于监视信号的值，并在其值发生变化时自动打印消息。与`$display`不同，`$monitor`任务会在仿真过程的每个时间单位检查信号的值，并在变化时打印消息。下面是一个示例：

```verilog
reg [7:0] data;
initial begin
  data = 8'b10101010;
  $monitor("Data: %b", data);  // 监视data的值并打印
  #10 data = 8'b01010101;  // 改变data的值
  #20 $finish;  // 结束仿真
end
```

上述示例中，`$monitor`任务会在每个时间单位检查变量`data`的值，并在其值发生变化时打印消息。

这些系统任务可以帮助设计人员在仿真过程中跟踪和调试设计的行为。它们在调试和验证过程中非常有用，可以提供有关信号值和状态变化的实时信息。需要注意的是，`$display`和`$monitor`任务只在仿真过程中起作用，在实际的硬件运行中不会产生任何影响。

### verilog 的执行顺序

在Verilog中，模块中的语句的执行顺序是由其建模级别决定的。Verilog提供了三个建模级别：结构级建模、行为级建模和寄存器传输级建模。不同的建模级别决定了语句的执行顺序和并发性。

1. **结构级建模：**
   在结构级建模中，模块内的语句按照其物理结构进行顺序执行。这意味着逻辑门和触发器按照其在代码中的顺序依次执行，因此结构级建模的执行顺序是确定的。这种建模级别通常用于描述电路的物理结构和门级逻辑。
2. **行为级建模：**
   在行为级建模中，模块内的语句按照其在代码中的顺序执行，而不考虑物理结构。行为级建模使用过程（Procedural）语句，如`always`块和`initial`块，来描述电路的行为和功能。在行为级建模中，各个过程块之间是并发执行的，没有明确定义的顺序。这意味着在同一时间单位内，多个过程块可以同时执行，而不会相互阻塞。行为级建模常用于描述电路的功能和算法。
3. **寄存器传输级建模：**
   寄存器传输级建模介于结构级建模和行为级建模之间。它主要关注数据在寄存器之间的传输和处理。在寄存器传输级建模中，语句的执行顺序由数据的传输和寄存器之间的依赖关系决定。通常使用非阻塞赋值语句（`<=`）来描述寄存器之间的数据传输，以确保顺序正确。寄存器传输级建模常用于描述时序逻辑和数据通路。

需要注意的是，Verilog是一种并发编程语言，模块中的语句可以并发执行。不同的语句可以在不同的时间单位内执行，因此在仿真和综合中，模块中的语句不一定按照代码顺序顺序执行，而是根据其并发关系和依赖关系决定执行顺序。正确理解建模级别和语句执行顺序对于编写正确的Verilog代码和预测其行为至关重要。

## 软件的资源

### vivado2019.2

链接: https://pan.baidu.com/s/1K1YoCEn5TnPPM1GVDI754w?pwd=emdh 

提取码: emdh 

### **Modelsim SE 2020.4**

链接: https://pan.baidu.com/s/1hFo3bHRkuLIhRRQs1JYidw?pwd=vrbe

提取码: vrbe 

## git使用指南

```
git init			//将当前目录变成git可以管理的仓库
git add 文件名	       //将文件添加到仓库
git status  		 //查看目录下文件状态
gti commit -m "标签" 	//将文件提交到仓库
git push -u origin master		//将本地仓库推送到远程仓库
git remote add origin *****		//关联远程仓库
git add .					//添加当前目录下所有未追踪的文件
```



## 实战内容

### Latch

#### Latch本质是一种锁存器

Latch是一种顺序逻辑电路元件，它有两个稳定状态（设置和复位），可以存储一位信息。它通常被用作数字系统中的基本构建块，用于临时存储数据。

Latch可以使用各种逻辑门或通过在组合电路中使用反馈来实现。有不同类型的Latch，例如SR Latch（设置-复位Latch）、D Latch（数据Latch）、JK Latch和T Latch。

1. SR Latch：
   SR Latch具有两个输入：S（设置）和R（复位）。它有两个稳定状态：设置（Q = 1）和复位（Q = 0）。SR Latch的真值表如下：

   plaintext

   Copy

   ````
   S | R | Q | Q'
   --|---|---|---
   0 | 0 | Q | Q'
   0 | 1 | 0 | 1
   1 | 0 | 1 | 0
   1 | 1 | X | X
   ```
   
   当S = 0且R = 0时，Latch保持其之前的状态。当S = 0且R = 1时，Latch被复位（Q = 0）。当S = 1且R = 0时，Latch被设置（Q = 1）。当S和R都为1时，处于无效状态（用X表示）。
   ````

2. D Latch：
   D Latch（数据Latch）是一种电平敏感的Latch，用于存储一位数据。它具有单个输入D（数据）和两个输出：Q（输出）和Q'（互补输出）。D Latch由使能信号（通常表示为E或EN）控制。当使能信号高电平时，D输入被传输到输出。当使能信号低电平时，Latch保持其之前的状态。D Latch的真值表如下：

   plaintext

   Copy

   ````
   E | D | Q | Q'
   --|---|---|---
   0 | X | Q | Q
   1 | 0 | 0 | 1
   1 | 1 | 1 | 0
   ```
   
   当E = 0时，输出保持其之前的状态。当E = 1时，输出跟随D输入。
   ````

需要注意的是，Latch具有电平敏感的特性，这意味着只要输入值或控制信号发生变化，其输出可能会改变。如果不正确处理，这可能导致竞争条件和亚稳态等问题。在同步数字设计中，通常不使用Latch，而是使用Flip-Flop来可靠地存储数据。

#### Latch的危害

在FPGA（Field-Programmable Gate Array）设计中，使用Latch可能会带来一些特定的危害和挑战，包括：

1. 时间相关性问题：Latch是电平敏感的元件，其输出对输入和控制信号的变化非常敏感。在FPGA中，由于信号传播延迟和逻辑元件之间的连接延迟，Latch的时序行为可能会受到影响。这可能导致时序故障，如冒险条件（race condition）和亚稳态（metastability）。
2. 状态冲突和不确定性：SR Latch在输入同时为1时可能处于无效状态。当SR Latch在FPGA中的输入同时变为1时，可能会导致状态冲突和不确定性。这可能会导致输出的不稳定或错误的结果。
3. 功耗和资源占用：Latch在FPGA中需要持续消耗功耗。相比于Flip-Flop，Latch对于资源的使用更多，因为Latch通常需要更多的逻辑元件。这可能导致FPGA资源的浪费和功耗的增加。
4. 高速时序问题：Latch的电平敏感特性限制了它在高速时序设计中的应用。FPGA中的时序要求通常很高，而Latch的电平敏感性可能导致时序不稳定和不可靠的行为。因此，在需要满足严格时序要求的设计中，Latch通常不是首选的存储元件。

基于上述原因，FPGA设计中通常更倾向于使用时钟触发的Flip-Flop来实现存储功能。Flip-Flop具有确定的时序行为，能够更好地满足FPGA设计的要求，并且在时序稳定性和资源利用方面更具优势。

# 1.点亮一个led灯

## 使用工具：

1. vivado 2019.2
2. notepaid++ 7.6.6
3. visio
4. EGO 1
   1. xc7a35t  csg324c -1
   2. 100MHz时钟信号
5. modelsim SE 10.5

## 实现目标：

​	通过按键控制一个led灯的亮，暗。

## 实验内容：

### 模块框图

![](F:\project\led\doc\image20230901170102659.png)

### 实验代码：

```verilog
module led(
    input   wire    key_in,
    output  wire    led_out
    );
    
    assign led_out = key_in;
endmodule
```

### 真值表：

| 按键输入 | led输出 |
| -------- | ------- |
| key_in   | led_out |
| 0        | 0       |
| 1        | 1       |

### 波形图：

![](F:\project\harf_adder\doc\harf_adder_2.png)

### 编写测试代码：

```verilog
`timescale 1ns/1ns
module tb_led();
    wire led_out;
    reg key_in;
    initial key_in <= 1'b0;
    always #10 key_in <= {$random} % 2;
    
    led led_inst
    (
        .key_in (key_in),
        .led_out (led_out)
    );
endmodule
```

### 仿真测试结果：

vivdo --> run simulation

![](F:\project\led\doc\image20230901170718807.png)

### 生成管脚约束文件

vivado --> run synthesis--->run implementation--->填写对应管脚并保存

| name    | package pin | I/O std  | vcco |
| ------- | ----------- | -------- | ---- |
| key_in  | R15         | LVCMOS33 | 3300 |
| led_out | K3          | LVCMOS33 | 3300 |

### 生成比特流文件

vivado --> generate Bitstream 

### 下载到电路板

vivado -->  open hardware manager --> opentarget -->  program device

## 实验总结

点亮第一个led灯目的主要是熟悉vivado开发FPGA流程

# 2.二路选择器

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

![](F:\project\mux2_1\doc\mux2_1_1.png)

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

![](F:\project\mux2_1\doc\mux2_1_2.png)3-8译码器————> decoder3_8dr

# 3.半加器

## 理论学习

​	数字电路中的加法器是一种常见的基本器件，主要用于俩个数或者多个数的加和，加法器包括全加器和半加器。**半加器指的是对俩个输入数据位相加，输出一个结果位和进位，没有进位输入的加法器器件。是实现俩个一位二进制数的加法运算电路**

## 实验目标

​	设计并实现一个半加器。

​	选取D1(F6)为和的输出sum，以D8(K2)为进位(cout)的输出，以S3(in1)(V1),S0(in2)(R11)为俩个被加数in1，in2.

## 程序设计

### 模块框图

![](F:\project\harf_adder\doc\harf_adder.png)

### 真值表

| in1  | in2  | sum        | cout |
| :--- | ---- | ---------- | ---- |
| 0    | 0    | 0          | 0    |
| 0    | 1    | 1          | 0    |
| 1    | 0    | 1          | 0    |
| 1    | 1    | 0(本位记0) | 1    |

### 波形图

![](F:\project\harf_adder\doc\harf_adder_2.png)

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

# 4.全加器

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

# 5.时序逻辑--寄存器

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

# 6.计数器

## 实验目标

让计数器计数1s间隔，实现led灯间隔闪烁。

### 模块框图

![](F:\project\counter\doc\counter.png)

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

# 7.分频器

## 理论学习

所谓分频器就是指，将输入信号的频率变成成倍数的低于输入频率的输出信号。

## 实战

内容包括偶数分频与奇数分频，主要将偶数分频，使用标志脉冲信号可以使其在高速状态下保持稳定。

### 模块框图

![](F:\project\divider_six\doc\divider_six.png)

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

# 8.流水灯

## 理论学习

使led灯依次闪亮。

## 实验

### 目标

**依次点亮8个led灯，每次亮一秒。**按下按键复位停止闪烁，松开继续闪烁

### 模块框图

![image-20230915211514261](F:\project\water_led\doc\water_led.png)

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
            cnt <= 27'b0;
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

# 9.状态机

## 理论基础

​		**状态机（FSM）也称同步有限状态机**，“同步”是指状态机中的所有状态跳转都是在时钟的作用下进行的。

“有限”是指状态机中的状态是有限的。状态机更据输出的原因分为俩种：

1. Moore型状态机————最后的输出只和当前的状态有关而与输入无关
2. Mealy型状态机————最后的输出不仅和当前的状态有关还和输入有关

​		状态机中的每个状态都代表一个事件，从执行当前事件到执行另一个事件，**我们称之为状态的跳转或状态的转移**。

​		简单的说状态机就是一种函数关系。

## 实战演练

### 简单的状态机

#### 目标

​		简单的可乐机系统。每次只能投入一枚一元银币，每瓶可乐买3银币，当投入三个银币可乐机出可乐，当投入不足三个银币，按下复位键，之前的银币不会被退回。（黑心）

#### 模块框图

![](F:\project\fsm\doc\simple_fsm_2.png)

#### 信号描述

| 信号      | 位宽 | 类型   | 功能描述     |
| --------- | ---- | ------ | ------------ |
| sys_clk   | 1‘b  | input  | 工作时钟信号 |
| sys_rst_n | 1'b  | input  | 复位信号     |
| pi_money  | 1'b  | input  | 投币一银币   |
| po_cola   | 1'b  | output | 弹出可乐     |

#### 状态转移图

状态转移图有三要素，输入，输出，状态

| 输入 | 根据输入可以确定是否需要进行状态跳转以及输出，是影响状态机系统执行过程的重要驱动力； |
| ---- | ------------------------------------------------------------ |
| 输出 | 根据当前时刻的状态以及输入。是状态机系统最终要执行的动作；   |
| 状态 | 根据输入和上一状态决定当前时刻所处的状态，是状态机系统执行的一个稳定的过程； |

##### 简单状态机状态分析

| 输入 | 投入1银币；                              |
| ---- | ---------------------------------------- |
| 输出 | 出可乐，不出可乐；                       |
| 状态 | 可乐机中有几个银币，0个，1个，2个，3个； |

##### 画出状态转移图

![](F:\project\fsm\doc\simple_fsm_1.png)

#### 代码的编写

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 16:22:41
// Design Name: 
// Module Name: simple_fsm
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


module simple_fsm(
    input wire sys_clk,     //时钟
    input wire sys_rst_n,   //复位键
    input wire pi_money,    //投币键

    output reg po_cola      //可乐的输出
    );

    //只有四种状态，使用独热码；
    parameter NULL = 3'b001;
    parameter ONE = 3'b010;
    parameter TWO = 3'b100;


    reg [2:0] state;

    //第一个状态机，描述如何跳转到下一个状态；
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            state <= NULL;
        else case (state)
            NULL:if(pi_money == 1'b1)
                    state <= ONE;
                 else
                    state <= NULL;

            ONE: if(pi_money == 1'b1)
                    state <= TWO;
                else
                    state <= ONE;
            
            TWO: if(pi_money == 1'b1)
                    state <= NULL;
                else
                    state <= TWO;
            default: state <= NULL;
        endcase 
    end

    //第二个状态机，描述 state影响po_cola;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            po_cola <= 1'b0;
        else if (state == TWO && pi_money == 1'b1)
            po_cola <= 1'b1;
        else
            po_cola <= 1'b0;
    end
endmodule

```

#### 仿真文件

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 16:45:42
// Design Name: 
// Module Name: tb_simple_fsm
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


module tb_simple_fsm();
    reg sys_clk;
    reg sys_rst_n;
    reg pi_money;

    wire po_cola;

    initial begin
        sys_clk = 1'b1;
        sys_rst_n = 1'b0;
        pi_money = 1'b0;
        #20
        sys_rst_n = 1'b1;
    end

    always #5 sys_clk <= ~sys_clk;

    always @(posedge sys_clk or negedge sys_rst_n)begin
        if (sys_rst_n == 1'b0)
            pi_money <= 1'b0;
        else
            pi_money <= {$random} % 2;
    end

    wire [2:0] state = simple_fsm_inst.state;

    initial begin
        $timeformat(-9,0,"ns",6);
        $monitor("@time %t: pi_money = %b, state = %b, po_cola = %b",$time,pi_money,state,po_cola);
    end

    simple_fsm simple_fsm_inst(
        .sys_clk(sys_clk),
        .sys_rst_n (sys_rst_n),
        .pi_money (pi_money),
        .po_cola (po_cola)
    );
endmodule

```

### 相对与上一个复杂的状态机

#### 目标

可乐定价2.5元，可以投入0.5元，可以投入1元，不足2.5元，复位时会退还，超过2.5时会找零；（比上一个良心）

#### 模块框图

![image-20230907205905937](F:\project\fsm\doc\complex_fsm.png)

#### 信号描述

| 信号          | 位宽 | 类型   | 功能      |
| ------------- | ---- | ------ | --------- |
| sys_clk       | 1'b  | input  | 时钟信号  |
| sys_rst_n     | 1'b  | input  | 复位信号  |
| pi_money_one  | 1'b  | input  | 一元投币  |
| pi_money_half | 1'b  | input  | 0.5元投币 |
| po_cola       | 1'b  | output | 可乐输出  |
| po_money      | 1'b  | output | 退回找零  |

#### 状态转移图

##### 状态分析

| 输入 | 一元银币，0.5元银币                    |
| ---- | -------------------------------------- |
| 输出 | 出可乐，不出可乐，需要找零，不需要找零 |
| 状态 | 可乐机有0，0.5，1，1.5，2，2.5，3元    |

##### 状态转移图

**规定不投币为00，投入0.5为01，投入1为10**

**不出可乐不出币00，不出可乐只出币01，只出可乐10，出可乐出币11**

<img src="F:\project\fsm\doc\simplex_fsm.png" alt="image-20230907213731642" style="zoom: 33%;" />

#### 代码的编写

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 21:41:41
// Design Name: 
// Module Name: simplex_fsm
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


module simplex_fsm(
    input wire sys_clk,
    input wire sys_rst_n,
    input wire pi_money_one,
    input wire pi_money_half,

    output reg po_cola,
    output reg po_money
    );

    parameter NULL = 7'b0_000_001;
    parameter HALF = 7'b0_000_010;
    parameter ONE = 7'b0_000_100;
    parameter ONE_HALF = 7'b0_001_000;
    parameter TWO = 7'b0_010_000;
    parameter TWO_HALF = 7'b0_100_000;
    parameter THREE = 7'b1_000_000;

    reg [6:0] stage;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            stage <= NULL;
        else case (stage)
            NULL:begin
                if(pi_money_half == 1'b1 && pi_money_one == 1'b0)
                    stage <= HALF;
                else if(pi_money_half == 1'b0 && pi_money_one == 1'b1)
                    stage <= ONE;
                else
                    stage <= NULL;
               
            end
            
            HALF:begin
                if(pi_money_half == 1'b1 && pi_money_one == 1'b0)
                    stage <= ONE;
                else if(pi_money_half == 1'b0 && pi_money_one == 1'b1)
                    stage <= ONE_HALF;
                else
                    stage <= HALF;
            end

            ONE:begin
                if(pi_money_half == 1'b1 && pi_money_one == 1'b0)
                    stage <= ONE_HALF;
                else if(pi_money_half == 1'b0 && pi_money_one == 1'b1)
                    stage <= TWO;
                else
                    stage <= ONE;
                
            end

            ONE_HALF:begin
                if(pi_money_half == 1'b1 && pi_money_one == 1'b0)
                    stage <= TWO;
                else if(pi_money_half == 1'b0 && pi_money_one == 1'b1)
                    stage <= TWO_HALF;
                else
                    stage <= ONE_HALF;
                
            end

            TWO:begin
                if(pi_money_half == 1'b1 && pi_money_one == 1'b0)
                    stage <= TWO_HALF;
                else if(pi_money_half == 1'b0 && pi_money_one == 1'b1)
                    stage <= THREE;
                else
                    stage <= TWO;
                
            end

            TWO_HALF: stage <= NULL;
            THREE:stage <= NULL;
            default:begin
                stage <= NULL;
            end 
        endcase
        
    end


    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)begin
            po_cola <= 1'b0;
    end
        else case (stage)
            TWO_HALF:po_cola <= 1'b1;
            THREE: po_cola <= 1'b1; 
            default: po_cola <= 1'b0;
        endcase
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if( sys_rst_n == 1'b0)
            po_money <= 1'b0;
        else
            case (stage)
                TWO_HALF: po_money <= 1'b0;
                THREE: po_money <= 1'b1; 
                default: po_money <= 1'b0;
            endcase

    end
endmodule

```

#### 仿真文件

```verilog
 `timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/08 15:34:34
// Design Name: 
// Module Name: tb_simplex_fsm
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


module tb_simplex_fsm();

    reg sys_clk;
    reg sys_rst_n;
    reg pi_money_one;
    reg pi_money_half;

    reg random_date;

    wire po_cola;
    wire po_money;

    initial begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        pi_money_half <= 1'b0;
        pi_money_one <= 1'b0;
        #20
        sys_rst_n <= 1'b1;
    end

    always #5 sys_clk <= ~sys_clk;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
             random_date <= 1'b0;
        else 
            random_date <= {$random} % 2;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            pi_money_half <= 1'b0;
        else
            pi_money_half <= random_date;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            pi_money_one <= 1'b0;
        else
            pi_money_one <= ~random_date;
    end

    wire [7:0] stage = simplex_fsm_inst.stage;

    initial begin
        $timeformat (-9, 0,"ns",6);
        $monitor("$time %t: stage=%b  ,po_money = %b ,po_cola = %b, po_money_half = %b, po_money_one = %b",
            $time,stage,po_money,po_cola,pi_money_half,pi_money_one);

    end

    simplex_fsm simplex_fsm_inst(
        .sys_clk(sys_clk),
        .sys_rst_n (sys_rst_n),
        .pi_money_half (pi_money_half),
        .pi_money_one (pi_money_one),
        .po_cola (po_cola),
        .po_money (po_money)
    );
endmodule

```

## 总结

​			在使用always语句时，因为执行顺序时并行执行，所以尽量在每一个always语句块中只对一个变量进行操作；

学会使用，将RTL模块中的内部信号引入Testbench仿真文件中 ；

# 10.按键消抖

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

# 11.数码管的静态点亮

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

    output reg [7:0] seg,//段选
    output reg [7:0] sel//位选

    );

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
    parameter            SEG_A = 8'b1000_1000;
    parameter            SEG_B = 8'b1000_0011;
    parameter            SEG_C = 8'b1100_0110;
    parameter            SEG_D = 8'b1010_0001;
    parameter            SEG_E = 8'b1000_0110;
    parameter            SEG_F = 8'b1000_1110;
    parameter   NULL  = 8'b1111_1111;   //不显示状态

    reg         add_flag ;
    reg [26:0]  cnt_wait ;
    reg [3:0]   num      ;

    //1秒计数器
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt_wait <= 1'b0;
        else if(cnt_wait == CNT_MAX )
            cnt_wait <= 1'b0;
        else
            cnt_wait <= cnt_wait + 1'b1; 
    end

    //获取标志信号
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            add_flag <= 1'b0;
        else if(cnt_wait == CNT_MAX-1)
            add_flag <= 1'b1;
        else 
            add_flag <= 1'b0;
    end

    //num 进行循环
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            num <= 4'b0;
        else if (add_flag == 1'b1)
            num <= num + 1'b0;
        else if(num == 4'b1111)
            num <= 4'b0;
        else
            num <= num;
    end

    //sel 选中8个数码管
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            sel <= 8'b00000000;
        else 
            sel <= 8'b11111111;
    end

    //将num与seg对应
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
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

# 总结

​				在对静态数码管的学习中，应该学会，脱离书籍自己添加一些想法，加入到代码中，从而更好地理解知识点和设计思路。

# 12. 译码器

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



# 动态数码管

## 理论学习

​		为了减少实际使用的 FPGA 芯片的IO端口，可采用分时复用的扫描显示方案进行数码管驱动。分时复用的扫描显示利用了人眼的视觉暂留特性，如果公共端控制信号的刷新速度足够快，人眼就分辨不出LED的闪烁，认为数码管时同时点亮的。控制信号的最佳刷新频率为1000 Hz左右；

​		根据实际上板调试过程中控制信号最佳频率应为0.000_1 s 记10_000 HZ;

## 实验目的

​		对数码管进行操作，实现输出年月日即20230917；

## 模块框图

![image-20230917130429240](F:\project\seg_dynamic\doc\seg_dynamic.png)

## 信号描述

| 信号      | 位宽 | 类型   | 功能                 |
| --------- | ---- | ------ | -------------------- |
| sys_clk   | 1'b  | input  | 时钟信号             |
| sys_rst_n | 1'b  | input  | 复位信号             |
| sel1      | 8'b  | output | 前四个数码管位选信号 |
| seg1      | 8'b  | output | 前四个数码管段选信号 |
| sel2      | 8'b  | output | 后四个数码管位选信号 |
| seg2      | 8'b  | output | 前四个数码管段选信号 |

## 代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 16:43:03
// Design Name: 
// Module Name: seg_dynatic
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


module seg_dynatic#(
    parameter CNT_MAX = 27'd49_999_999,
    parameter CNT_MS = 15'd15_000
)(
    input wire sys_clk,
    input wire sys_rst_n,

    output reg [7:0] seg,//段选
    output reg [3:0] sel,//位选

    output reg [7:0] seg2,//段选
    output reg [3:0] sel2//位选

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
        else if(cnt_wait == CNT_MS )
            cnt_wait <= 1'b0;
        else
            cnt_wait <= cnt_wait + 1'b1; 
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            num <= 4'b0001;
        else if(cnt_wait == CNT_MS - 1)
            case (num)
                4'b0001: num <= 4'b0010;
                4'b0010: num <= 4'b0100;
                4'b0100: num <= 4'b1000; 
                default: num <= 4'b0001;
            endcase
        else 
            num <= num;
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            sel <= 4'b1000;
        else
            sel <= num;
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            seg <= NULL;
        else
            case (num)
                4'b0001:  seg <= SEG_3;
                4'b0010:  seg <= SEG_2;
                4'b0100:  seg <= SEG_0;
                4'b1000:  seg <= SEG_2;
                
                default: seg <= NULL;
            endcase
    end
///////////////////////////////////
always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            sel2 <= 4'b1000;
        else
            sel2 <= num;
    end

    always @(posedge sys_clk or posedge sys_rst_n) begin
        if(sys_rst_n == 1'b1)
            seg2 <= NULL;
        else
            case (num)
                4'b0001:  seg2 <= SEG_7;
                4'b0010:  seg2 <= SEG_1;
                4'b0100:  seg2 <= SEG_9;
                4'b1000:  seg2 <= SEG_0;
                
                default: seg2 <= NULL;
            endcase
    end

endmodule

```

## 引脚分配

![](F:\project\seg_dynamic\doc\segLead.png)

![](F:\project\seg_dynamic\doc\seg2Lead.png)

![](F:\project\seg_dynamic\doc\selLead.png)

## 实验效果

<img src="F:\project\seg_dynamic\doc\testResult.jpg" style="zoom: 10000%;" />













































