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
git branch					//列出所有分支
git branch  (新分支名)			//创建新的分支
git branch -d (分支名)			//删除分支
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

## 总结

​				在对静态数码管的学习中，应该学会，脱离书籍自己添加一些想法，加入到代码中，从而更好地理解知识点和设计思路。

# 12. 译码器

## 理论学习

​	译码是编码的逆过程。

​	译码器是一类多输入多输出的组合逻辑电路器件。

## 实验目标

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

## 总结

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



# 13、蜂鸣器

## 理论学习

蜂鸣器按照构造方式的不同，可分为压电式蜂鸣器和电磁式蜂鸣器两种类 型。压电式蜂鸣器主要由多谐振荡器、压电蜂鸣片、阻抗匹配器、共鸣箱以及 外壳等组成。电磁式蜂鸣器由振荡器、电磁线圈、磁铁、振动膜片及外壳等组 成。由于两种蜂鸣器发音原理不同，压电式结构简单耐用但音调单一音色差， 适用于报警器等设备。而电磁式由于音色好，所以多用于语音、音乐等设备。 蜂鸣器按照驱动电路的不同可以分为有源蜂鸣器与无源蜂鸣器。有源蜂鸣 器内部带震荡源，所以只要通电就会鸣叫；而无源蜂鸣器内部不带震荡源，因 此如果用直流信号无法令其鸣叫，这就需要用 2K-5K 的方波（声音频率）去驱 动。

通过前面对无源蜂鸣器的特点介绍可知，要使无源蜂鸣器能够正常发声， 需要在控制端 BEEP 给出相应频率的 PWM 波。因此，对于无源蜂鸣器的控制， 就转化为了设计一个 PWM 波发生电路。因此，接下来将介绍 PWM 波的发生部 分相关设计。 PWM 波即脉冲宽度调制，英文全称 Pulse Width Modulation。PWM 控制技 术广泛应用在测量、通信、功率控制与变换的等众多领域中，应用的逆变电路 绝大部分是 PWM 型。以下为周期为 1KHz，脉冲宽度（占空比）分别为 20%、 50%、90%的波形图：

对于 FPGA 来说，要产生 PWM 波，也可以借鉴单片机或 DSP 使用定时器 产生 PWM 波的思路。依据 PWM 模块发生器原理可知需设计两个主要电路：定时器/计数器电路以及输出比较电路。

## 信号描述

| 接口名称    | I/O  | 功能描述                       |
| :---------- | :--- | :----------------------------- |
| clk         | I    | 模块工作时钟，50MHz            |
| reset_n     | I    | 模块复位信号                   |
| pwm_gen_en  | I    | PWM 产生模块使能信号           |
| counter_arr | I    | 输入32位预重装值，确定频率     |
| counter_ccr | I    | 输入32位输出比较值，确定占空比 |
| pwm_out     | O    | PWM输出信号                    |

代码展示

```verilog
//左边j20   右边j21
//这里使用2K~4k 的PWM波
//计算公式
//pwm频率公式     f = f(sys_clk) / count_arr;
module my_pwm
#(
    parameter f_pwm         = 293,        //pwm 输出频率（hz）
    parameter pwm_duty      = 70,          //0~100   pwm输出占空比
    parameter f_clk         = 100_000_000   //输入时钟信号(hz)
)(
    input wire sys_clk,
    input wire sys_rst,             //高使能
    input wire pwm_en,              //高使能

    // input wire [31:0] count_arr,    //确定频率
    // input wire [31:0] count_ccr,    //确定占空比

    output reg pwm,                      // leisure(空闲时)----> 0 低电平
    // output wire gnd,
    // output wire level,

    output wire led,
    output wire led2
    );
    wire [31:0] count_arr;
    wire [31:0] count_ccr;
    
    reg [31:0] count;

    assign gng          = 1'b1;
    assign level        = 1'b0;
    assign count_arr    = f_clk / f_pwm;
    assign count_ccr    = pwm_duty * count_arr / 100;
    assign led          = sys_rst ? 1'b1 : 1'b0;
    assign led2         = 1'b1;
    //计数器0~count_arr --------->产生对应的频率
    always @(posedge sys_clk or posedge sys_rst) begin
        if(sys_rst == 1'b1)
            count <= 1'b0;
            else if(pwm_en == 1'b1)begin
                if(count == count_arr)
                    count <= 1'b0;
                else 
                    count <= count + 1'b1;
                end
            else 
            count <= 1'b1;
    end
    //产生pwm波
    always @(posedge sys_clk or posedge sys_rst) begin
        if (sys_rst == 1'b1)
            pwm <= 1'b0;
        else if(count <= count_ccr)
            pwm <= 1'b1;
        else 
            pwm <= 1'b0;
    end

    
endmodule
```



# 14、vga显示彩条

## VGA 显示原理

VGA图像显示是通过扫描的方式，让图像在显示器上显示出来；在行同步和场同步的作用下，从上到下，从左到右的顺序扫描到显示器上；借助视觉停留的原理，我们看到的就是一副图像；

## VGA时序标准

为了匹配不同的厂家显示器，VGA有一套VGA时序标准；

1. 行同步时序
2. 场同步时序

### 行同步时序

一个完整的行扫描周期包括：Sync（同步）、Back Porch（后沿）、Left Border（左边框）、Addressable Video（有效图像）、Right Border（右边框）、Front Porch（前沿），这六部分的基本单位是像素，即一个像素周期； 

HSync在Sync时维持高电平，在其他时刻维持低电平；？？（在实际操作中也可进行反向）

### 场同步时序

一个完整的场扫描周期包括：Sync（同步）、Back Porch（后沿）、Top Border（上边框）、Addressable Video（有效图像）、Bottom Border（底边框）、Front Porch（前沿），这六部分的基本单位是行，即一个完整的行扫描周期； 

VSync在Sync时维持高电平，在其他时刻维持低电平；？？（在实际操作中也可进行反向）

## VGA 显示参数

| 显示模式     | 时钟(MHZ) | 行同步 | 行后沿 | 行左边框 | 行有效图像 | 行右边框 | 行前沿 | 行扫描周期 | 场同步 | 场后沿 | 场上边框 | 场有效图像 | 场底边框 | 场前沿 | 场扫描周期 |
| ------------ | --------- | ------ | ------ | -------- | ---------- | -------- | ------ | ---------- | ------ | ------ | -------- | ---------- | -------- | ------ | ---------- |
| 640X480@60   | 25.175    | 96     | 40     | 8        | 640        | 8        | 8      | 800        | 2      | 25     | 8        | 480        | 8        | 2      | 525        |
| 640X480@75   | 31.5      | 64     | 120    | 0        | 640        | 0        | 16     | 840        | 3      | 16     | 0        | 480        | 0        | 1      | 500        |
| 800X600@60   | 40        | 128    | 88     | 0        | 800        | 0        | 40     | 1056       | 4      | 23     | 0        | 600        | 0        | 1      | 628        |
| 800X600@75   | 49.5      | 80     | 160    | 0        | 800        | 0        | 16     | 1056       | 3      | 21     | 0        | 600        | 0        | 1      | 625        |
| 1024X768@60  | 65        | 136    | 160    | 0        | 1024       | 0        | 24     | 1344       | 6      | 29     | 0        | 768        | 0        | 3      | 806        |
| 1024X768@75  | 78.8      | 176    | 176    | 0        | 1024       | 0        | 16     | 1312       | 3      | 28     | 0        | 768        | 0        | 1      | 800        |
| 1280X1024@60 | 108       | 112    | 248    | 0        | 1280       | 0        | 48     | 1688       | 3      | 38     | 0        | 1024       | 0        | 1      | 1066       |

**时钟频率** = 行扫描周期 * 场扫描周期 * 刷新率；   25.175 = 800 * 525 * 60；

## VGA 静态显示

### 实验目标

编写VGA 驱动，使用EGO1 驱动VGA　在屏幕上显示１０条等宽彩条；

### 注意

时序模块计算

```verilog
always @(posedge clk or posedge rst) begin
if(rst == 1'b1)
hsync <= 1'b0;
else if((cnt_h >= 11'd0) && (cnt_h <= H_SYNAC-1'b1))
hsync <= 1'b1;
else
hsync <= 1'b0;
end
```

逻辑模块计算

```verilog
assign hsync = {cnt_h <= H_SYNAC-1'b0} ? 1'b1 : 1'b0 ;
```

### 流程框图

<img src="F:\project\VGA\doc\ｖｇａ＿ｃｏｌｏｂａｒ.png" alt="image-20230926201428960" style="zoom: 67%;" />

### 信号描述

| 信号  | 位宽 | 类型   | 功能       |
| ----- | ---- | ------ | ---------- |
| clk   | 1'b  | input  | 时钟信号   |
| rst   | 1'b  | input  | 复位信号   |
| hsync | 1'b  | output | 行同步信号 |
| vsync | 1'b  | output | 场同步信号 |
| rgb   | 12'b | output | 图像信号   |



### 代码实现

#### vga_pic

该模块实现图像信号；

| 信号    | 位宽 | 类型   | 功能         |
| ------- | ---- | ------ | ------------ |
| clk     | 1'b  | input  |              |
| rst     | 1'b  | input  |              |
| pi_x    | 11'b | input  | 像素点横坐标 |
| pi_y    | 11'b | input  | 像素点纵坐标 |
| pi_data | 12'b | output | 图像信号     |

#### 代码实现

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:37:30
// Design Name: 
// Module Name: vga_pic
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


module vga_pic(
    input wire clk,
    input wire rst,
    input wire [10:0] pi_x,
    input wire [10:0] pi_y,
    
    output reg [11:0] pi_data 
    );

    parameter   H_VALID = 11'd1280,
                C_VALID = 11'd1024;

    parameter   RED     = 12'hF80,
                ORANGE  = 12'hFC0,
                YELLOW  = 12'hFFE,
                GREEN   = 12'h07E,
                CYAN    = 12'h07F,
                BLUE    = 12'h01F,
                PURPPLE = 12'hF81,
                BLACK   = 12'h000,
                WHITE   = 12'hFFF,
                GRAY    = 12'hD69;

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_data <= WHITE;
        else if ((pi_x >= 11'd0) && (pi_x <= H_VALID / 10))
            pi_data <= ORANGE;
        else if ((pi_x >= H_VALID / 10 * 1) && (pi_x <= H_VALID / 10 * 2))
            pi_data <= YELLOW;
        else if ((pi_x >= H_VALID / 10 * 2) && (pi_x <= H_VALID / 10 * 3))
            pi_data <= GREEN;
        else if ((pi_x >= H_VALID / 10 * 3) && (pi_x <= H_VALID / 10 * 4))
            pi_data <= CYAN;
        else if ((pi_x >= H_VALID / 10 * 4) && (pi_x <= H_VALID / 10 * 5))
            pi_data <= BLUE;
        else if ((pi_x >= H_VALID / 10 * 5) && (pi_x <= H_VALID / 10 * 6))
            pi_data <= PURPPLE;
        else if ((pi_x >= H_VALID / 10 * 6) && (pi_x <= H_VALID / 10 * 7))
            pi_data <= BLACK;
        else if ((pi_x >= H_VALID / 10 * 7) && (pi_x <= H_VALID / 10 * 8))
            pi_data <= WHITE;
        else if ((pi_x >= H_VALID / 10 * 8) && (pi_x <= H_VALID / 10 * 9))
            pi_data <= GRAY;
        else if ((pi_x >= H_VALID / 10 * 9) && (pi_x <= H_VALID))
            pi_data <= RED;
        else
            pi_data <= BLACK;
    end
    
endmodule

```

#### vga_ctrl

| 信号    | 位宽 | 类型   | 功能           |
| ------- | ---- | ------ | -------------- |
| clk     | 1'b  | input  |                |
| rst     | 1'b  | input  |                |
| pi_data | 12'b | input  | 图像信号       |
| pi_x    | 11'b | output | 像素点横坐标   |
| pi_y    | 11'b | output | 像素点纵坐标   |
| hsync   | 1'b  | output | 行同步信号     |
| vsync   | 1'b  | output | 场同步信号     |
| rgb     | 12'b | output | 最终的图像信号 |

#### 代码实现

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:34:54
// Design Name: 
// Module Name: vga_ctrl
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


module vga_ctrl(
    input   wire         clk,
    input   wire         rst,
    input   wire [11:0]  pi_data,    //像素点色彩信息
    
    output  wire [10:0]  pi_x,       //用以约束
    output  wire [10:0]  pi_y,
    output  wire         hsync,
    output  wire         vsync,
    output  wire [11:0]  rgb         //RGB图像色彩信息
    );

    parameter H_MAX = 11'd1688;
    parameter C_MAX = 11'd1066;
    parameter PI_X_MAX = 11'd1280;
    parameter PI_Y_MAX = 11'd1024;

    parameter H_SYNAC = 11'd112;
    parameter H_BACK = 11'd248;
    parameter H_LEFT  = 11'd0;
    parameter H_VIDEO = 11'd1280;
    parameter H_RIGHT = 11'd0;
    parameter H_FRONT = 11'd48;
    
    parameter C_SYNAC = 11'd3;
    parameter C_BACK = 11'd38;
    parameter C_TOP  = 11'd0;
    parameter C_VIDEO = 11'd1024;
    parameter C_BOTTOM = 11'd0;
    parameter C_FRONT = 11'd1;

    reg [10:0]  cnt_h;  //行计数器
    reg [10:0]  cnt_c;  //场计数器
    wire        re_en;  //像素信息请求 re_en
    wire        valid;  //vga有效区域

    //产生一个计数器，记到0~1687
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_h <= 11'd0;
        else if(cnt_h == H_MAX - 1'b1)
            cnt_h <= 11'd0;
        else 
            cnt_h <= cnt_h + 1'b1;
    end

    //产生一个计数器， 0~1065
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_c <= 11'd0;
        else if((cnt_c == C_MAX - 1'b1)&&(cnt_h == C_MAX - 1'b1))
            cnt_c <= 11'd0;
        else if(cnt_h == H_MAX - 1'b1)
            cnt_c <= cnt_c + 1'b1;
        else 
            cnt_c <= cnt_c;
    end

    //行同步信号
    assign hsync = {cnt_h <= H_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //场同步信号
    assign vsync = {cnt_c <= C_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //像素信息请求 re_en
    assign re_en = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT-1'b1))                                //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO-1'b1)))                     //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c >= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //vga有效区域 valid
    assign valid = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT))                                     //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO)))                          //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c <= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //pi_x
    assign pi_x = {re_en == 1'b1} ? {cnt_h - (H_SYNAC + H_BACK + H_LEFT - 1'b1)} : 11'd0;
    //pi_y
    assign pi_y = {re_en == 1'b1} ? {cnt_c - (C_SYNAC + C_BACK + C_TOP)} : 11'd0;
    //rgb
    assign rgb = {valid == 1'b1} ? pi_data : 12'd0;
endmodule

```

#### vga_colobar

顶层模块

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 21:32:14
// Design Name: 
// Module Name: vag_colorbar
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


module vag_colorbar(
    input   wire         clk,
    input   wire         rst,

    output  wire         hsync,
    output  wire         vsync,
    output  wire  [11:0] rgb,                //
    output  reg          led
    );

    //通过调用IP核产生108MHZ时钟信号，对应1280x1024@60
    wire    clk_108;
    wire    locked;
    wire    rst_n;

    wire    [11:0] pi_data;
    wire    [10:0] pi_x;
    wire    [10:0] pi_y;



    pll_108 pll_108_inst(
        .clk_in1(clk),
        .reset(rst),

        .locked(locked),
        .clk_out1(clk_108)
    );
    assign rst_n = (rst | ~locked);

    always @(posedge clk_108 or posedge rst_n) begin
        if(rst_n == 1'b1)
            led <= 1'b0;
        else 
            led <= 1'b1;
    end
    // wire [11:0] rgb1;
    //VGA时序控制模块vga_ctrl
    vga_ctrl vga_ctrl_inst (
        .clk(clk_108),
        .rst (rst_n),
        .pi_data(pi_data),

        .pi_x(pi_x),
        .pi_y(pi_y),
        .hsync(hsync),
        .vsync(vsync),
        .rgb(rgb)
    );
    // assign rgb = 12'hFFE;
    //图像数据产生模块vga_pic
    vga_pic vga_pic_inst(
        .clk(clk_108),
        .rst(rst_n),
        .pi_x(pi_x),
        .pi_y(pi_y),

        .pi_data(pi_data)
    );
endmodule

```

# 15、VGA 字符显示

## 字符取模

我们平时在显示屏或 LED 广告牌上看到的字符，它的本质就是点阵。将点阵类比于书 写纸张的话，点阵中显示的字符就是书写在纸张上的笔顺。在显示器或 LED 广告牌上，将 类比于纸张的点阵和类比于笔顺的字符分别显示不同的颜色，我们就在显示器上实现了字 符的显示。同时，点阵的大小决定了显示区域的大小、字符的大小和清晰度。 我们一般使用 0、1 的组合来描述点阵，点阵中的每一个数据项表示单个像素点，我们 使用单比特来表示，字符显示部分的数据项赋值为 1，非字符显示部分的数据项赋值为 0。

通过字符取模软件“PCtoLCD2002”获得“西安邮电”；

```
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
000000000000000000000000000000000003C000000000000000000000000000;
0000000000000000000000E0000000000001F000000000000000078000000000;
0000000000000000000000FC000000000001F00000000000000007C000000000;
000000003E0000000000007E000000000001E00000000000000003C000000000;
00000007FF0000000000003F000000000000E00000000000000003C000000000;
000001FFFF0000000000001F000000000000E00000000000000003C000000000;
0003FFFFFE00000000000007000000000000E00000000000000003C000000000;
0007FFFFE000000000000000000000000000E000000F8000000003C000000000;
0000FFFE0000000000000000018000000000E000003FC000000003C000000000;
00003C1F80000000000100000FE000000000E00071FFE000000003C000000000;
00003E1F8000000000018003FFF800000000E0007FCFC000000003803F000000;
00003F0F80000000000180FFC0FC00000000E000780F80000000038FFFC00000;
00001F0F800000000003FFE001FE00000000E060380F0000000007FFFFE00000;
00001E0F000000000003E00001FC00000000E7F8380E000000FFFFC00FE00000;
00001E1F000000000007800003C000000000FFFC380C0000007FE38007E00000;
00001E1F000000000007800007000000071FE0FC380C00000078038007C00000;
00001E1F1FFC0000000F00000400000007FCE078381800000038038007800000;
00001E3FFFFF0000000F0030000000000780E07838180000003803800F800000;
00001FFFFFFF8000000E00380000000003C0E07838300000003803800F000000;
038FFFFE001FC000000C003C0000000003C0E07038300000001C03FF0F000000;
03FFFE1E000FE000000000380000000003C0E07038300000001C1FFF0F000000;
03FF9E1E000FE000000000780000000001C0FF70381C0000001CFFF80E000000;
01F81E1E000FC000000000700000000001C3FF70380E0000001C33801E000000;
01F81E1E000F8000000000608000800001DFF87038070000001C03801C000000;
00F81E1E000F8000000000E0E3FFF00001C0E07038078000000C03801C000000;
00F83C1FE01F8000000000EFFFFFF80001C0E0703803C000000C03801C000000;
00F83C1FFC1F000000003FFFFFFFF80000C0C0703803C000000E038038000000;
00783C0FFC1F00001FFFFFF0E000000000C0C0703801E000000E038FB8000000;
00787803FC1F00000FFFF180E000000000C0C0F03801E000000E0FFFF0000000;
00787800001F000007E00301E000000000C0C0E03801E0000007FFF030000000;
007CF000003E000000000301C000000000C0C0E03841E0000007E38020000000;
007CE000003E000000000603C000000000E0CFE0383FE0000006038000000000;
003DC000003E000000000603800000000063FFE0381FE0000000038000000000;
003C0000003E0000000007C380000000007FE1C03807E0000000038000000000;
003C0003F87E0000000000FF80000000007000803803C0000000038000010000;
003C07FFFC7E00000000003F00000000006000003803C0000000038000010000;
003FFFFFFE7C00000000000FC000000000000000380180000000038000030000;
003FFFFFFFFC00000000001FE000000000000000380000000000038000030000;
001C00000FFC00000000003CF80000000000000038000000000001C000030000;
001C000007F80000000000F87E0000000000000038000000000001E000078000;
0018000007F80000000001E03F0000000000000038000000000001F0000F8000;
0000000007F00000000007C00FC000000000000038000000000000FE007FC000;
0000000003E0000000001F0007E0000000000000380000000000007FFFFF8000;
0000000003C000000000FC0003E0000000000000380000000000003FFFFE0000;
0000000003C000000003800001F00000000000003800000000000007FFF00000;
00000000038000000000000000F0000000000000300000000000000000000000;
0000000000000000000000000070000000000000300000000000000000000000;
0000000000000000000000000000000000000000300000000000000000000000;
0000000000000000000000000000000000000000300000000000000000000000;
0000000000000000000000000000000000000000300000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
0000000000000000000000000000000000000000000000000000000000000000;
```



| 模块名称 | 功能描述                                     |
| :------- | :------------------------------------------- |
| vga_char | 顶层模块                                     |
| pll_108  | 时钟生成模块，生成 VGA 驱动时钟使用pll IP 核 |
| vga_ctrl | VGA 时序控制模块，控制 VGA 图像显示          |
| vga_pic  | 图像数据生成模块，生成 VGA 显示图像          |



## 代码实现

### vga_char

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
// Design Name: 
// Module Name: vga_char
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


module vga_char(
    input   wire         clk,
    input   wire         rst,

    output  wire         hsync,
    output  wire         vsync,
    output  wire  [11:0] rgb,                //
    output  reg          led
    );

    //通过调用IP核产生108MHZ时钟信号，对应1280x1024@60
    wire    clk_108;
    wire    locked;
    wire    rst_n;

    wire    [11:0] pi_data;
    wire    [10:0] pi_x;
    wire    [10:0] pi_y;



    pll_108 pll_108_inst(
        .clk_in1(clk),
        .reset(rst),

        .locked(locked),
        .clk_out1(clk_108)
    );
    assign rst_n = (rst | ~locked);

    always @(posedge clk_108 or posedge rst_n) begin
        if(rst_n == 1'b1)
            led <= 1'b0;
        else 
            led <= 1'b1;
    end

endmodule

```

### vga_ctrl

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
// Design Name: 
// Module Name: vga_ctrl
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


module vga_ctrl(
    input   wire         clk,
    input   wire         rst,
    input   wire [11:0]  pi_data,    //像素点色彩信息
    
    output  wire [10:0]  pi_x,       //用以约束
    output  wire [10:0]  pi_y,
    output  wire         hsync,
    output  wire         vsync,
    output  wire [11:0]  rgb         //RGB图像色彩信息
    );

    parameter H_MAX = 11'd1688;
    parameter C_MAX = 11'd1066;
    parameter PI_X_MAX = 11'd1280;
    parameter PI_Y_MAX = 11'd1024;

    parameter H_SYNAC = 11'd112;
    parameter H_BACK = 11'd248;
    parameter H_LEFT  = 11'd0;
    parameter H_VIDEO = 11'd1280;
    parameter H_RIGHT = 11'd0;
    parameter H_FRONT = 11'd48;
    
    parameter C_SYNAC = 11'd3;
    parameter C_BACK = 11'd38;
    parameter C_TOP  = 11'd0;
    parameter C_VIDEO = 11'd1024;
    parameter C_BOTTOM = 11'd0;
    parameter C_FRONT = 11'd1;

    reg [10:0]  cnt_h;  //行计数器
    reg [10:0]  cnt_c;  //场计数器
    wire        re_en;  //像素信息请求 re_en
    wire        valid;  //vga有效区域

    //产生一个计数器，记到0~1687
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_h <= 11'd0;
        else if(cnt_h == H_MAX - 1'b1)
            cnt_h <= 11'd0;
        else 
            cnt_h <= cnt_h + 1'b1;
    end

    //产生一个计数器， 0~1065
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_c <= 11'd0;
        else if(cnt_c == C_MAX - 1'b1)
            cnt_c <= 11'd0;
        else 
            cnt_c <= cnt_c + 1'b1;
    end

    //行同步信号
    assign hsync = {cnt_h <= H_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //场同步信号
    assign vsync = {cnt_c <= C_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //像素信息请求 re_en
    assign re_en = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT-1'b1))                                //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO-1'b1)))                     //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c >= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //vga有效区域 valid
    assign valid = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT))                                     //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO)))                          //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c >= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //pi_x
    assign pi_x = {re_en == 1'b1} ? {cnt_h - (H_SYNAC+H_BACK+H_LEFT-1'b1)} : 11'd0;
    //pi_y
    assign pi_y = {re_en == 1'b1} ? {cnt_c - (C_SYNAC+C_BACK+C_TOP)} : 11'd0;
    //rgb
    assign rgb = {valid == 1'b1} ? pi_data : 12'd0;
endmodule

```

### vga_pic

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
// Design Name: 
// Module Name: vga_pic
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


module vga_pic(
    input wire clk,
    input wire rst,
    input wire [10:0] pi_x,
    input wire [10:0] pi_y,
    
    output reg [11:0] pi_data 
    );

    reg [255:0] char    [63:0] ;        //字符数据
    reg     work_en; 
    parameter H_MAX = 11'd1688;
    parameter C_MAX = 11'd1066;
    parameter PI_X_MAX = 11'd1280;
    parameter PI_Y_MAX = 11'd1024;

    parameter   RED     = 12'hF80,
                ORANGE  = 12'hFC0,
                YELLOW  = 12'hFFE,
                GREEN   = 12'h07E,
                CYAN    = 12'h07F,
                BLUE    = 12'h01F,
                PURPPLE = 12'hF81,
                BLACK   = 12'h000,
                WHITE   = 12'hFFF,
                GRAY    = 12'hD69;

    always @(clk) begin
            char[0] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[1] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[2] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[3] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[4] <= 256'h000000000000000000000000000000000003C000000000000000000000000000;
            char[5] <= 256'h0000000000000000000000E0000000000001F000000000000000078000000000;
            char[6] <= 256'h0000000000000000000000FC000000000001F00000000000000007C000000000;
            char[7] <= 256'h000000003E0000000000007E000000000001E00000000000000003C000000000;
            char[8] <= 256'h00000007FF0000000000003F000000000000E00000000000000003C000000000;
            char[9] <= 256'h000001FFFF0000000000001F000000000000E00000000000000003C000000000;
            char[10] <= 256'h0003FFFFFE00000000000007000000000000E00000000000000003C000000000;
            char[11] <= 256'h0007FFFFE000000000000000000000000000E000000F8000000003C000000000;
            char[12] <= 256'h0000FFFE0000000000000000018000000000E000003FC000000003C000000000;
            char[13] <= 256'h00003C1F80000000000100000FE000000000E00071FFE000000003C000000000;
            char[14] <= 256'h00003E1F8000000000018003FFF800000000E0007FCFC000000003803F000000;
            char[15] <= 256'h00003F0F80000000000180FFC0FC00000000E000780F80000000038FFFC00000;
            char[16] <= 256'h00001F0F800000000003FFE001FE00000000E060380F0000000007FFFFE00000;
            char[17] <= 256'h00001E0F000000000003E00001FC00000000E7F8380E000000FFFFC00FE00000;
            char[18] <= 256'h00001E1F000000000007800003C000000000FFFC380C0000007FE38007E00000;
            char[19] <= 256'h00001E1F000000000007800007000000071FE0FC380C00000078038007C00000;
            char[20] <= 256'h00001E1F1FFC0000000F00000400000007FCE078381800000038038007800000;
            char[21] <= 256'h00001E3FFFFF0000000F0030000000000780E07838180000003803800F800000;
            char[22] <= 256'h00001FFFFFFF8000000E00380000000003C0E07838300000003803800F000000;
            char[23] <= 256'h038FFFFE001FC000000C003C0000000003C0E07038300000001C03FF0F000000;
            char[24] <= 256'h03FFFE1E000FE000000000380000000003C0E07038300000001C1FFF0F000000;
            char[25] <= 256'h03FF9E1E000FE000000000780000000001C0FF70381C0000001CFFF80E000000;
            char[26] <= 256'h01F81E1E000FC000000000700000000001C3FF70380E0000001C33801E000000;
            char[27] <= 256'h01F81E1E000F8000000000608000800001DFF87038070000001C03801C000000;
            char[28] <= 256'h00F81E1E000F8000000000E0E3FFF00001C0E07038078000000C03801C000000;
            char[29] <= 256'h00F83C1FE01F8000000000EFFFFFF80001C0E0703803C000000C03801C000000;
            char[30] <= 256'h00F83C1FFC1F000000003FFFFFFFF80000C0C0703803C000000E038038000000;
            char[31] <= 256'h00783C0FFC1F00001FFFFFF0E000000000C0C0703801E000000E038FB8000000;
            char[32] <= 256'h00787803FC1F00000FFFF180E000000000C0C0F03801E000000E0FFFF0000000;
            char[33] <= 256'h00787800001F000007E00301E000000000C0C0E03801E0000007FFF030000000;
            char[34] <= 256'h007CF000003E000000000301C000000000C0C0E03841E0000007E38020000000;
            char[35] <= 256'h007CE000003E000000000603C000000000E0CFE0383FE0000006038000000000;
            char[36] <= 256'h003DC000003E000000000603800000000063FFE0381FE0000000038000000000;
            char[37] <= 256'h003C0000003E0000000007C380000000007FE1C03807E0000000038000000000;
            char[38] <= 256'h003C0003F87E0000000000FF80000000007000803803C0000000038000010000;
            char[39] <= 256'h003C07FFFC7E00000000003F00000000006000003803C0000000038000010000;
            char[40] <= 256'h003FFFFFFE7C00000000000FC000000000000000380180000000038000030000;
            char[41] <= 256'h003FFFFFFFFC00000000001FE000000000000000380000000000038000030000;
            char[42] <= 256'h001C00000FFC00000000003CF80000000000000038000000000001C000030000;
            char[43] <= 256'h001C000007F80000000000F87E0000000000000038000000000001E000078000;
            char[44] <= 256'h0018000007F80000000001E03F0000000000000038000000000001F0000F8000;
            char[45] <= 256'h0000000007F00000000007C00FC000000000000038000000000000FE007FC000;
            char[46] <= 256'h0000000003E0000000001F0007E0000000000000380000000000007FFFFF8000;
            char[47] <= 256'h0000000003C000000000FC0003E0000000000000380000000000003FFFFE0000;
            char[48] <= 256'h0000000003C000000003800001F00000000000003800000000000007FFF00000;
            char[49] <= 256'h00000000038000000000000000F0000000000000300000000000000000000000;
            char[50] <= 256'h0000000000000000000000000070000000000000300000000000000000000000;
            char[51] <= 256'h0000000000000000000000000000000000000000300000000000000000000000;
            char[52] <= 256'h0000000000000000000000000000000000000000300000000000000000000000;
            char[53] <= 256'h0000000000000000000000000000000000000000300000000000000000000000;
            char[54] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[55] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[56] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[57] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[58] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[59] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[60] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[61] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[62] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
            char[63] <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
    end

    always @(posedge clk or posedge rst ) begin
         if(rst == 1'b1)
            work_en <= 1'b0;
        else if(((pi_x >= 11'd800) && (pi_x < 11'd1056)) && ((pi_y >= 11'd500) && (pi_y <= 11'd564)))
            work_en <= 1'b1;
        else 
            work_en <= 1'b0;
    end
    
    always @(posedge clk or posedge clk ) begin
        if(rst == 1'b1)
            pi_data <= WHITE;
        else if(work_en == 1'b1)
            if(char[(pi_x - 11'd800)][(pi_y - 11'd500)] == 1'b1)
                pi_data <= BLACK;
            else 
                pi_data <= WHITE;
        else
            pi_data <= WHITE;
    end

endmodule

```



# 16、基于rom  ---->vga 输出图片

## 图片预处理

我们先来说一下图片在存入 ROM 之前需要进行的预处理操作。在本次实验中，我们 用来存储图片的 ROM 是通过调用 IP 核，利用 FPGA 片上资源生成的只读存储器，但 FPGA 片上资源有限，生成 ROM 的存储空间也会受限，存储于 ROM 的图片大小也受到限 制。

ROM 作为只读存储器，在进行 IP 核设置时需要指定初始化文件， 即写入存储器中的 图片数据，图片要以规定的格式才能正确写入 ROM，在Quartus这种格式就是 MIF 文件，在vivado 中这种格式就是COE文件。

COE文件的格式如下：

```
<Radix_Keyword> = Value ; Optional Comment
<Data_Keyword> = Data_Value1, Data_Value2, Data_Value3;
```

即要求设定：表示格式（Radix）和数据（Data）。关键字（Keyword）不分大小写。（不同ip使用不同的对应COE文件具体格式，可以参阅BRAM，FIR Compiler等的ip手册）

Radix_Keyword可以是：

| Keyword                     | Description                       |
| --------------------------- | --------------------------------- |
| RADIX                       | 非存储模块的系数、内容设定        |
| MEMORY_INITIALIZATION_RADIX | 用于ROM/RAM等存储模块的内容初始化 |

举一个例子：

```coe
memory_initialization_radix=2;
memory_initialization_vector=
0,
0,
1,
0,
0,
1,
0,
1;
```



### matlab处理图片

由于本人比较懒，生成的text文件需要手动删除最后一行的空格并将最后一个数据的（，）改为；

```matlab
clear;
clc;

% 图片位置，使用imread 函数处理.png 图片，获取三维数据[高度，宽度，像素信息]
image_array = imread('F:\project\VGA\vga_rom\doc\images100X100.png');
[height,width,z] = size(image_array);
;拆解像素信息获取像素信息，像素信息（256）
red = image_array(:,:,1);
green = image_array(:,:,2);
blue = image_array(:,:,3);
;对颜色分亮进行均分
red1 =      (red / 16) -1;
green1  =   (green /16) -1;
blue1 =     (blue / 16) -1;

% coe文件位置
ftxt = fopen('F:\project\VGA\vga_rom\doc\rom.txt','w');
;对coe文件进行注释，以及配置
fprintf(ftxt,'; This .COE file specifies the contents for a block memory of depth=100X100, and width=12.\n');
fprintf(ftxt,'memory_initialization_radix=2;\n');
fprintf(ftxt,'memory_initialization_vector=\n');
for i = 1:100
   for j = 1:100
       red2 = dec2bin((red1(i,j)),4);
       green2 = dec2bin((green1(i,j)),4);
       blue2 = dec2bin((blue1(i,j)),4);
      fprintf(ftxt,'%s%s%s,\n',red2,green2,blue2); 
   end
end
fclose(ftxt);

```



![处理的图片](VGA/vga_rom/doc/images100X100.png)



像素为100X100

处理之后的coe文件

### coe

```coe
; This .COE file specifies the contents for a block memory of depth=100X100, and width=12.
memory_initialization_radix=2;
memory_initialization_vector=
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110011001,
101001000101,
101001000101,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
101000110101,
101000110101,
110010001000,
111010101010,
110110011001,
110001110111,
101001000101,
101000110101,
101001000101,
101000110101,
101101110111,
110110011001,
101001000101,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
110110101010,
110110011001,
110010011001,
110010011001,
110110101001,
111010111010,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101100111,
101001000101,
101101010110,
111010111011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001000101,
101001000101,
101001000101,
101001000101,
101001000101,
101001000101,
101001000101,
101001000101,
101000110100,
101101010110,
111010111011,
111011001011,
111010111011,
111010111011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
110110011001,
100001000101,
100000110100,
011100110100,
011100100011,
011100100011,
011100100011,
011100110011,
100000110100,
100001000100,
110010001000,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010001000,
101001000101,
101001000101,
111010111011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101100111,
101001000101,
101001000101,
101000110101,
101001000101,
101101010110,
101101100111,
110010001000,
111010101010,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
110010001000,
100001000100,
011100100011,
100000110100,
100101000101,
101001010110,
101001010110,
101101010110,
101001010110,
101001010110,
100101000101,
100000110100,
011100100011,
100001000100,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110011001,
101001000101,
101001000101,
110110101010,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
110001111000,
110010001000,
110110101010,
111010111011,
111010111011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
100001000100,
011100100011,
100101000101,
101001010110,
101101100110,
101101100111,
101101100111,
101101100111,
101101010110,
101101100110,
101101100111,
101101100111,
101101100111,
101101010110,
100101000101,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010101010,
101001000101,
101000110101,
110010001000,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100110100,
100000110100,
101001010110,
101101100111,
101101100111,
101101010110,
101101110111,
110010001001,
110110011010,
110110101011,
110110101010,
110010001001,
101101111000,
101101100110,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
101101100111,
100100110100,
110110011001,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010001000,
011100100011,
100101000100,
101101010110,
101101100111,
101101100111,
101101100111,
110110111011,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
110110111011,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111010,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110011001,
011100100011,
100101000100,
101101100111,
101101100111,
101101100111,
101101111000,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011110,
101101111000,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111010,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101110111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100111,
011100110011,
101101010110,
101101100111,
101101100111,
101101010110,
111011001101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
011100100011,
101001010110,
101101100111,
101101100111,
101101010110,
110110101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100111,
100000110100,
101101010110,
101101100111,
101101100111,
101101100111,
111011011110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
111011001011,
111010111011,
110110011001,
110010011001,
110010011001,
110110011001,
111010111010,
111011001011,
111111001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
111011001011,
111010111011,
110110011001,
110010011001,
101101110111,
101001100110,
100101010101,
100101010101,
100101010110,
101001100111,
101110001000,
110110011001,
111010101010,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
111011011110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
110010001000,
100101010110,
011100110100,
011100100011,
011100100011,
011100110011,
011100100011,
011100100011,
011100100011,
011100110011,
100101010101,
101101111000,
110110101001,
111010111011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
110110101010,
110010011001,
101101110111,
100101010110,
100000110100,
011100100011,
011100100011,
011100110011,
100000110100,
100000110100,
100000110100,
100000110100,
100000110100,
100000110100,
100000110100,
011100100011,
011100100011,
011100100011,
100101000101,
101101100111,
101101100111,
101101100111,
101101010110,
110110111100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100101010110,
100000110100,
011100100011,
100000110100,
101001010101,
101001010110,
101101010110,
101101010110,
101101010110,
101101010110,
101001010110,
101001000101,
100101000100,
011100100011,
011100110011,
100000110100,
110010011001,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010101010,
101001110111,
100000110100,
100000110100,
011100100011,
011100100011,
100000110100,
101001010101,
101001010110,
101101010110,
101101100110,
101101100110,
101101010110,
101101100110,
101101100110,
101101100110,
101101010110,
101101100110,
101101010110,
101001010110,
101001010110,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
101101111000,
011100100011,
100000110100,
100101000101,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001000101,
100000110100,
011100100011,
100101010110,
110110011001,
111011001011,
111010111011,
110010001000,
100101010101,
011100100011,
100000110100,
100000110100,
100101000101,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101111000,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100001000101,
011100100011,
100101000101,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101001010110,
100000110100,
011100110011,
100101010101,
100000110100,
011100100011,
100101000100,
101001010110,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100110011,
011000010010,
011000010001,
011000010001,
011000010010,
011000100010,
100101000100,
101001010110,
101101100111,
101101100111,
101101100111,
110010011001,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
100001000100,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100000110100,
100101000101,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
100000110100,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
011000100010,
100101000101,
101101100111,
101101100111,
101101010110,
110010011001,
110111001100,
111011011101,
111011101110,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100000110100,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100100110100,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
100101000100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110001111000,
110010011010,
110110101011,
110110101010,
101101111000,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001010110,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101100110,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
011100100011,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
101101010110,
101101010110,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101110111,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101010110,
110001111000,
110110101010,
110110111011,
110110101010,
110010001001,
101101010110,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
011100100011,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
100000110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101111000,
110110101010,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110111100,
110001111000,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001000101,
011000100010,
011000100010,
011100100010,
011100100011,
100001000100,
100101000101,
100001000100,
011100100011,
011000010010,
010100010001,
010100010001,
010100010001,
010100010001,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100111,
011100100011,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110010001001,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
110010001001,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101010110,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100101000100,
010100010001,
010100000001,
011100100011,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010001001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
100101000101,
100000110100,
100000110100,
100100110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100111,
100000110100,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101111000,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110011,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
011000010001,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100000110100,
100101000100,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110110111011,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
101101100111,
101101100111,
101101100111,
101001010110,
011000100010,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
101001010101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
101101100111,
101101100111,
101101100111,
011000100010,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010001000,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
110010011010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001100,
101101100111,
101101100111,
011100110011,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101111000,
110010001001,
110010001001,
110010001001,
101101111000,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101110111,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110110111100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010001001,
101101100111,
101001010110,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011011101,
111111101110,
111111111111,
111111111111,
111111111111,
111111101110,
111011001101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
111011001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001100,
101101010110,
101101100111,
100101000101,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
011000100010,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110001111000,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
110010001000,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101010101,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
101101100111,
101101100111,
101101100111,
100101000101,
010100010001,
010100010001,
010100010001,
010100010001,
100101000101,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101110111,
111011101110,
111111111111,
111111111111,
111111111111,
101110111011,
010101010101,
011101110111,
110111011101,
111111111111,
111111111111,
111111101110,
101101110111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100001000101,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
110010011010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010011001,
101101100111,
101101100111,
101101100111,
101001010110,
010100010001,
010100010001,
011000010001,
100101000101,
101101100111,
101101100111,
101101100110,
101101100111,
110001111000,
110010001000,
110010001000,
110001111000,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
110110011010,
111111111111,
111111111111,
111111111111,
011001100110,
000000000000,
000000000000,
000000000000,
000100010001,
101110111011,
111111111111,
111111111111,
111011001100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100001000101,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010001001,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
100101000101,
101001010110,
101101100111,
101101100111,
101101010110,
110010001001,
111011011101,
111111101110,
111111111111,
111111111111,
111111101110,
111011011110,
110010001001,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
111011011101,
111111111111,
111111111111,
101110111011,
000000000000,
000000000000,
000000000000,
000000000000,
000000000000,
000000000000,
111111111111,
111111111111,
111011101110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101010101,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110101010,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110110101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110111011,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
111111111111,
111111111111,
111111111111,
011101110111,
000000000000,
000000000000,
000000000000,
000000000000,
000000000000,
000000000000,
110011001100,
111111111111,
111111111111,
101101110111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010001000,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010001001,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110110101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110111011,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
111111111111,
111111111111,
111111111111,
100010001000,
000000000000,
000000000000,
000000000000,
000000000000,
000000000000,
000000000000,
110011001100,
111111111111,
111111111111,
101101111000,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101110111,
011100110011,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110110101011,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011110,
110010001001,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110001111000,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
111011011101,
111111111111,
111111111111,
110111011101,
000000000000,
000000000000,
000000000000,
000000000000,
000000000000,
001000100010,
111111111111,
111111111111,
111111101110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010001000,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010001001,
111111101110,
111111111111,
111111111111,
110110111011,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010001001,
111111111111,
111111111111,
111111111111,
111111111111,
010001000100,
001100110011,
100110011001,
110111011101,
111111111111,
111111111111,
111111111111,
111111111111,
110111001100,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010011010,
111111111111,
111111111111,
111111111111,
101110111011,
000000000000,
000000000000,
000000000000,
001000100010,
110111011101,
111111111111,
111111111111,
111011011101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
101101111000,
101101100111,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010011010,
111111111111,
111111111111,
111111111111,
111111101110,
010101010101,
000100010001,
000000000000,
000000000000,
000100010001,
110111011101,
111111111111,
111111111111,
111111111111,
101101010110,
101101100111,
101001010110,
100101000101,
100000110100,
011100110011,
011100100011,
011000010010,
011000010010,
010100000001,
010100000000,
010100010001,
011000110011,
011000110011,
010100110011,
100110001000,
111011101110,
111111111111,
111111111111,
111111111111,
110110111011,
101101110111,
101101100111,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100000110100,
100001000100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110110101010,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
111011101110,
011101110111,
000000000000,
000000000000,
111011101110,
111111111111,
111111111111,
111111111111,
100001000101,
011000010010,
011000010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
011100110011,
111011101110,
111111111111,
111111111111,
111111111111,
111111101110,
111011011110,
111011001100,
110010001001,
101101010110,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
100000110100,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010011001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
100110011001,
000000000000,
001000100010,
110111011101,
111111111111,
111011011101,
101010001000,
011000010001,
010100000001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
011000010010,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
110110111011,
110010001001,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010101010,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110001111000,
111111101110,
111111111111,
111111111111,
111111111111,
100010001000,
000000000000,
001000100010,
111011101110,
111111111111,
101110101010,
011000010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
011100110011,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
101101100111,
101101010110,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101010110,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001101,
111111111111,
111111111111,
111111111111,
101010101010,
010101010101,
111011101110,
111011101110,
100101100110,
010100000000,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110101011,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
011101000100,
010100000001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000000,
101010001000,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100101000101,
100000110100,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101111000,
111011011101,
111111111111,
111111111111,
111111101110,
100001010101,
010100000000,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000000,
101010001000,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111010,
011100100011,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
101101100111,
111011101110,
111111111111,
110010101010,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000000,
101010011001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101111000,
011100100011,
101001010101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010001001,
111111101110,
111111111111,
111111111111,
100001010101,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111010,
100000110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001100,
111111111111,
111111111111,
111111111111,
111111111111,
011000100010,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
011000100010,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100110011,
101001010110,
101101100111,
101101100111,
101101010110,
101001010101,
100101000101,
100000110100,
100101000101,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101110111,
111011001101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
011101000100,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000000,
100101100110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100111,
100000110100,
101101100111,
101101100111,
101101100110,
100000110100,
011100100011,
100000110100,
100000110100,
011100100011,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101111000,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
101110001000,
010100000001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000000,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100000110100,
100101000101,
101101100111,
101101100111,
100001000100,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
100000110100,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101111000,
111011011110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111011101,
011000010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
101110101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010101010,
011100100011,
101001010110,
101101100111,
101001010110,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
100000110100,
100000110100,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100101000101,
100000110100,
100101010110,
110010101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010111011,
010100000000,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
100001000100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100100011,
101101010110,
101101100111,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
101001010110,
101101100111,
101101100111,
101001010110,
100001000100,
011100100011,
100000110100,
100000110100,
100000110100,
011100100011,
100001010101,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
101110011001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
011000100011,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101111000,
100000110100,
101101010110,
101101010110,
100000110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100101000101,
101101100111,
100101000101,
011100110011,
100000110100,
101001010110,
101101010110,
101101100110,
101101100110,
101001010110,
011100100011,
101001100111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010111011,
011000010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
011100100011,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
100000110100,
101101010110,
101001010110,
011100110011,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100000110100,
100000110100,
011100100011,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100001000101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
100001010101,
011000010001,
010100000000,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
100001010101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010111011,
100101110111,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
100000110100,
101101100110,
101001010110,
011100110011,
101001010101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100100011,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010101,
100001000100,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111011101,
100101110111,
010100000000,
010100000000,
010100000001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100010001,
010100000001,
010100000000,
011101000100,
110010111011,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
011000010001,
011100110011,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
100000110100,
101101100110,
101001010110,
011100110011,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100001000101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
110010111011,
100101110111,
100001000100,
011100110011,
011100110011,
011100110011,
011100110011,
100001000100,
101001111000,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
011101000100,
011000010001,
010100010001,
010100010001,
101010001000,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100111,
100000110100,
101101010110,
101101010110,
100000110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100101010110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
111011101110,
111011101110,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111001100,
011000010001,
011100010010,
011100010010,
010100000001,
100101111000,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101110001000,
100000110100,
101101010110,
101101100111,
100000110100,
100000110100,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
101110011001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
101001110111,
010100000001,
011000010010,
011100010010,
011100010010,
010100000001,
101010011001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
011100100011,
101101010110,
101101100111,
101101010110,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100100011,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
101001110111,
011000010001,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
010100000000,
101110101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
011100110011,
100101000101,
100000110100,
011100100011,
011100100011,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
110010101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
101010011001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
110010111100,
101001110111,
011000010001,
011000000001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
010100000000,
110111011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100110011,
011100100011,
100001000100,
101001010101,
101001010110,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100000110100,
100101010101,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111011101,
010100010001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111011101,
100101110111,
011000010001,
010100010001,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
010100010001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101110001000,
011100100011,
100001000100,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
100000110100,
100000110100,
110111011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
101010001001,
010100010001,
011000100011,
101110011001,
110111001100,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
110111011101,
110010111011,
101110011001,
100001100110,
011000100010,
010100000000,
011000000001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000010001,
100001100110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100100011,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100000110100,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111001100,
010100000000,
011000010001,
011100010010,
011000010001,
010100010001,
011000010001,
011000100010,
011100110011,
100001010101,
100001010101,
100001010101,
100001000100,
011000100010,
011000010001,
011000010001,
011000010001,
010100010001,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000000001,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100100011,
101110001001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
100101100110,
101110101010,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000100011,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010001000,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100100011,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
011100110100,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000000001,
101010001000,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101000101,
100101000100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
101001010101,
101001010101,
101001010101,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
011100110011,
101001110111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111001100,
010100000001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000100010,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100000110100,
011100100011,
011100100011,
011100100011,
011100100011,
011100110011,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100101010101,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
100101110111,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
010100010001,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110011001,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
100000110100,
100000110100,
100101000101,
101101100110,
101101100111,
101101010110,
100101000101,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100001000101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
011000100010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000010001,
100101100110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
100000110011,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010101,
100000110100,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111001100,
010100000000,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000010001,
100001010101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100110011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
100000110100,
100101000100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100001000101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110010101010,
010100010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000010001,
100001010101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110011001,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100000110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100001000100,
100101010110,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110011001100,
011000010001,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
010100000000,
101001110111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111010,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100000110100,
101001110111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111011101,
011101000100,
011000010001,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011000010001,
011000100010,
101110101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100001000100,
101001000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
110010111011,
011000010010,
010100000000,
011000010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
011100010010,
010100000000,
010100000000,
101010001000,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101010110,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
011100110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100001000101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
101110101010,
100001000100,
011100100011,
011000010010,
011000000001,
011000000001,
011000010001,
011000000001,
011000000001,
011000010010,
011000100010,
011101000100,
101010011001,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100000110100,
011100110011,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100100011,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
111011011101,
110111001100,
110010101010,
110010101010,
110010101010,
110111001100,
110111011101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101000101,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
101001110111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
100101010110,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101111000,
011100110011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100001000101,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100110011,
100101010110,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100110011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100110011,
101001000101,
110110111100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
100000110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100110011,
100101000101,
101101100111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110111011,
100101000101,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101110111,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
100000110100,
011100110011,
101001010110,
110010001001,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011110,
101110001001,
100000110100,
011100100011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
100000110100,
011100100011,
011100110011,
100101000101,
110110011010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110111011,
100101000101,
011100100011,
011100100011,
100101000101,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100000110100,
100000110100,
011100100011,
100100110100,
110010101010,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110111001100,
101001100111,
011100100011,
011100110011,
100000110100,
101001010110,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101110111,
100000110011,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
101001010110,
101001010110,
011100100011,
011100100011,
101001100111,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
110110111011,
100101010110,
011100110011,
011100100011,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101000101,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100000110100,
100000110100,
101101100111,
101101100111,
100101000101,
100000110100,
011100100011,
100001010110,
101110011010,
110111001100,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
110110111011,
101110001001,
100001000100,
011100100011,
011100110011,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100100011,
100101000101,
101101100111,
101101100111,
101101100110,
101001010110,
100000110100,
011100100011,
011100100011,
100000110100,
101001100110,
101110101010,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
111011011101,
101110011001,
100101010101,
100000110100,
011100100011,
011100100011,
100000110100,
100101000101,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010101010,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
100101000101,
011100100011,
100000110100,
101001010110,
101101100111,
101101100111,
101101100111,
101101100110,
101001010110,
100101000101,
100000110100,
011100100011,
011100100011,
011100100011,
100101010110,
100101100111,
101110001000,
110010011010,
110010101010,
110010101011,
110110111011,
110110111011,
110110111011,
110110111100,
110110111011,
110110111011,
110010101011,
110010101011,
110010011010,
101110001001,
101101111000,
101001010110,
100001000100,
100000100011,
011100100011,
011100100011,
011100100011,
100000110100,
100000110100,
100101000101,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101001010110,
011100110100,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101010110,
101001010110,
101001010110,
100101000101,
100000110100,
100000110100,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
011100100011,
100000110100,
100000110100,
100101000101,
100101000101,
101001010110,
101101010110,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
101001010110,
101001010110,
101001010110,
101001010110,
101001010110,
101001010110,
101001010110,
101001010110,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101110111,
110001111000,
110010001001,
110010001001,
110010011001,
110010011001,
110010011001,
110010001001,
110010001001,
110001111000,
101101111000,
101101100111,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
101101100111,
110010011010,
111011001101,
111011101110,
111111101110,
111111101111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111101110,
111011011101,
110110111011,
101101110111,
101101010110,
101101100111,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110010011001,
011100100011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
101101111000,
110010011001,
111011001101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011011101,
110010001001,
101101100111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111010,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
101101111000,
111011001101,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011101110,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
011100100011,
101001010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100110,
110001111000,
110111001100,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111111001011,
100101010101,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011001100,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101101111000,
011100100011,
101101100110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
110010001001,
111011011110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
011100110011,
100101000101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101010110,
110110111011,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111011,
100101000101,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011011101,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
110110101010,
011100100011,
101001010101,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101110111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
101001100110,
011100110011,
101101010110,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101111000,
111111101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111011001011,
111010111010,
100000110100,
100000110100,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
101101100111,
111011101110,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111,
111111111111;
```



## 代码展示

### vga_rom

```verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 20:41:25
// Design Name: 
// Module Name: vga_rom
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


module vga_rom(
    input wire              clk,
    input wire              rst,

    output  wire            hsync,
    output  wire            vsync,
    output  reg             en,
    //output  wire [11:0]     rgb         //RGB图像色彩信息
    output wire [7:0] red,
    output wire [7:0] blue,
    output wire [7:0] green
    );

    wire clk_25;
    wire clk_25x5;
    wire locked;
    wire rst_n;
    wire [11:0] pi_data;
    wire [10:0] pi_x;
    wire [10:0] pi_y;
    wire [7:0] red_in;
    wire [7:0] blue_in;
    wire [7:0] green_in;


    assign rst_n = (rst | ~locked);

    //需要进行优化
    always @(posedge clk or posedge rst_n) begin
        if(rst_n == 1'b1)
            en <= 1'b0;
        else 
            en <= 1'b1;
    end

    vga_pic vga_pic_inst(
        .clk        (clk_25),
        .rst        (rst_n),
        .pi_x       (pi_x),
        .pi_y       (pi_y),
        
        //.pi_data    (pi_data)
        .red        (red_in),
        .blue       (blue_in),
        .green      (green_in)
    );

    vga_ctrl vga_ctrl_inst(
        .clk        (clk_25),
        .rst        (rst_n),
        //.pi_data    (pi_data),
        .red        (red_in),
        .blue       (blue_in),
        .green      (green_in),
        
        .pi_x       (pi_x),
        .pi_y       (pi_y),
        //.rgb        (rgb),
        .hsync      (hsync),
        .vsync      (vsync),
        .red_out        (red),
        .blue_out       (blue),
        .green_out      (green)
    );

    pll_clk pll_clk_inst(
        .clk_in1    (clk),
        .reset      (rst),

        //.clk_108    (clk_108),
        .clk_25     (clk_25),
        .locked     (locked)
    );
endmodule

```

### vga_pic

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
// Design Name: 
// Module Name: vga_pic
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

//四位转八位
module vga_pic(
    input wire clk,
    input wire rst,
    input wire [10:0] pi_x,
    input wire [10:0] pi_y,
    
    output wire [7:0] red,
    output wire [7:0] blue,
    output wire  [7:0] green
    );
    
    wire [23:0] douta;
    reg  [23:0] data;

    parameter H_MAX = 11'd800;
    parameter C_MAX = 11'd525;
    parameter PI_X_MAX = 11'd640;
    parameter PI_Y_MAX = 11'd480; 

    reg [14:0] addra;

    reg rom_en;
    always @(posedge clk or posedge rst ) begin
        if(rst == 1'b1)
            rom_en <= 1'b0;
        else if(((pi_x >= 11'd1) && (pi_x < 11'd100)) && ((pi_y >= 11'd1) && (pi_y <= 11'd100)))
            rom_en <= 1'b1;
        else 
            rom_en <= 1'b0;
    end 

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            addra <= 1'b0;
        else if(rom_en == 1'b1)
            addra <= (((pi_y - 1'b1) * 11'd100) + pi_x);
        else 
            addra <= 1'b0;
    end

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            data <= 24'b0;
        else if(rom_en == 1'b1)
            data <= douta;
        else 
            data <= 24'b0;
    end

    assign red = data[23:16];
    assign green = data[15:8];
    assign blue = data[7:0];

    rom_hdmi rom_hdmi_inst
   (
    .clka   (clk),
    .addra   (addra),

    .douta   (douta)
    );
endmodule

```

### vga_ctrl

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:37:12
// Design Name: 
// Module Name: vga_ctrl
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


module vga_ctrl(
    input   wire         clk,
    input   wire         rst,
    input   wire [11:0]  pi_data,    //像素点色彩信息
    
    output  wire [10:0]  pi_x,       //用以约束
    output  wire [10:0]  pi_y,
    output  wire         hsync,
    output  wire         vsync,
    output  wire [11:0]  rgb         //RGB图像色彩信息
    );

    parameter H_MAX = 11'd1688;
    parameter C_MAX = 11'd1066;
    parameter PI_X_MAX = 11'd1280;
    parameter PI_Y_MAX = 11'd1024;

    parameter H_SYNAC = 11'd112;
    parameter H_BACK = 11'd248;
    parameter H_LEFT  = 11'd0;
    parameter H_VIDEO = 11'd1280;
    parameter H_RIGHT = 11'd0;
    parameter H_FRONT = 11'd48;
    
    parameter C_SYNAC = 11'd3;
    parameter C_BACK = 11'd38;
    parameter C_TOP  = 11'd0;
    parameter C_VIDEO = 11'd1024;
    parameter C_BOTTOM = 11'd0;
    parameter C_FRONT = 11'd1;

    reg [10:0]  cnt_h;  //行计数器
    reg [10:0]  cnt_c;  //场计数器
    wire        re_en;  //像素信息请求 re_en
    wire        valid;  //vga有效区域

    //产生一个计数器，记到0~1687
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_h <= 11'd0;
        else if(cnt_h == H_MAX - 1'b1)
            cnt_h <= 11'd0;
        else 
            cnt_h <= cnt_h + 1'b1;
    end

    //产生一个计数器， 0~1065
    always @(posedge clk or posedge rst) begin
        if(rst == 11'd1)
            cnt_c <= 11'd0;
        else if((cnt_c == C_MAX - 1'b1)&&(cnt_h == C_MAX - 1'b1))
            cnt_c <= 11'd0;
        else if(cnt_h == H_MAX - 1'b1)
            cnt_c <= cnt_c + 1'b1;
        else 
            cnt_c <= cnt_c;
    end

    //行同步信号
    assign hsync = {cnt_h <= H_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //场同步信号
    assign vsync = {cnt_c <= C_SYNAC-1'b1} ? 1'b1 : 1'b0 ;
    //像素信息请求 re_en
    assign re_en = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT-1'b1))                                //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO-1'b1)))                     //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c >= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //vga有效区域 valid
    assign valid = {((cnt_h >= (H_SYNAC+H_BACK+H_LEFT))                                     //11'd359
                     &&(cnt_h <= (H_SYNAC+H_BACK+H_LEFT+H_VIDEO)))                          //11'd1639
                     ||((cnt_c >= (C_SYNAC+C_BACK+C_TOP))                                   //11'd41
                     &&(cnt_c <= (C_SYNAC+C_BACK+C_TOP+C_VIDEO)))} ? 1'b1 : 1'b0;           //11'd1065
    //pi_x
    assign pi_x = {re_en == 1'b1} ? {cnt_h - (H_SYNAC + H_BACK + H_LEFT - 1'b1)} : 11'd0;
    //pi_y
    assign pi_y = {re_en == 1'b1} ? {cnt_c - (C_SYNAC + C_BACK + C_TOP)} : 11'd0;
    //rgb
    assign rgb = {valid == 1'b1} ? pi_data : 12'd0;
endmodule

```



# 17、串口(UART)RS232

串口作为常用的三大低速总线（UART,   SPI,    IIC）之一；与SPI , IIC 不同的是，UART 是异步通信接口；

## 通信协议

rs232没有时钟线，只有俩个位宽为1bit的数据线rx（用于接受数据的线）,tx（用于发送数据的线），数据的发送是基于帧结构，即一帧一帧的发送数据与接受数据；每一帧的结构为    起始位0，8比特的数据，停止位1，空闲状态为高电平；

这里使用9600的波特率；进行解释

码元：在信息传递传输通道中携带数据信息的信号单元，（串口是1bit进行传输的，码元就是一个二进制数）

波特率：每秒中通过信号传输的码元数；（选用9600Baud）

比特率：每秒钟通信信道传输的信息量为位传输量，简称比特率；(9600Bps = 9600Baud * 1bit)

计数个数（cnt = (1s * 10^9)ns / 9600bit ）* (周期为10)  = 10416个周期；

## 实战目标

实现串口协议rs232 

## 内容

### 模块说明

| 模块名称 | 功能                                             |
| -------- | ------------------------------------------------ |
| rs232    | rs232回环测试顶层模块                            |
| uart_rx  | rs232串口数据接受模块          1bit------->8bit  |
| uart_tx  | rs232串口数据发送模块           8bit------->1bit |

### rs232

#### 信号描述

| 信号 | 位宽 | 类型   | 功能     |
| ---- | ---- | ------ | -------- |
| rst  | 1'b  | input  | 复位     |
| clk  | 1'b  | input  | 时钟     |
| rx   | 1'b  | input  | 接收信号 |
| tx   | 1'b  | output | 输出信号 |

#### 代码

```verilog
module rs232
(
    input wire clk,
    input wire rst,
    input wire rx,

    output wire tx
    );

    wire [7:0] data;
    wire       flag;

    parameter  UART_BPS = 14'd9600;
    parameter  CLK      = 27'd100_000_000;

    uart_rx     
    #(
        .UART_BPS (UART_BPS),
        .CLK      (CLK)
    )
    uart_rx_inst
    (

        .clk(clk),
        .rst(rst),
        .rx(rx),

        .po_data(data),
        .po_data_flag(flag)
    );

    uart_tx 
    #(
        .UART_BPS (UART_BPS),
        .CLK      (CLK)
    ) 
    uart_tx_inst
   (
        .clk(clk),
        .rst(rst),
        .pi_data(data),
        .pi_data_flag(flag),

        .tx(tx)
    );
    
endmodule

```

### uart_rx

#### 信号描述

| 信号         | 位宽 | 类型   | 功能         |
| ------------ | ---- | ------ | ------------ |
| rst          | 1'b  | input  |              |
| clk          | 1'b  | input  |              |
| rx           | 1'b  | input  |              |
| po_data      | 8'b  | output | 获取的数据   |
| po_data_flag | 1'b  | output | 数据有效标志 |

#### 代码

```verilog
module uart_rx
#(
    parameter  UART_BPS = 14'd9600,
    parameter  CLK      = 27'd100_000_000
)(
    input wire clk,
    input wire rst,
    input wire rx,

    output reg [7:0] po_data,
    output reg       po_data_flag
    );
    localparam BAUD_CNT_MAX = CLK / UART_BPS;
    localparam CNT_BIT_MAX = 4'd9;

    reg rx_reg1;
    reg rx_reg2;
    reg rx_reg3;

    reg stat_work;
    reg work_en;

    reg [13:0]  cnt;
    reg [3:0]   cnt_bit;

    reg         bit_flag;
    reg [7:0]   rx_data;
    reg         rx_flag;
    //通过二级寄存器消除亚稳态
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            rx_reg1 <= 1'b1;
        else
            rx_reg1 <= rx;
    end

    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            rx_reg2 <= 1'b1;
        else
            rx_reg2 <= rx_reg1;
    end

    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            rx_reg3 <= 1'b1;
        else
            rx_reg3 <= rx_reg2;
    end

    //reg2 与  reg3  下降沿判断
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            stat_work <= 1'b0;
        else if(((~rx_reg2) && (rx_reg3)) == 1'b1)
            stat_work <= 1'b1;
        else 
            stat_work <= 1'b0;
    end

    //就收数据使能信号   work_en
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            work_en <= 1'b0;
        else if(stat_work == 1'b1) 
            work_en <= 1'b1;
        else if((bit_flag == 1'b1) && (cnt_bit == 4'd8))
            work_en <= 1'b0;
        else 
            work_en <= work_en;

    end

    //计数器 0~BAUD_CNT_MAX
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            cnt <= 1'b0;
        else if(cnt == BAUD_CNT_MAX)
            cnt <= 1'b0;
        else if(work_en == 1'b1)
            cnt <= cnt + 1'b1;
        else 
            cnt <= 1'b0;
    end
    //计数器比特数
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            cnt_bit <= 1'b0;
        else if((cnt_bit == 4'd8) && (bit_flag == 1'b1))
            cnt_bit <= 1'b0;
        else if(cnt == BAUD_CNT_MAX - 1'b1)
            cnt_bit <= cnt_bit + 1'b1;
        else 
            cnt_bit <= cnt_bit;
    end

    // 计数器中间时数据最稳定,标志信号 可对除法进行优化
    always @( negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            bit_flag <= 1'b0;
        else if(cnt == (BAUD_CNT_MAX / 2) - 1)
            bit_flag <= 1'b1;
        else 
            bit_flag <= 1'b0;
    end

    //拿取数据进行移位拼凑;
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            rx_data <= 8'b0;
        else if((bit_flag == 1'b1) && (cnt_bit >= 4'd1) && (cnt_bit <= 4'd8)) 
            rx_data <= {rx_reg3, rx_data[7:1]};
        else
            rx_data <= rx_data;
    end

    // 取到完整数据之后。生成标志信号
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            rx_flag <= 1'b0;
        else if((bit_flag == 1'b1) && (cnt_bit == 4'd8))
            rx_flag <= 1'b1;
        else 
            rx_flag <= 1'b0;
    end

    //输出数据与标志信号
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            po_data <= 8'd0;
        else if(rx_flag == 1'b1)
            po_data <= rx_data;
        else 
            po_data <= po_data;
    end
    always @(negedge clk or posedge rst) begin
        if(rst == 1'b1)
            po_data_flag <= 1'b0;
        else 
            po_data_flag <= rx_flag;
    end
endmodule

```



### uart_tx

#### 信号描述

| 信号         | 位宽 | 类型   | 功能     |
| ------------ | ---- | ------ | -------- |
| clk          | 1'b  | input  |          |
| rst          | 1'b  | input  |          |
| pi_data      | 8'b  | input  |          |
| pi_data_flag | 1'b  | input  |          |
| tx           | 1'b  | output | 输出信号 |

#### 代码

```verilog
module uart_tx
#(
    parameter  UART_BPS = 14'd9600,
    parameter  CLK      = 27'd100_000_000
)(
    input wire          clk,
    input wire          rst,
    input wire [7:0]    pi_data,
    input wire          pi_data_flag,

    output reg          tx
    );
    localparam  CNT_MAX = CLK / UART_BPS;

    reg [13:0]      cnt;
    reg [3:0]       bit_cnt;


    reg             work_en;

    //工作使能
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            work_en <= 1'b0;
        else if(pi_data_flag == 1'b1)
            work_en <= 1'b1;
        else if((bit_cnt == 4'd9) && (cnt == CNT_MAX - 2'd2))
            work_en <= 1'b0;
        else 
            work_en <= work_en;
    end

    //计数器
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            cnt <= 1'b0;
        else if(cnt == CNT_MAX - 1'b1)
            cnt <= 1'b0;
        else if(work_en == 1'b1)
            cnt <= cnt + 1'b1;
        else
            cnt <= 1'b0;
    end

    //bit_cnt 计数器
    always @(negedge clk or posedge rst ) begin
        if (rst == 1'b1)
            bit_cnt <= 1'b0;
        else if(cnt == CNT_MAX - 1'b1)
            bit_cnt = bit_cnt + 1'b1;
        else if(work_en == 1'b0)
            bit_cnt <= 1'b0;
    end

    always @(posedge rst or negedge clk) begin
        if(rst == 1'b1)
            tx <= 1'b1;
        else if(work_en == 1'b1)
            case (bit_cnt)
                0:tx <= 1'b0;
                1:tx <= pi_data[0] ;
                2:tx <= pi_data[1] ;
                3:tx <= pi_data[2] ;
                4:tx <= pi_data[3] ;
                5:tx <= pi_data[4] ;
                6:tx <= pi_data[5] ;
                7:tx <= pi_data[6] ;
                8:tx <= pi_data[7] ;
                9:tx <= 1'b1 ;
                default: tx <= 1'b1;
            endcase
        else 
            tx <= 1'b1;
    end
    
endmodule

```

## 总结

task       endtask     可以互相调用

for 在测试文件中很高效；

# 18、HDMI显示彩条 



## 理论学习

HDMI 是新一代的多媒体接口标准，英文全称是 High-Definition Multimedia Interface，即高清多媒体接 口。它能够同时传输视频和音频，简化了设备的接口和连线；同时提供了更高的数据传输带宽，可以传输无 压缩的数字音频及高分辨率视频信号。HDMI 1.0 版本于 2002 年发布，最高数据传输速度为 5Gbps；HDMI2.0 版本于 2013 年推出的，2.0 理论传输速度能达到 18Gbit/s，实际传输速度能达到 14.4Gbit/s；而 2017 年发布 的 HDMI 2.1 标准的理论带宽可达 48Gbps，实际速度也能达到 42.6Gbit/s。 在 HDMI 接口出现之前，被广泛应用的是 VGA 接口。VGA 的全称是 Video Graphics Array，即视频图 形阵列，是一个使用模拟信号进行视频传输的标准。VGA 接口采用 15 针插针式结构，里面传输模拟信号颜 色分量、同步等信号，是很多老显卡、笔记本和投影仪所使用的接口。由于 VGA 接口传输的是模拟信号， 其信号容易受到干扰，因此 VGA 在高分辨率下字体容易虚，信号线长的话，图像有拖尾现象。

VGA 接口除信号容易受到干扰外，其体积也较大，因此 VGA 接口已逐渐退出舞台，一些显示器也不 再带有 VGA 接口，在数字设备高度发展的今天，取而代之的是 HDMI 接口和 DP（Display Port）接口等。 HDMI 向下兼容 DVI，但是 DVI（数字视频接口）只能用来传输视频，而不能同时传输音频，这是两者 最主要的差别。此外，DVI 接口的尺寸明显大于 HDMI 接口。

DVI 和 HDMI 接口协议在物理层使用 TMDS 标准传输音视频数据。TMDS（Transition Minimized  Differential Signaling，最小化传输差分信号）是美国 Silicon Image 公司开发的一项高速数据传输技术，在 DVI 和 HDMI 视频接口中使用差分信号传输高速串行数据。TMDS 差分传输技术使用两个引脚（如图 30.1.3 中的“数据 2+”和“数据 2-”）来传输一路信号，利用这两个引脚间的电压差的正负极性和大小来决定传 输数据的数值（0 或 1）。 Xilinx 在 Spartan-3A 系列之后的器件中，加入了对 TMDS 接口标准的支持，用于在 FPGA 内部实现 DVI 和 HDMI 接口。

DVI 或 HDMI 视频传输所使用的 TMDS 连接通过 四个串行通道实现。对于 DVI 来说，其中三个通道分别用于传输视频中每个像素点的红、绿、蓝三个颜色 分量（RGB 4:4:4 格式）。HDMI 默认也是使用三个 RGB 通道，但是它同样可以选择传输像素点的亮度和 色度信息（YCrCb 4:4:4 或 YCrCb 4:2:2 格式）。第四个通道是时钟通道，用于传输像素时钟。独立的 TMDS 时钟通道为接收端提供接收的参考频率，保证数据在接收端能够正确恢复。

如果每个像素点的颜色深度为 24 位，即 RGB 每个颜色分量各占 8 位，那么每个通道上的颜色数据将 通过编码器来转换成一个 10 位的像素字符。然后这个 10 位的字符通过并串转换器转换成串行数据，最后 由 TMDS 数据通道发送出去。这个 10:1 的并转串过程所生成的串行数据速率是实际像素时钟速率的 10 倍。 在传输视频图像的过程中，数据通道上传输的是编码后的有效像素字符。而在每一帧图像的行与行之 间，以及视频中不同帧之间的时间间隔（消隐期）内，数据通道上传输的则是控制字符。每个通道上有两位 控制信号的输入接口，共对应四种不同的控制字符。这些控制字符提供了视频的行同步（HSYNC）以及帧 同步（VSYNC）信息，也可以用来指定所传输数据的边界（用于同步）。 对于 DVI 传输，整个视频的消隐期都用来传输控制字符。而 HDMI 传输的消隐期除了控制字符之外， 还可以用于传输音频或者其他附加数据，比如字幕信息等。这就是 DVI 和 HDMI 协议之间最主要的差别。 从图 30.1.4 中也可以看出这一差别，即“Auxiliary Data”接口标有“HDMI Only”，即它是 HDMI 所独有 的接口。 从前面的介绍中我们可以看出，TMDS 连接从逻辑功能上可以划分成两个阶段：编码和并串转换。在编 码阶段，编码器将视频源中的像素数据、HDMI 的音频/附加数据，以及行同步和场同步信号分别编码成 10 位的字符流。然后在并串转换阶段将上述的字符流转换成串行数据流，并将其从三个差分输出通道发送出 去。

DVI 编码器在视频有效数据段输出像素数据，在消隐期输出控制数据，

对于像素数据的 RGB 三个颜色通道，编码器的逻辑 是完全相同的。VDE 用于各个通道选择输出视频像素数据还是控制数据，HSYNC 和 VSYNC 信号在蓝色通 道进行编码得到 10 位字符，然后在视频消隐期传输。绿色和红色通道的控制信号 C0 和 C1 同样需要进行编 码，并在消隐期输出。但是 DVI 规范中这两个通道的控制信号是预留的（未用到），因此将其置为 2’b00。

每个通道输入的视频像素数据都要使用 DVI 规范中的 TMDS 编码算法进行编码。每个 8-bit 的数据都 将被转换成 460 个特定 10-bit 字符中的一个。这个编码机制大致上实现了传输过程中的直流平衡，即一段时 间内传输的高电平（数字“1”）的个数大致等于低电平（数字“0”）的个数。同时，每个编码后的 10-bit 字符中状态跳转（“由 1 到 0”或者“由 0 到 1”）的次数将被限制在五次以内。 除了视频数据之外，每个通道 2-bit 控制信号的状态也要进行编码，编码后分别对应四个不同的 10-bit 控制字符，分别是 10'b1101010100，10'b0010101011，10'b0101010100，和 10'b1010101011。可以看出，每个 控制字符都有七次以上的状态跳转。视频字符和控制字符状态跳转次数的不同将会被用于发送和接收设备 的同步。 HDMI 协议与 DVI 协议在很多方面都是相同的，包括物理连接（TMDS）、有效视频编码算法以及控制 字符的定义等。但是，相比于 DVI，HDMI 在视频的消隐期会传输更多的数据，包括音频数据和附加数据。 4-bit 音频和附加数据将通过 TERC4 编码机制转换成 10-bit TERC4 字符，然后在绿色和红色通道上传输。 HDMI 在输入附加数据的同时，还需要输入 ADE（Aux/Audio Data Enable）信号，其作用和 VDE 是类 似的：当 ADE 为高电平时，表明输入端的附加数据或者音频数据有效。

在编码之后 3 个通道的 10-bit 字符将进行并串转换，这一过程是使用 7 系列 FPGA 中专用的硬件资源 来实现的。ZYNQ PL 部分与 7 系列的 FPGA 是等价的，它提供了专用的并串转换器——OSERDESE2。单 一的 OSERDESE2 模块可以实现 8:1 的并串转换，通过位宽扩展可以实现 10:1 和 14:1 的转换率。

HDMI_HPD 指的是热拔插检测（Hot Plug Detect），当视频设备与接收设备通过 HDMI 连接时，接收设 备将 HPD 置为高电平，通知发送设备。当发送设备检测到 HPD 为低电平时，表明断开连接。

HDMI_SCL_LS 和 HDMI_SDA_LS 是 HDMI 接口的显示数据通道（DDC，Display Data  Channel），用于 HDMI 发送端和接收端之间交换一些配置信息，通过 I2C 协议通信。发送端通过 DDC 通 道，读取接收端保存在 HDMI 显示器 EEPROM 中的 EDID 数据，获取接收端的信息，确认接收端终端显示 的设置和功能，决定跟接收端之间以什么格式传输音/视频数据。需要说明的是，HDMI 的 IIC 引脚是 5V 电 平的，需要将其转换为 ZYNQ PL 端所需的 3.3V 电压。 其中，IIC2_SCL 和 IIC2_SDA 连接到 ZYNQ PL 侧的 IO 口上，HDMI_SCL_LS 和 HDMI_SDA_LS 连接 到 HDMI 插座上。当总线空闲即 IIC2_SCL 和 IIC2_SDA 都被 ZYNQ 驱动为高电平时，MOS 管截止， HDMI_SCL_LSHDMI_SDA_LS 也被上拉电阻 R55 和 R61 上拉到+5V 的高电平。当 IIC2_SCL 或 IIC2_SDA 被 ZYNQ 驱动为低电平时，MOS 管导通，此时 HDMI_SCL_LS 或 HDMI_SDA_LS 也被下拉到了 GND。若 HDMI_SDA_LS 需要向 ZYNQ 发送低电平时，HDMI_SDA_LS 为低，MOS 管内部二极管导通 IIC2_SDA 被 下拉到了低电平。以此实现了双向电平转换的功能。

### TMDS编码算法

![TMDS编码算法](HDMI/doc/TMDS编码.png)

## 实验内容

在显示器上显示 720p 彩条图案（720p 分辨率 为 1280*800，像素时钟大约为 75MHz）

## 实验模块

### vga_hdmi

```verilog
// DVI发送端顶层模块


module vga_hdmi(
    input        pclk,           // pixel clock
    input        pclk_x5,        // pixel clock x5
    input        reset_n,        // reset
    
    input [23:0] video_din,      // RGB888 video in
    input        video_hsync,    // hsync data
    input        video_vsync,    // vsync data
    input        video_de,       // data enable
    
    output       tmds_clk_p,    // TMDS 时钟通道
    output       tmds_clk_n,
    output [2:0] tmds_data_p,   // TMDS 数据通道
    output [2:0] tmds_data_n,
    output       tmds_oen       // TMDS 输出使能
    );
    
//wire define    
wire        reset;
    
//并行数据
wire [9:0]  red_10bit;
wire [9:0]  green_10bit;
wire [9:0]  blue_10bit;
wire [9:0]  clk_10bit;  
  
//串行数据
wire [2:0]  tmds_data_serial;
wire        tmds_clk_serial;

//*****************************************************
//**                    main code
//***************************************************** 
assign tmds_oen = 1'b1;  
assign clk_10bit = 10'b1111100000;

//异步复位，同步释放
chose_rst reset_syn(
    .reset_n    (reset_n),
    .clk        (pclk),
    
    .syn_reset  (reset)    //高有效
    );
  
//对三个颜色通道进行编码
dvi_encoder encoder_b (
    .clkin      (pclk),
    .rstin	    (reset),
    
    .din        (video_din[7:0]),
    .c0			(video_hsync),
    .c1			(video_vsync),
    .de			(video_de),
    .dout		(blue_10bit)
    ) ;

dvi_encoder encoder_g (
    .clkin      (pclk),
    .rstin	    (reset),
    
    .din		(video_din[15:8]),
    .c0			(1'b0),
    .c1			(1'b0),
    .de			(video_de),
    .dout		(green_10bit)
    ) ;
    
dvi_encoder encoder_r (
    .clkin      (pclk),
    .rstin	    (reset),
    
    .din		(video_din[23:16]),
    .c0			(1'b0),
    .c1			(1'b0),
    .de			(video_de),
    .dout		(red_10bit)
    ) ;
    
//对编码后的数据进行并串转换
serializer_10_to_1 serializer_b(
    .reset              (reset),                // 复位,高有效
    .paralell_clk       (pclk),                 // 输入并行数据时钟
    .serial_clk_5x      (pclk_x5),              // 输入串行数据时钟
    .paralell_data      (blue_10bit),           // 输入并行数据

    .serial_data_out    (tmds_data_serial[0])   // 输出串行数据
    );    
    
serializer_10_to_1 serializer_g(
    .reset              (reset),
    .paralell_clk       (pclk),
    .serial_clk_5x      (pclk_x5),
    .paralell_data      (green_10bit),

    .serial_data_out    (tmds_data_serial[1])
    );
    
serializer_10_to_1 serializer_r(
    .reset              (reset),
    .paralell_clk       (pclk),
    .serial_clk_5x      (pclk_x5),
    .paralell_data      (red_10bit),

    .serial_data_out    (tmds_data_serial[2])
    );
            
serializer_10_to_1 serializer_clk(
    .reset              (reset),
    .paralell_clk       (pclk),
    .serial_clk_5x      (pclk_x5),
    .paralell_data      (clk_10bit),

    .serial_data_out    (tmds_clk_serial)
    );
    
//转换差分信号  
OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    // I/O电平标准为TMDS
) TMDS0 (
    .I                  (tmds_data_serial[0]),
    .O                  (tmds_data_p[0]),
    .OB                 (tmds_data_n[0]) 
);

OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    // I/O电平标准为TMDS
) TMDS1 (
    .I                  (tmds_data_serial[1]),
    .O                  (tmds_data_p[1]),
    .OB                 (tmds_data_n[1]) 
);

OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    // I/O电平标准为TMDS
) TMDS2 (
    .I                  (tmds_data_serial[2]), 
    .O                  (tmds_data_p[2]), 
    .OB                 (tmds_data_n[2])  
);

OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    // I/O电平标准为TMDS
) TMDS3 (
    .I                  (tmds_clk_serial), 
    .O                  (tmds_clk_p),
    .OB                 (tmds_clk_n) 
);
  
endmodule
```

### chose_rst

```verilog
// 异步复位，同步释放，并转换成高电平有效


module chose_rst(
    input clk,          //目的时钟域
    input reset_n,      //异步复位，低有效
    
    output syn_reset    //高有效
    );
    
//reg define
reg reset_1;
reg reset_2;
    
//*****************************************************
//**                    main code
//***************************************************** 
assign syn_reset  = reset_2;
    
//对异步复位信号进行同步释放，并转换成高有效
always @ (posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        reset_1 <= 1'b1;
        reset_2 <= 1'b1;
    end
    else begin
        reset_1 <= 1'b0;
        reset_2 <= reset_1;
    end
end
    
endmodule
```

### encoder

```verilog
//为了完成 RGB 图像数据 8b 转 10b 的编码
//此为xilinx 官方提供的编码模块代码
`timescale 1 ps / 1ps

module dvi_encoder (
  input            clkin,    // 
  input            rstin,    // 
  input      [7:0] din,      // 
  input            c0,       // 
  input            c1,       // 
  input            de,       // 
  output reg [9:0] dout      // 
);


reg [3:0] n1d; //number of 1s in din
reg [7:0] din_q;

//计算像素数据中“1”的个数
always @ (posedge clkin) begin
  n1d <=#1 din[0] + din[1] + din[2] + din[3] + din[4] + din[5] + din[6] + din[7];

  din_q <=#1 din;
end

wire decision1;

assign decision1 = (n1d > 4'h4) | ((n1d == 4'h4) & (din_q[0] == 1'b0));

wire [8:0] q_m;
assign q_m[0] = din_q[0];
assign q_m[1] = (decision1) ? (q_m[0] ^~ din_q[1]) : (q_m[0] ^ din_q[1]);
assign q_m[2] = (decision1) ? (q_m[1] ^~ din_q[2]) : (q_m[1] ^ din_q[2]);
assign q_m[3] = (decision1) ? (q_m[2] ^~ din_q[3]) : (q_m[2] ^ din_q[3]);
assign q_m[4] = (decision1) ? (q_m[3] ^~ din_q[4]) : (q_m[3] ^ din_q[4]);
assign q_m[5] = (decision1) ? (q_m[4] ^~ din_q[5]) : (q_m[4] ^ din_q[5]);
assign q_m[6] = (decision1) ? (q_m[5] ^~ din_q[6]) : (q_m[5] ^ din_q[6]);
assign q_m[7] = (decision1) ? (q_m[6] ^~ din_q[7]) : (q_m[6] ^ din_q[7]);
assign q_m[8] = (decision1) ? 1'b0 : 1'b1;


reg [3:0] n1q_m, n0q_m; 
always @ (posedge clkin) begin
  n1q_m  <=#1 q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7];
  n0q_m  <=#1 4'h8 - (q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7]);
end

parameter CTRLTOKEN0 = 10'b1101010100;
parameter CTRLTOKEN1 = 10'b0010101011;
parameter CTRLTOKEN2 = 10'b0101010100;
parameter CTRLTOKEN3 = 10'b1010101011;

reg [4:0] cnt; 
wire decision2, decision3;

assign decision2 = (cnt == 5'h0) | (n1q_m == n0q_m);
assign decision3 = (~cnt[4] & (n1q_m > n0q_m)) | (cnt[4] & (n0q_m > n1q_m));

reg       de_q, de_reg;
reg       c0_q, c1_q;
reg       c0_reg, c1_reg;
reg [8:0] q_m_reg;

always @ (posedge clkin) begin
  de_q    <=#1 de;
  de_reg  <=#1 de_q;
  
  c0_q    <=#1 c0;
  c0_reg  <=#1 c0_q;
  c1_q    <=#1 c1;
  c1_reg  <=#1 c1_q;

  q_m_reg <=#1 q_m;
end


always @ (posedge clkin or posedge rstin) begin
  if(rstin) begin
    dout <= 10'h0;
    cnt <= 5'h0;
  end else begin
    if (de_reg) begin
      if(decision2) begin
        dout[9]   <=#1 ~q_m_reg[8]; 
        dout[8]   <=#1 q_m_reg[8]; 
        dout[7:0] <=#1 (q_m_reg[8]) ? q_m_reg[7:0] : ~q_m_reg[7:0];

        cnt <=#1 (~q_m_reg[8]) ? (cnt + n0q_m - n1q_m) : (cnt + n1q_m - n0q_m);
      end else begin
        if(decision3) begin
          dout[9]   <=#1 1'b1;
          dout[8]   <=#1 q_m_reg[8];
          dout[7:0] <=#1 ~q_m_reg[7:0];

          cnt <=#1 cnt + {q_m_reg[8], 1'b0} + (n0q_m - n1q_m);
        end else begin
          dout[9]   <=#1 1'b0;
          dout[8]   <=#1 q_m_reg[8];
          dout[7:0] <=#1 q_m_reg[7:0];

          cnt <=#1 cnt - {~q_m_reg[8], 1'b0} + (n1q_m - n0q_m);
        end
      end
    end else begin
      case ({c1_reg, c0_reg})
        2'b00:   dout <=#1 CTRLTOKEN0;
        2'b01:   dout <=#1 CTRLTOKEN1;
        2'b10:   dout <=#1 CTRLTOKEN2;
        default: dout <=#1 CTRLTOKEN3;
      endcase

      cnt <=#1 5'h0;
    end
  end
end
  
endmodule 
```



### vga_ctrl

```verilog
//视频显示模块，显示彩条
module vga_ctrl(
    input           	pixel_clk	,
    input           	sys_rst_n	,
		
    //RGB接口	
    output          	video_hs	,     //行同步信号
    output          	video_vs	,     //场同步信号
    output          	video_de	,     //数据使能
    output  	[23:0]  video_rgb	,    //RGB888颜色数据
    output	reg			data_req 	,
	
    input   	[23:0]  pixel_data	,   //像素点数据
    output  reg	[10:0]  pixel_xpos	,   //像素点横坐标
    output  reg	[10:0]  pixel_ypos    //像素点纵坐标
);

//parameter define

//1280*720 分辨率时序参数
parameter  H_SYNC   =  11'd40;   //行同步
parameter  H_BACK   =  11'd220;  //行显示后沿
parameter  H_DISP   =  11'd1280; //行有效数据
parameter  H_FRONT  =  11'd110;  //行显示前沿
parameter  H_TOTAL  =  11'd1650; //行扫描周期

parameter  V_SYNC   =  11'd5;    //场同步
parameter  V_BACK   =  11'd20;   //场显示后沿
parameter  V_DISP   =  11'd720;  //场有效数据
parameter  V_FRONT  =  11'd5;    //场显示前沿
parameter  V_TOTAL  =  11'd750;  //场扫描周期

//1920*1080分辨率时序参数
//parameter  H_SYNC   =  12'd44;   //行同步
//parameter  H_BACK   =  12'd148;  //行显示后沿
//parameter  H_DISP   =  12'd1920; //行有效数据
//parameter  H_FRONT  =  12'd88;  //行显示前沿
//parameter  H_TOTAL  =  12'd2200; //行扫描周期
//
//parameter  V_SYNC   =  12'd5;    //场同步
//parameter  V_BACK   =  12'd36;   //场显示后沿
//parameter  V_DISP   =  12'd1080;  //场有效数据
//parameter  V_FRONT  =  12'd4;    //场显示前沿
//parameter  V_TOTAL  =  12'd1125;  //场扫描周期

//reg define
reg  [11:0] cnt_h;
reg  [11:0] cnt_v;
reg       	video_en;

//*****************************************************
//**                    main code
//*****************************************************

assign video_de  = video_en;
assign video_hs  = ( cnt_h < H_SYNC ) ? 1'b0 : 1'b1;  //行同步信号赋值
assign video_vs  = ( cnt_v < V_SYNC ) ? 1'b0 : 1'b1;  //场同步信号赋值

//使能RGB数据输出
always @(posedge pixel_clk or negedge sys_rst_n) begin
	if(!sys_rst_n)
		video_en <= 1'b0;
	else
		video_en <= data_req;
end

//RGB888数据输出
assign video_rgb = video_de ? pixel_data : 24'd0;

//请求像素点颜色数据输入
always @(posedge pixel_clk or negedge sys_rst_n) begin
	if(!sys_rst_n)
		data_req <= 1'b0;
	else if(((cnt_h >= H_SYNC + H_BACK - 2'd2) && (cnt_h < H_SYNC + H_BACK + H_DISP - 2'd2))
                  && ((cnt_v >= V_SYNC + V_BACK) && (cnt_v < V_SYNC + V_BACK+V_DISP)))
		data_req <= 1'b1;
	else
		data_req <= 1'b0;
end

//像素点x坐标
always@ (posedge pixel_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        pixel_xpos <= 11'd0;
    else if(data_req)
        pixel_xpos <= cnt_h + 2'd2 - H_SYNC - H_BACK ;
    else 
        pixel_xpos <= 11'd0;
end
    
//像素点y坐标	
always@ (posedge pixel_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        pixel_ypos <= 11'd0;
    else if((cnt_v >= (V_SYNC + V_BACK)) && (cnt_v < (V_SYNC + V_BACK + V_DISP)))
        pixel_ypos <= cnt_v + 1'b1 - (V_SYNC + V_BACK) ;
    else 
        pixel_ypos <= 11'd0;
end

//行计数器对像素时钟计数
always @(posedge pixel_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        cnt_h <= 11'd0;
    else begin
        if(cnt_h < H_TOTAL - 1'b1)
            cnt_h <= cnt_h + 1'b1;
        else 
            cnt_h <= 11'd0;
    end
end

//场计数器对行计数
always @(posedge pixel_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        cnt_v <= 11'd0;
    else if(cnt_h == H_TOTAL - 1'b1) begin
        if(cnt_v < V_TOTAL - 1'b1)
            cnt_v <= cnt_v + 1'b1;
        else 
            cnt_v <= 11'd0;
    end
end

endmodule
```

### vga_pic

```verilog
//视频显示模块，显示彩条

module  vga_pic(
    input                pixel_clk,
    input                sys_rst_n,
    
    input        [10:0]  pixel_xpos,  //像素点横坐标
    input        [10:0]  pixel_ypos,  //像素点纵坐标
    output  reg  [23:0]  pixel_data   //像素点数据
);

//parameter define
parameter  H_DISP = 11'd1280;                       //分辨率——行
parameter  V_DISP = 11'd720;                        //分辨率——列

localparam WHITE  = 24'b11111111_11111111_11111111;  //RGB888 白色
localparam BLACK  = 24'b00000000_00000000_00000000;  //RGB888 黑色
localparam RED    = 24'b11111111_00001100_00000000;  //RGB888 红色
localparam GREEN  = 24'b00000000_11111111_00000000;  //RGB888 绿色
localparam BLUE   = 24'b00000000_00000000_11111111;  //RGB888 蓝色
    
//*****************************************************
//**                    main code
//*****************************************************

//根据当前像素点坐标指定当前像素点颜色数据，在屏幕上显示彩条
always @(posedge pixel_clk ) begin
    if (!sys_rst_n)
        pixel_data <= 16'd0;
    else begin
        if((pixel_xpos >= 0) && (pixel_xpos < (H_DISP/5)*1))
            pixel_data <= WHITE;
        else if((pixel_xpos >= (H_DISP/5)*1) && (pixel_xpos < (H_DISP/5)*2))
            pixel_data <= BLACK;  
        else if((pixel_xpos >= (H_DISP/5)*2) && (pixel_xpos < (H_DISP/5)*3))
            pixel_data <= RED;  
        else if((pixel_xpos >= (H_DISP/5)*3) && (pixel_xpos < (H_DISP/5)*4))
            pixel_data <= GREEN;
        else 
            pixel_data <= BLUE;
    end
end

endmodule

```

### hdmi_top

```verilog
// Descriptions:        HDMI彩条显示实验顶层模块

module  hdmi_top(
    input        sys_clk,
    input        sys_rst_n,
    
    output       tmds_clk_p,    // TMDS 时钟通道
    output       tmds_clk_n,
    output [2:0] tmds_data_p,   // TMDS 数据通道
    output [2:0] tmds_data_n
);

//wire define
wire          pixel_clk;
wire          pixel_clk_5x;
wire          clk_locked;

wire  [10:0]  pixel_xpos_w;
wire  [10:0]  pixel_ypos_w;
wire  [23:0]  pixel_data_w;

wire          video_hs;
wire          video_vs;
wire          video_de;
wire  [23:0]  video_rgb;

//*****************************************************
//**                    main code
//*****************************************************

//例化MMCM/PLL IP核
clk_wiz_0  clk_wiz_0(
    .clk_in1        (sys_clk),
    .clk_out1       (pixel_clk),        //像素时钟  75MHZ
    .clk_out2       (pixel_clk_5x),     //5倍像素时钟   375MHZ
    
    .reset          (~sys_rst_n), 
    .locked         (clk_locked)
);

//例化视频显示驱动模块
vga_ctrl  vga_ctrl_inst(
    .pixel_clk      ( pixel_clk ),
    .sys_rst_n      ( sys_rst_n ),

    .video_hs       ( video_hs ),
    .video_vs       ( video_vs ),
    .video_de       ( video_de ),
    .video_rgb      ( video_rgb ),
	.data_req		(),

    .pixel_xpos     ( pixel_xpos_w ),
    .pixel_ypos     ( pixel_ypos_w ),
	.pixel_data     ( pixel_data_w )
);

//例化视频显示模块
vga_pic  vga_pic_inst(
    .pixel_clk      (pixel_clk),
    .sys_rst_n      (sys_rst_n),

    .pixel_xpos     (pixel_xpos_w),
    .pixel_ypos     (pixel_ypos_w),
    .pixel_data     (pixel_data_w)
    );

//例化HDMI驱动模块
vga_hdmi vga_hdmi_inst(
    .pclk           (pixel_clk),
    .pclk_x5        (pixel_clk_5x),
    .reset_n        (sys_rst_n & clk_locked),
                
    .video_din      (video_rgb),
    .video_hsync    (video_hs), 
    .video_vsync    (video_vs),
    .video_de       (video_de),
                
    .tmds_clk_p     (tmds_clk_p),
    .tmds_clk_n     (tmds_clk_n),
    .tmds_data_p    (tmds_data_p),
    .tmds_data_n    (tmds_data_n), 
    .tmds_oen       ()                        //预留的端口，本次实验未用到
    );

endmodule 
```

### serializer_10_to_1

```verilog
//并串转换模块是通过 xilinx 官方
//提供的 OSERDESE2 原语，对编码模块输出的 10bit 数据进行并串转换然后输出
//用于实现10:1并串转换


`timescale 1ns / 1ps

module serializer_10_to_1(
    input           reset,              // 复位,高有效
    input           paralell_clk,       // 输入并行数据时钟
    input           serial_clk_5x,      // 输入串行数据时钟
    input   [9:0]   paralell_data,      // 输入并行数据

    output 			serial_data_out     // 输出串行数据
    );
    
//wire define
wire		cascade1;     //用于两个OSERDESE2级联的信号
wire		cascade2;
  
//*****************************************************
//**                    main code
//***************************************************** 
    
//例化OSERDESE2原语，实现并串转换,Master模式
OSERDESE2 #(
    .DATA_RATE_OQ   ("DDR"),       // 设置双倍数据速率
    .DATA_RATE_TQ   ("SDR"),       // DDR, BUF, SDR
    .DATA_WIDTH     (10),           // 输入的并行数据宽度为10bit
    .SERDES_MODE    ("MASTER"),    // 设置为Master，用于10bit宽度扩展
    .TBYTE_CTL      ("FALSE"),     // Enable tristate byte operation (FALSE, TRUE)
    .TBYTE_SRC      ("FALSE"),     // Tristate byte source (FALSE, TRUE)
    .TRISTATE_WIDTH (1)             // 3-state converter width (1,4)
)
OSERDESE2_Master (
    .CLK        (serial_clk_5x),    // 串行数据时钟,5倍时钟频率
    .CLKDIV     (paralell_clk),     // 并行数据时钟
    .RST        (reset),            // 1-bit input: Reset
    .OCE        (1'b1),             // 1-bit input: Output data clock enable
    
    .OQ         (serial_data_out),  // 串行输出数据
    
    .D1         (paralell_data[0]), // D1 - D8: 并行数据输入
    .D2         (paralell_data[1]),
    .D3         (paralell_data[2]),
    .D4         (paralell_data[3]),
    .D5         (paralell_data[4]),
    .D6         (paralell_data[5]),
    .D7         (paralell_data[6]),
    .D8         (paralell_data[7]),
   
    .SHIFTIN1   (cascade1),         // SHIFTIN1 用于位宽扩展
    .SHIFTIN2   (cascade2),         // SHIFTIN2
    .SHIFTOUT1  (),                 // SHIFTOUT1: 用于位宽扩展
    .SHIFTOUT2  (),                 // SHIFTOUT2
        
    .OFB        (),                 // 以下是未使用信号
    .T1         (1'b0),             
    .T2         (1'b0),
    .T3         (1'b0),
    .T4         (1'b0),
    .TBYTEIN    (1'b0),             
    .TCE        (1'b0),             
    .TBYTEOUT   (),                 
    .TFB        (),                 
    .TQ         ()                  
);
   
//例化OSERDESE2原语，实现并串转换,Slave模式
OSERDESE2 #(
    .DATA_RATE_OQ   ("DDR"),       // 设置双倍数据速率
    .DATA_RATE_TQ   ("SDR"),       // DDR, BUF, SDR
    .DATA_WIDTH     (10),           // 输入的并行数据宽度为10bit
    .SERDES_MODE    ("SLAVE"),     // 设置为Slave，用于10bit宽度扩展
    .TBYTE_CTL      ("FALSE"),     // Enable tristate byte operation (FALSE, TRUE)
    .TBYTE_SRC      ("FALSE"),     // Tristate byte source (FALSE, TRUE)
    .TRISTATE_WIDTH (1)             // 3-state converter width (1,4)
)
OSERDESE2_Slave (
    .CLK        (serial_clk_5x),    // 串行数据时钟,5倍时钟频率
    .CLKDIV     (paralell_clk),     // 并行数据时钟
    .RST        (reset),            // 1-bit input: Reset
    .OCE        (1'b1),             // 1-bit input: Output data clock enable
    
    .OQ         (),                 // 串行输出数据
    
    .D1         (1'b0),             // D1 - D8: 并行数据输入
    .D2         (1'b0),
    .D3         (paralell_data[8]),
    .D4         (paralell_data[9]),
    .D5         (1'b0),
    .D6         (1'b0),
    .D7         (1'b0),
    .D8         (1'b0),
   
    .SHIFTIN1   (),                 // SHIFTIN1 用于位宽扩展
    .SHIFTIN2   (),                 // SHIFTIN2
    .SHIFTOUT1  (cascade1),         // SHIFTOUT1: 用于位宽扩展
    .SHIFTOUT2  (cascade2),         // SHIFTOUT2
        
    .OFB        (),                 // 以下是未使用信号
    .T1         (1'b0),             
    .T2         (1'b0),
    .T3         (1'b0),
    .T4         (1'b0),
    .TBYTEIN    (1'b0),             
    .TCE        (1'b0),             
    .TBYTEOUT   (),                 
    .TFB        (),                 
    .TQ         ()                  
);  
        
endmodule
```

# 19、iic

## 理论学习

**IIC**（Inter-Integrated Circuit）是 IIC Bus 简称，中文叫集成电路总线。它是一种[串行通信](https://so.csdn.net/so/search?q=串行通信&spm=1001.2101.3001.7020)总线，使用多主从架构。

IIC使用两根信号线进行通信：一根时钟线SCL，一根数据线SDA。IIC将SCL处于高时SDA拉低的动作作为开始信号，SCL处于高时SDA拉高的动作作为结束信号；传输数据时，SDA在SCL低电平时改变数据，在SCL高电平时保持数据，每个SCL脉冲的高电平传递1位数据。

### 特征：

- IIC用2根信号线通信：串行数据线 SDA、串行时钟线 SCL；

- IIC总线上所有器件的SDA、SCL引脚输出驱动都为 开漏(OD) 结构，通过外接上拉电阻实现总线上所有节点SDA、SCL信号的线与逻辑关系；
- 总线上的所有设备通过软件寻址且具有唯一的地址（7位或10位）。7位“从机专用地址码”，其高4位为由生产厂家制定的设备类型地址，低3位为器件引脚定义地址（由使用者定义）；10位地址不常见；
- 任何时刻都只存在简单的主从关系，按数据传输的方向，主机可以是主发送器或主接收器；
- 支持多主机。在总线上存在多个主机时，通过冲突检测和仲裁机制防止多个主机同时发起数据传输时存在的冲突；
- IIC总线上所有器件都具有“自动应答”功能，保证数据传输的正确性； 主机和从机的区别在于对SCL的发送权，只有主机才能发送SCL；
- IIC总线允许挂载最多的设备数量取决于总线上最大电容值，一般为400pf（Hs模式100pf）
- IIC总线不仅广泛应用于电路板级的内部通信，还可以通过I2C总线驱动器进行不同系统间的通信；

| 模式                           | 速度    |
| ------------------------------ | ------- |
| 标准模式（Standard Mode）      | 100kb/s |
| 快速模式（Fast Mode）          | 400kb/s |
| 增强快速模式（Fast Mode Plus） | 1Mb/s   |
| 高速模式（High Speed Mode）    | 3.4Mb/s |
| 极速模式（Ultra-FastMode）     | 5Mb/s   |

### 时序：

1. 数据有效性
   IIC 的数据读取动作都在 SCL为高 时产生，SCL为低时是数据改变的时期，无论SDA如何变化都不影响读取。所以，传输数据的过程中，当SCL为高时，数据应当保持稳定，避免数据的采集出错。

![](E:\vivado_p\project\iic\img\1.png)


    2. 开始和结束信号
       开始信号（START/S）： SCL为高时，SDA从高到低的跳变产生开始信号
              结束信号（STOP/P）  ： SCL为高时，SDA从低到高的跳变产生结束信号

![](E:\vivado_p\project\iic\img\2.png)

    3. 重复开始信号
       重复开始信号（ReSTART/Sr）： 在结束时不给出STOP信号，而以一个时钟周期内再次给出开始信号作为替代


    4. 字节格式
       SDA数据线上的每个字节必须是8位，对于每次传输的字节数没有限制。每个字节（8位）数据传送完后紧跟着应答信号（ACK，第9位）。数据的先后顺序为：高位在前 。

![](E:\vivado_p\project\iic\img\3.png)


    5. 应答信号
       协议规定数据传输过程必须包含应答（ACK）。接收器通过应答告知发送的字节已被成功接收，之后发送器可以进行下一个字节的传输。主机产生数据传输过程中的所有时钟，包括用于应答的第9个时钟。发送器在应答时钟周期内释放对SDA总线的控制，这样接收器可以通过将SDA线拉低告知发送器：数据已被成功接收。
           应答信号分为两种：
             1）当第9位(应答位)为 低电平 时，为 ACK  （Acknowledge）   信号
             2）当第9位(应答位)为 高电平 时，为 NACK（Not Acknowledge）信号
           主机发送数据，从机接收时，ACK信号由从机发出。当在SCL第9位时钟高电平信号期间，如果SDA仍然保持高电平，则主机可以直接产生STOP条件终止以后的传输或者继续ReSTART开始一个新的传输
           从机发送数据，主机读取数据时，ACK信号由主机给出。主机响应ACK表示还需要再接收数据，而当主机接收完想要的数据后，通过发送NACK告诉从机读取数据结束、释放总线。随后主机发送STOP命令，将总线释放，结束读操作。

![](E:\vivado_p\project\iic\img\4.png)

#### 7-bit 设备的数据传输

  一个完整的7-bit通信过程如图所示：

![](E:\vivado_p\project\iic\img\5.png)

  在START信号后的首字节由7位从机地址和1位读写位组成，结构如下图：

![](E:\vivado_p\project\iic\img\6.png)


  发送完这个字节之后，主机释放SDA总线等待从机给出ACK应答。如果从机给出了ACK应答，表示从机地址正确（有从机响应）并且已知晓是读还是写，便可以开始读写数据。如果从机没有给出ACK应答，则说明接收设备可能没有收到数据（如寻址的设备不存在或是设备正在忙碌）或无法解析收到的数据，如果是这样，则由master来决定如何处理（STOP或ReSTART）。


    1. 主机写-从机收，传输方向不变
       主机对从机发送数据时，主机对从机发送一个开始字节，然后即可一直发送数据。以示例来讲解，其第一帧数据为要操作的寄存器地址，所以为：“[1-Byte]开始字节(写) + [1-Byte]寄存器地址 + [1-Byte]寄存器数据”。

![](E:\vivado_p\project\iic\img\7.png)


    2. 主机读-从机发，传输方向改变
       主机对向从机读取数据时，方式同发送数据有所不同，要多一次通信过程。
           主机需要先向从机发送一次信号，告诉从机”我要读取数据“，然后重开一次通信，等待从机主动返回数据。以示例来讲解，发送 “[1-Byte]开始字节(写) + [1-Byte]要读取的寄存器的地址”，之后结束通信，或者重开始，来进入到第二次通信中，先发送 [1-Byte]开始字节(读)，然后等待读取从机发送过来的 [1-Byte]数据 即可。

![](E:\vivado_p\project\iic\img\8.png)

#### 10-bit 设备的数据传输

  随着IIC设备日益增多，7位的从机地址逐渐不能满足使用，于是从机地址从7位扩充到了10位。7位和10位地址的设备可以共存于同一个I2C总线系统互不冲突，展现了良好的兼容性。
  10-bit 地址的IIC设备需要 2-Byte 来传输从设备地址信息，所以采用了这样的设计：第一个字节为 1111 0 + 地址高两位(第10、9bit) + 读写控制位，第二个字节为从设备地址低8位，除此之外与7-bit设备相同。因为 “1111 0xx” 为 IIC 中特地保留的16个特殊指令地址中的一个，所以7-bit设备不会响应该首字节的呼叫，只有10-bit设备会响应，从而实现良好兼容。


    1. 10-bit 设备的写
       10-bit设备的写过程如下图示例，除地址部分外与7-bit相同。

![](E:\vivado_p\project\iic\img\9.png)


    2. 10-bit 设备的读
       10-bit设备的读过程如下图示例，需注意的是，第二次通信过程无需再次发送第2Byte地址。

![](E:\vivado_p\project\iic\img\10.png)

IIC的写过程（如图）：

![](E:\vivado_p\project\iic\img\11.png)

- Master发起START

- Master发送I2C 控制字（7bit）和W(写)操作0（1bit），等待ACK
- Slave发送ACK
- Master发送存储单元 addr（8bit），等待ACK
- Slave发送ACK
- Master发送data（8bit），即要写入寄存器中的数据，等待ACK
- Slave发送ACK
- 第6步和第7步可以重复多次，即顺序写多个寄存器
- Master发起STOP结束传输

IIC的读过程（如图）：

![](E:\vivado_p\project\iic\img\12.png)

- Master执行写过程的1-5步骤

- Master发起START
- Master发送I2C addr（7bit）和r（读）操作1（1bit），等待ACK
- Slave发送ACK
- Slave发送data（8bit），即寄存器里的值
- Master发送ACK
- 第7步和第8步可以重复多次，即顺序读多个寄存器
- 当master接收完想要的数据后，由Master发送NACK，告知slave停止发送数据
- Master发送STOP结束传输

## 实验

### 代码实现

```verilog
`timescale 1ns / 1ps
module IIC_control #(
	parameter	 DIV_CLK = 'd500,	//系统时钟分频系数
	parameter   WMEN_LEN = 8'd0, 	//写数据帧数
	parameter   RMEN_LEN = 8'd0		//读数据帧数
	)
	(
	input 							sys_clk,	//系统时钟
	input 							sys_rst_n,	//系统复位
	input		 					iic_en,		//iic使能信号
     input		[WMEN_LEN*8-1'b1:0]  w_data,		//iic设备的写入数据，其中w_data[7:0]应该是地址帧
	input		[7:0]				wd_cnt,		//iic写入数据的帧数
	output	reg [RMEN_LEN*8-1'b1:0]	r_data,		//iic读取数据存储
	input		[7:0]				rd_cnt,		//iic读取数据的帧数
	output 		reg					iic_busy,	//iic工作标识，1为忙，2为空闲
	//标准的iic设备总线
	inout							iic_sda,   	//iic总线的双向数据线
	output		reg					iic_scl		//iic总线的时钟线
    );

    parameter	IDLE 		= 4'd0,				//空闲状态
    			START 		= 4'd1,				//开始
				W_WAIT 		= 4'd2,				//写状态
    			W_ACK 		= 4'd3,				//写响应
    			R_WAIT 		= 4'd4,				//读状态
    			R_ACK 		= 4'd5,				//读响应
    			STOP1 		= 4'd6,				//结束1
    			STOP2 		= 4'd7;				//结束2
    reg  [3:0]	iic_s;			//	状态机状态
    reg 		scl_clk;		//分频时钟，通过对其移位获得iic串行时钟信号
    reg 		iic_mode;		// 设置iic数据线状态，1为输出（写），0为输入（读）
    reg [2:0] 	bcnt;			//比特计数
    reg [7:0] 	wcnt;			//写字节计数
    reg [7:0] 	rcnt;			//读字节计数
    reg 		scl_r;			//iic时钟信号寄存，时钟信号的来源包括两部分，一是iic空闲时主动拉高，二是每比特数据传输时拉高
    reg 		sda_r;			//iic数据线寄存，W_ACK时进行响应判断
    reg 		sda_o = 0;		//iic数据线，写数据
    reg [7:0] 	sda_o_r;		//iic数据线，写数据寄存器
    reg [7:0] 	sda_i_r;		//iic数据线，读数据寄存
	reg [$clog2(DIV_CLK):0] clk_cnt;	//分频时钟计数
//	reg					iic_busy;                      
	reg 				rd_en;		//读数据使能信号
    //分频器对系统时钟进行分频处理，产生串行时钟信号
    always @(posedge sys_clk or negedge sys_rst_n)
    begin
    	if(!sys_rst_n)	begin
    		clk_cnt <= 0	;
    		scl_clk <= 0;
		end
    	else if(clk_cnt == (DIV_CLK>>1) -1'b1)begin//保持50%占空比
    		clk_cnt <= 0;
    		scl_clk <= ~scl_clk;
    	end
    	else clk_cnt <= clk_cnt +'b1;
    end
    //
    always @(*)
    begin
    	if(iic_s == IDLE || iic_s == STOP1 || iic_s == STOP2) //主动拉升iic时钟线
    		scl_r <=  1'b1;
		else scl_r <= ~scl_clk;
    end
    //使iic时钟线高电平保持在数据线传输每比特数据的中心
    wire scl_offset = (clk_cnt == DIV_CLK>>2); 				
    always @(posedge sys_clk) iic_scl <= scl_offset ? scl_r : iic_scl;		//产生iic串行时钟
    //iic状态机，首先发送地址帧
    always @(negedge scl_clk or negedge sys_rst_n)			//在scl_clk时钟下降沿改变状态，为了保证scl与sda的时序
    begin
    	if(!sys_rst_n) begin
    		iic_s 	 <= IDLE ;		//状态机复位
    		iic_mode <= 1'b1; 		// 设置iic为输出
    		bcnt 	 <= 3'd7;		//iic每次先发送高位，因此初始化赋值为7，发送最高比特，然后递减
    		wcnt 	 <= 0;			//将已写入数据帧数标识置零
    		rcnt 	 <= 0;			//将已读出数据帧数标识置零
    		iic_busy <= 0;			//iic空闲
    		rd_en 	 <= 0;			//
    	end
    	else 
    		case(iic_s)
				IDLE : begin						// 空闲状态设置scl与sda均为1
					if(iic_en || rd_en)begin
						iic_s 	 <= START;			//接收到使能信号iic开始工作	
						iic_busy <= 1'b1;			//iic忙
						iic_mode <=  1'b1; 			// 设置iic为写入
					end
					else begin
						iic_mode 	<= 1'b1;	 	// 设置iic为输出
						wcnt 		<= 0;			//将已写入数据帧数标识置零
						rcnt 		<= 0;			//将已读出数据帧数标识置零
						rd_en 		<= 1'b0;
						iic_busy 	<= 1'b0;			
    				end
				end
				START: begin					
					bcnt <= 3'd7;					//数据从最高位开始传输
					iic_s <= W_WAIT;				
				end
				W_WAIT:begin				
					if(bcnt >0) 
						bcnt <= bcnt -1'b1;		//计数减一，写入下一位数据
					else begin
						iic_s <= W_ACK;	
						wcnt <=  wcnt +1'b1;	//每帧数据写入完成后，帧计数器加一
						iic_mode <=  1'b0 ; 	// 设置iic为读取，即从机向主机输入
					end
						
				end
				W_ACK:begin	
					if(wcnt < wd_cnt) begin
						iic_s <= W_WAIT;
//					 	wcnt <=  wcnt +1'b1;
					 	bcnt <= 3'd7;
					 	iic_mode <=  1'b1 ; 	// 下一个状态是W_WAIT，因此设置iic为写入，即主机向从机输入
					end		
					else if(rd_cnt>0) begin		//如果rd_cnt大于0表示iic是读模式
						if(rd_en == 1'b0) begin //rd_en==0表明还未写入读控制字，跳转到IDLE状态进行读控制字写入
							rd_en <= 1'b1;
							iic_s <= IDLE;
							iic_mode <=  1'b1 ;
						end
						else 
							iic_s <= R_WAIT ;	//已写入读控制字，开始进行数据读取
						bcnt <= 3'd7;
					end		
					else 
						iic_s <= STOP1;			//写入完成跳转到结束状态
					if(sda_r !== 1'b0)			//如果未接收到从机应答信号，停止发送
						iic_s <= STOP1;
				end
				R_WAIT:begin					//读取数据
					rd_en <= 1'b0;				//置零，及时释放
					if(bcnt > 0) begin
						bcnt <= bcnt -1'b1;
					end
					else begin
						rcnt <=  rcnt +1'b1;	
						iic_s <= R_ACK;			
						iic_mode <=  1'b1 ; 	// 设置iic为写入，输出应答信号
					end					
				end
				R_ACK:begin
					if(rcnt < rd_cnt) begin					 	
					 	bcnt <= 3'd7;
					 	iic_s <= R_WAIT;
					 	iic_mode <=  1'b0 ; // 设置iic为读取
					end
					else 
				    begin
						iic_s <= STOP1;
					end
				end
				STOP1:begin//sda = 0 scl = 1
					iic_s <= STOP2;
				end
				STOP2:begin//sda = 1 scl =1
					iic_s <= IDLE;
				end
				default:
					iic_s <= IDLE;
    		endcase
    end
    //IIC总线的SDA数据线是一个双向IO口,使用三态门
	assign iic_sda = iic_mode ? sda_o: 1'bz;
    //sda输出
    always @(*)
    begin
    	if(!sys_rst_n || iic_s == STOP2)
    	begin			//sda = 1
    		sda_o <=  1'b1;
    	end
    	else if(iic_s == START || iic_s == STOP1 || (iic_s == R_ACK && rcnt != rd_cnt))
    	begin   		//sda = 0 
			sda_o <=  0;
		end
		else if(iic_s == W_WAIT)
		begin			//输出最高位
			sda_o <= sda_o_r[7];			
		end				//其他状态数据线拉高
		else sda_o <= 1'b1;
    end
    always @(negedge scl_clk)
    begin
    	if(iic_s == W_ACK || iic_s == START)begin
    		sda_o_r <= rd_en?({w_data[7:1],1'b1}):(w_data[(wcnt*8)+:8]);
//			sda_o_r <= w_data[(wcnt*8)+:8];
    		/*写、读模式下均存在wcnt=0的时候，此时w_data应该是地址帧，
    		即w_data[7：0]为地址帧，其中w_data[0]为模式，0代表写，1代表读*/
//    		if(rd_en) sda_o_r <= {w_data[7:1],1'b1};
    	end
    	else if(iic_s == W_WAIT)	//移位寄存器
    		sda_o_r <= {sda_o_r[6:0],1'b1};
		else 
			sda_o_r <= sda_o_r;
    end
    //暂存iic数据线的数据，用于检测从机应答
    always @(posedge scl_clk)	sda_r <= iic_sda;
    //读模式，
    always @(posedge scl_clk or negedge sys_rst_n)
    begin
    	if(!sys_rst_n)
    		r_data <= 'b0;
		else if(iic_s == R_ACK)
			r_data[((rcnt-1)*8)+:8] <= sda_i_r;
		else if(iic_s == R_WAIT || iic_s == W_ACK)
			sda_i_r <= {sda_i_r[6:0],iic_sda};
		else
			sda_i_r <= 0;
    end
      
endmodule


```

# 20、spi







# 21、ov5640

## 理论知识



## 实验

### 代码实现

- cmos_top

```verilog
module cmos_top(
    input           clk     ,
    input           rst_n   ,
    
    output          scl     ,
    inout           sda     ,
    output          pwdn    ,
    output          reset   ,

    output          cfg_done    //高时配置完成

);
//信号定义

    wire            req         ;
    wire    [3:0]   cmd         ;
    wire            done        ;
    wire    [7:0]   dout        ;
    wire            i2c_scl     ; 
    wire            i2c_sda_i   ; 
    wire            i2c_sda_o   ; 
    wire            i2c_sda_oe  ;

//模块例化

cmos_config u_cfg(
    /*input               */.clk         (clk       ),
    /*input               */.rst_n       (rst_n     ),
    //i2c_master
    /*output              */.req         (req       ),
    /*output      [3:0]   */.cmd         (cmd       ),
    /*output      [7:0]   */.dout        (dout      ),
    /*input               */.done        (done      ),
    /*output              */.config_done (cfg_done  )
);

i2c_master u_i2c(
    /*input               */.clk         (clk       ),
    /*input               */.rst_n       (rst_n     ),
    /*input               */.req         (req       ),
    /*input       [3:0]   */.cmd         (cmd       ),
    /*input       [7:0]   */.din         (dout      ),
    /*output      [7:0]   */.dout        (          ),
    /*output              */.done        (done      ),
    /*output              */.slave_ack   (          ),
    /*output              */.i2c_scl     (scl       ),
    /*input               */.i2c_sda_i   (i2c_sda_i ),
    /*output              */.i2c_sda_o   (i2c_sda_o ),
    /*output              */.i2c_sda_oe  (i2c_sda_oe)   
    );

    assign i2c_sda_i = sda;
    assign sda = i2c_sda_oe?i2c_sda_o:1'bz;
    assign pwdn =  1'b0;
    assign reset = 1'b1;

endmodule 


```



- cmos_config

```verilog
`include "param.v"
module cmos_config(
    input               clk         ,
    input               rst_n       ,
    //i2c_master
    output              req         ,
    output      [3:0]   cmd         ,
    output      [7:0]   dout        ,
    input               done        ,
    
    output              config_done 
);

//定义参数

    localparam  WAIT   = 4'b0001,//上电等待20ms
                IDLE   = 4'b0010,
                WREQ   = 4'b0100,//发写请求
                WRITE  = 4'b1000;//等待一个字节写完
    parameter   DELAY  = 1000_000;//上电延时20ms开始配置
//信号定义

    reg     [3:0]       state_c     ;
    reg     [3:0]       state_n     ;
    
    reg     [19:0]      cnt0        ;
    wire                add_cnt0/* synthesis syn_keep*/    ;
    wire                end_cnt0/* synthesis syn_keep*/    ;
    reg     [1:0]       cnt1        ;
    wire                add_cnt1/* synthesis syn_keep*/    ;
    wire                end_cnt1/* synthesis syn_keep*/    ;
    reg                 config_flag ;//1:表示在配置摄像头 0：表示配置完成
    reg     [23:0]      lut_data    ;

    reg                 tran_req    ; 
    reg      [3:0]      tran_cmd    ; 
    reg      [7:0]      tran_dout   ; 

    wire                wait2idle   ; 
    wire                idle2wreq   ; 
    wire                write2wreq  ; 
    wire                write2idle  ; 


//状态机

    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin        
            state_c <= WAIT;
        end
        else begin
            state_c <= state_n;
        end
    end

    always  @(*)begin
        case(state_c)
            WAIT :begin 
                if(wait2idle)
                   state_n = IDLE;
                else 
                   state_n = state_c; 
            end 
            IDLE :begin 
                if(idle2wreq)
                    state_n = WREQ; 
                else 
                    state_n = state_c; 
            end  
            WREQ  :state_n = WRITE;
            WRITE :begin 
                if(write2wreq)
                    state_n = WREQ; 
                else if(write2idle)
                    state_n = IDLE;
                else 
                    state_n = state_c; 
            end 
            default:state_n = IDLE; 
        endcase 
    end

    assign wait2idle  = state_c == WAIT  && end_cnt0; 
    assign idle2wreq  = state_c == IDLE  && config_flag; 
    assign write2wreq = state_c == WRITE && done && ~end_cnt1; 
    assign write2idle = state_c == WRITE && end_cnt1; 

//计数器
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cnt0 <= 0;
        end
        else if(add_cnt0)begin
            if(end_cnt0)
                cnt0 <= 0;
            else
                cnt0 <= cnt0 + 1;
        end
    end
    
    assign add_cnt0 = state_c == WAIT || state_c == WRITE && end_cnt1;
    assign end_cnt0 = add_cnt0 && cnt0 == ((state_c == WAIT)?(DELAY-1):(`REG_NUM-1));

    always @(posedge clk or negedge rst_n)begin 
        if(!rst_n)begin
            cnt1 <= 0;
        end
        else if(add_cnt1)begin
            if(end_cnt1)
                cnt1 <= 0;
            else
                cnt1 <= cnt1 + 1;
        end
    end
    
    assign add_cnt1 = state_c == WRITE && done;
    assign end_cnt1 = add_cnt1 && cnt1 == 4-1;

//config_flag
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            config_flag <= 1'b1;
        end
        else if(config_flag & end_cnt0 & state_c != WAIT)begin    //所有寄存器配置完，flag拉低
            config_flag <= 1'b0;
        end
    end

//输出寄存器

    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            tran_req <= 0;
            tran_cmd <= 0;
            tran_dout <= 0;
        end
        else if(state_c == WREQ)begin
            case(cnt1)
                0:begin 
                    tran_req <= 1;
                    tran_cmd <= {`CMD_START | `CMD_WRITE};
                    tran_dout <= `WR_ID;
                end 
                1:begin 
                    tran_req <= 1;
                    tran_cmd <= `CMD_WRITE;
                    tran_dout <= lut_data[23:16];
                end
                2:begin 
                    tran_req <= 1;
                    tran_cmd <= `CMD_WRITE;
                    tran_dout <= lut_data[15:8];
                end
                3:begin 
                    tran_req <= 1;
                    tran_cmd <= {`CMD_STOP | `CMD_WRITE};
                    tran_dout <= lut_data[7:0];
                end
                default:tran_req <= 0;
            endcase 
        end
		else begin
		    tran_req  <= 0;
            tran_cmd  <= 0;
            tran_dout <= 0;
		end 
    end

//输出

    assign config_done = ~config_flag;
    assign req = tran_req;
    assign cmd = tran_cmd;
    assign dout = tran_dout;


//lut_data   
    always@(*)begin
	    case(cnt0)			  
		 //15fps VGA YUV output
		 // 24MHz input clock, 84MHz PCLK
		 0  :lut_data	= 	{24'h3103_11}; // system clock from pad, bit[1]
		 1  :lut_data	= 	{24'h3008_82}; // software reset, bit[7]
		 2  :lut_data	= 	{24'h3008_42}; // software power down, bit[6]
		 3  :lut_data	= 	{24'h3103_03}; // system clock from PLL, bit[1]
		 4  :lut_data	= 	{24'h3017_ff}; // FREX, Vsync, HREF, PCLK, D[9:6] output enable
		 5  :lut_data	= 	{24'h3018_ff}; // D[5:0], GPIO[1:0] output enable
		 6  :lut_data	= 	{24'h3034_1a}; // MIPI 10-bit
		 7  :lut_data	= 	{24'h3037_13}; // PLL root divider, bit[4], PLL pre-divider, bit[3:0]
		 8  :lut_data	= 	{24'h3108_01}; // PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2]
		 9  :lut_data	= 	{24'h3630_36};//SCLK root divider, bit[1:0]
		 10 :lut_data	= 	{24'h3631_0e};
		 11 :lut_data	= 	{24'h3632_e2};
		 12 :lut_data	= 	{24'h3633_12};
		 13 :lut_data	= 	{24'h3621_e0};
		 14 :lut_data	= 	{24'h3704_a0};
		 15 :lut_data	= 	{24'h3703_5a};
		 16 :lut_data	= 	{24'h3715_78};
		 17 :lut_data	= 	{24'h3717_01};
		 18 :lut_data	= 	{24'h370b_60};
		 19 :lut_data	= 	{24'h3705_1a};
		 20 :lut_data	= 	{24'h3905_02};
		 21 :lut_data	= 	{24'h3906_10};
		 22 :lut_data	= 	{24'h3901_0a};
		 23 :lut_data	= 	{24'h3731_12};
		 24 :lut_data	= 	{24'h3600_08}; // VCM control
		 25 :lut_data	= 	{24'h3601_33}; // VCM control
		 26 :lut_data	= 	{24'h302d_60}; // system control
		 27 :lut_data	= 	{24'h3620_52};
		 28 :lut_data	= 	{24'h371b_20};
		 29 :lut_data	= 	{24'h471c_50};
		 30 :lut_data	= 	{24'h3a13_43}; // pre-gain = 1.047x
		 31 :lut_data	= 	{24'h3a18_00}; // gain ceiling
		 32 :lut_data	= 	{24'h3a19_f8}; // gain ceiling = 15.5x
		 33 :lut_data	= 	{24'h3635_13};
		 34 :lut_data	= 	{24'h3636_03};
		 35 :lut_data	= 	{24'h3634_40};
		 36 :lut_data	= 	{24'h3622_01};
		// 50/60Hz detection 50/60Hz 灯光条纹过滤
		 37 :lut_data	= 	{24'h3c01_34}; // Band auto, bit[7]
		 38 :lut_data	= 	{24'h3c04_28}; // threshold low sum
		 39 :lut_data	= 	{24'h3c05_98}; // threshold high sum
		 40 :lut_data	= 	{24'h3c06_00}; // light meter 1 threshold[15:8]
		 41 :lut_data	= 	{24'h3c07_08}; // light meter 1 threshold[7:0]
		 42 :lut_data	= 	{24'h3c08_00}; // light meter 2 threshold[15:8]
		 43 :lut_data	= 	{24'h3c09_1c}; // light meter 2 threshold[7:0]
		 44 :lut_data	= 	{24'h3c0a_9c}; // sample number[15:8]
		 45 :lut_data	= 	{24'h3c0b_40}; // sample number[7:0]
		 46 :lut_data	= 	{24'h3810_00}; // Timing Hoffset[11:8]
		 47 :lut_data	= 	{24'h3811_10}; // Timing Hoffset[7:0]
		 48 :lut_data	= 	{24'h3812_00}; // Timing Voffset[10:8]
		 49 :lut_data	= 	{24'h3708_64};
		 50 :lut_data	= 	{24'h4001_02}; // BLC start from line 2
		 51 :lut_data	= 	{24'h4005_1a}; // BLC always update
		 52 :lut_data	= 	{24'h3000_00}; // enable blocks
		 53 :lut_data	= 	{24'h3004_ff}; // enable clocks
		 54 :lut_data	= 	{24'h300e_58}; //MIPI power down,DVP enable
		 55 :lut_data	= 	{24'h302e_00};
		 56 :lut_data	= 	{24'h4300_61}; // RGB,
		 57 :lut_data	= 	{24'h501f_01}; // ISP RGB
		 58 :lut_data	= 	{24'h440e_00};
		 59 :lut_data	= 	{24'h5000_a7}; // Lenc on, raw gamma on, BPC on, WPC on, CIP on
		// AEC target 自动曝光控制
		 60 :lut_data	= 	{24'h3a0f_30}; // stable range in high
		 61 :lut_data	= 	{24'h3a10_28}; // stable range in low
		 62 :lut_data	= 	{24'h3a1b_30}; // stable range out high
		 63 :lut_data	= 	{24'h3a1e_26}; // stable range out low
		 64 :lut_data	= 	{24'h3a11_60}; // fast zone high
		 65 :lut_data	= 	{24'h3a1f_14}; // fast zone low
		// Lens correction for ? 镜头补偿
		 66 :lut_data	= 	{24'h5800_23};
		 67 :lut_data	= 	{24'h5801_14};
		 68 :lut_data	= 	{24'h5802_0f};
		 69 :lut_data	= 	{24'h5803_0f};
		 70 :lut_data	= 	{24'h5804_12};
		 71 :lut_data	= 	{24'h5805_26};
		 72 :lut_data	= 	{24'h5806_0c};
		 73 :lut_data	= 	{24'h5807_08};
		 74 :lut_data	= 	{24'h5808_05};
		 75 :lut_data	= 	{24'h5809_05};
		 76 :lut_data	= 	{24'h580a_08};
		 77 :lut_data	= 	{24'h580b_0d};
		 78 :lut_data	= 	{24'h580c_08};
		 79 :lut_data	= 	{24'h580d_03};
		 80 :lut_data	= 	{24'h580e_00};
		 81 :lut_data	= 	{24'h580f_00};
		 82 :lut_data	= 	{24'h5810_03};
		 83 :lut_data	= 	{24'h5811_09};
		 84 :lut_data	= 	{24'h5812_07};
		 85 :lut_data	= 	{24'h5813_03};
		 86 :lut_data	= 	{24'h5814_00};
		 87 :lut_data	= 	{24'h5815_01};
		 88 :lut_data	= 	{24'h5816_03};
		 89 :lut_data	= 	{24'h5817_08};
		 90 :lut_data	= 	{24'h5818_0d};
		 91 :lut_data	= 	{24'h5819_08};
		 92 :lut_data	= 	{24'h581a_05};
		 93 :lut_data	= 	{24'h581b_06};
		 94 :lut_data	= 	{24'h581c_08};
		 95 :lut_data	= 	{24'h581d_0e};
		 96 :lut_data	= 	{24'h581e_29};
		 97 :lut_data	= 	{24'h581f_17};
		 98 :lut_data	= 	{24'h5820_11};
		 99 :lut_data	= 	{24'h5821_11};
		 100:lut_data	= 	{24'h5822_15};
		 101:lut_data	= 	{24'h5823_28};
		 102:lut_data	= 	{24'h5824_46};
		 103:lut_data	= 	{24'h5825_26};
		 104:lut_data	= 	{24'h5826_08};
		 105:lut_data	= 	{24'h5827_26};
		 106:lut_data	= 	{24'h5828_64};
		 107:lut_data	= 	{24'h5829_26};
		 108:lut_data	= 	{24'h582a_24};
		 109:lut_data	= 	{24'h582b_22};
		 110:lut_data	= 	{24'h582c_24};
		 111:lut_data	= 	{24'h582d_24};
		 112:lut_data	= 	{24'h582e_06};
		 113:lut_data	= 	{24'h582f_22};
		 114:lut_data	= 	{24'h5830_40};
		 115:lut_data	= 	{24'h5831_42};
		 116:lut_data	= 	{24'h5832_24};
		 117:lut_data	= 	{24'h5833_26};
		 118:lut_data	= 	{24'h5834_24};
		 119:lut_data	= 	{24'h5835_22};
		 120:lut_data	= 	{24'h5836_22};
		 121:lut_data	= 	{24'h5837_26};
		 122:lut_data	= 	{24'h5838_44};
		 123:lut_data	= 	{24'h5839_24};
		 124:lut_data	= 	{24'h583a_26};
		 125:lut_data	= 	{24'h583b_28};
		 126:lut_data	= 	{24'h583c_42};
		 127:lut_data	= 	{24'h583d_ce}; // lenc BR offset
		// AWB 自动白平衡
		 128:lut_data	= 	{24'h5180_ff}; // AWB B block
		 129:lut_data	= 	{24'h5181_f2}; // AWB control
		 130:lut_data	= 	{24'h5182_00}; // [7:4] max local counter, [3:0] max fast counter
		 131:lut_data	= 	{24'h5183_14}; // AWB advanced
		 132:lut_data	= 	{24'h5184_25};
		 133:lut_data	= 	{24'h5185_24};
		 134:lut_data	= 	{24'h5186_09};
		 135:lut_data	= 	{24'h5187_09};
		 136:lut_data	= 	{24'h5188_09};
		 137:lut_data	= 	{24'h5189_75};
		 138:lut_data	= 	{24'h518a_54};
		 139:lut_data	= 	{24'h518b_e0};
		 140:lut_data	= 	{24'h518c_b2};
		 141:lut_data	= 	{24'h518d_42};
		 142:lut_data	= 	{24'h518e_3d};
		 143:lut_data	= 	{24'h518f_56};
		 144:lut_data	= 	{24'h5190_46};
		 145:lut_data	= 	{24'h5191_f8}; // AWB top limit
		 146:lut_data	= 	{24'h5192_04}; // AWB bottom limit
		 147:lut_data	= 	{24'h5193_70}; // red limit
		 148:lut_data	= 	{24'h5194_f0}; // green limit
		 149:lut_data	= 	{24'h5195_f0}; // blue limit
		 150:lut_data	= 	{24'h5196_03}; // AWB control
		 151:lut_data	= 	{24'h5197_01}; // local limit
		 152:lut_data	= 	{24'h5198_04};
		 153:lut_data	= 	{24'h5199_12};
		 154:lut_data	= 	{24'h519a_04};
		 155:lut_data	= 	{24'h519b_00};
		 156:lut_data	= 	{24'h519c_06};
		 157:lut_data	= 	{24'h519d_82};
		 158:lut_data	= 	{24'h519e_38}; // AWB control
		// Gamma 伽玛曲线
		 159:lut_data	= 	{24'h5480_01}; //Gamma bias plus on, bit[0]
		 160:lut_data	= 	{24'h5481_08};
		 161:lut_data	= 	{24'h5482_14};
		 162:lut_data	= 	{24'h5483_28};
		 163:lut_data	= 	{24'h5484_51};
		 164:lut_data	= 	{24'h5485_65};
		 165:lut_data	= 	{24'h5486_71};
		 166:lut_data	= 	{24'h5487_7d};
		 167:lut_data	= 	{24'h5488_87};
		 168:lut_data	= 	{24'h5489_91};
		 169:lut_data	= 	{24'h548a_9a};
		 170:lut_data	= 	{24'h548b_aa};
		 171:lut_data	= 	{24'h548c_b8};
		 172:lut_data	= 	{24'h548d_cd};
		 173:lut_data	= 	{24'h548e_dd};
		 174:lut_data	= 	{24'h548f_ea};
		 175:lut_data	= 	{24'h5490_1d};
		// color matrix 色彩矩阵
		 176:lut_data	= 	{24'h5381_1e}; // CMX1 for Y
		 177:lut_data	= 	{24'h5382_5b}; // CMX2 for Y
		 178:lut_data	= 	{24'h5383_08}; // CMX3 for Y
		 179:lut_data	= 	{24'h5384_0a}; // CMX4 for U
		 180:lut_data	= 	{24'h5385_7e}; // CMX5 for U
		 181:lut_data	= 	{24'h5386_88}; // CMX6 for U
		 182:lut_data	= 	{24'h5387_7c}; // CMX7 for V
		 183:lut_data	= 	{24'h5388_6c}; // CMX8 for V
		 184:lut_data	= 	{24'h5389_10}; // CMX9 for V
		 185:lut_data	= 	{24'h538a_01}; // sign[9]
		 186:lut_data	= 	{24'h538b_98}; // sign[8:1]
		// UV adjust UV 色彩饱和度调整
		 187:lut_data	= 	{24'h5580_06}; // saturation on, bit[1]
		 188:lut_data	= 	{24'h5583_40};
		 189:lut_data	= 	{24'h5584_10};
		 190:lut_data	= 	{24'h5589_10};
		 191:lut_data	= 	{24'h558a_00};
		 192:lut_data	= 	{24'h558b_f8};
		 193:lut_data	= 	{24'h501d_40}; // enable manual offset of contrast
		// CIP 锐化和降噪
		 194:lut_data	= 	{24'h5300_08}; //CIP sharpen MT threshold 1
		 195:lut_data	= 	{24'h5301_30}; //CIP sharpen MT threshold 2
		 196:lut_data	= 	{24'h5302_10}; // CIP sharpen MT offset 1
		 197:lut_data	= 	{24'h5303_00}; // CIP sharpen MT offset 2
		 198:lut_data	= 	{24'h5304_08}; // CIP DNS threshold 1
		 199:lut_data	= 	{24'h5305_30}; // CIP DNS threshold 2
		 200:lut_data	= 	{24'h5306_08}; // CIP DNS offset 1
		 201:lut_data	= 	{24'h5307_16}; // CIP DNS offset 2
		 202:lut_data	= 	{24'h5309_08}; //CIP sharpen TH threshold 1
		 203:lut_data	= 	{24'h530a_30}; //CIP sharpen TH threshold 2
		 204:lut_data	= 	{24'h530b_04}; //CIP sharpen TH offset 1
		 205:lut_data	= 	{24'h530c_06}; //CIP sharpen TH offset 2
		 206:lut_data	= 	{24'h5025_00};
		 207:lut_data	= 	{24'h3008_02}; //wake up from standby,bit[6]
		// input clock 24Mhz, PCLK 84Mhz
		 208:lut_data	= 	{24'h3035_21}; // PLL
		 209:lut_data	= 	{24'h3036_69}; // PLL
		 210:lut_data	= 	{24'h3c07_07}; // lightmeter 1 threshold[7:0]
		 211:lut_data	= 	{24'h3820_47}; // flip
		 212:lut_data	= 	{24'h3821_01}; // no mirror
		 213:lut_data	= 	{24'h3814_31}; // timing X inc
		 214:lut_data	= 	{24'h3815_31}; // timing Y inc
		 215:lut_data	= 	{24'h3800_00}; // HS
		 216:lut_data	= 	{24'h3801_00}; // HS
		 217:lut_data	= 	{24'h3802_00}; // VS
		 218:lut_data	= 	{24'h3803_fa}; // VS
		 219:lut_data	= 	{24'h3804_0a}; // HW  :   	 
		 220:lut_data	= 	{24'h3805_3f}; // HW  :   	
		 221:lut_data	= 	{24'h3806_06}; // VH  :   	
		 222:lut_data	= 	{24'h3807_a9}; // VH  :   	
		 223:lut_data	= 	{24'h3808_05}; // DVPHO 1280
		 224:lut_data	= 	{24'h3809_00}; // DVPHO
		 225:lut_data	= 	{24'h380a_02}; // DVPVO 720
		 226:lut_data	= 	{24'h380b_d0}; // DVPVO
		 227:lut_data	= 	{24'h380c_07}; // HTS
		 228:lut_data	= 	{24'h380d_64}; // HTS
		 229:lut_data	= 	{24'h380e_02}; // VTS
		 230:lut_data	= 	{24'h380f_e4}; // VTS
		 231:lut_data	= 	{24'h3813_04}; // timing V offset
		 232:lut_data	= 	{24'h3618_00};
		 233:lut_data	= 	{24'h3612_29};
		 234:lut_data	= 	{24'h3709_52};
		 235:lut_data	= 	{24'h370c_03};
		 236:lut_data	= 	{24'h3a02_02}; // 60Hz max exposure
		 237:lut_data	= 	{24'h3a03_e0}; // 60Hz max exposure
		 238:lut_data	= 	{24'h3a14_02}; // 50Hz max exposure
		 239:lut_data	= 	{24'h3a15_e0}; // 50Hz max exposure
		 240:lut_data	= 	{24'h4004_02}; // BLC line number
		 241:lut_data	= 	{24'h3002_1c}; // reset JFIFO, SFIFO, JPG
		 242:lut_data	= 	{24'h3006_c3}; // disable clock of JPEG2x, JPEG
		 243:lut_data	= 	{24'h4713_03}; // JPEG mode 3
		 244:lut_data	= 	{24'h4407_04}; // Quantization scale
		 245:lut_data	= 	{24'h460b_37};
		 246:lut_data	= 	{24'h460c_20};
		 247:lut_data	= 	{24'h4837_16}; // MIPI global timing
		 248:lut_data	= 	{24'h3824_04}; // PCLK manual divider
		 249:lut_data	= 	{24'h5001_83}; // SDE on, CMX on, AWB on
		 250:lut_data	= 	{24'h3503_00}; // AEC/AGC on             
		 251:lut_data	= 	{24'h4740_20}; // VS 1
		 252:lut_data	= 	{24'h503d_80}; // color bar
		 253:lut_data	= 	{24'h4741_00}; //
		default:lut_data	=	0;
	    endcase
    end

endmodule 

```

- i2c_master

```verilog
`include "param.v"

module i2c_master(
    input               clk         ,
    input               rst_n       ,

    input               req         ,
    input       [3:0]   cmd         ,
    input       [7:0]   din         ,

    output      [7:0]   dout        ,
    output              done        ,
    output              slave_ack   ,

    output              i2c_scl     ,
    input               i2c_sda_i   ,
    output              i2c_sda_o   ,
    output              i2c_sda_oe     
    );

//状态机参数定义

    localparam  IDLE  = 7'b000_0001,
                START = 7'b000_0010,
                WRITE = 7'b000_0100,
                RACK  = 7'b000_1000,
                READ  = 7'b001_0000,
                SACK  = 7'b010_0000,
                STOP  = 7'b100_0000;

//信号定义

    reg     [6:0]       state_c     ;
    reg     [6:0]       state_n     ;

    reg     [8:0]       cnt_scl     ;//产生i2c时钟
    wire                add_cnt_scl ;
    wire                end_cnt_scl ;
    reg     [3:0]       cnt_bit     ;//传输数据 bit计数器
    wire                add_cnt_bit ;
    wire                end_cnt_bit ;
    reg     [3:0]       bit_num     ;
    
    reg                 scl         ;//输出寄存器
    reg                 sda_out     ;
    reg                 sda_out_en  ;

    reg     [7:0]       rx_data     ;
    reg                 rx_ack      ;
    reg     [3:0]       command     ;
    reg     [7:0]       tx_data     ;//发送数据

    wire                idle2start  ; 
    wire                idle2write  ; 
    wire                idle2read   ; 
    wire                start2write ; 
    wire                start2read  ; 
    wire                write2rack  ; 
    wire                read2sack   ; 
    wire                rack2stop   ; 
    wire                sack2stop   ; 
    wire                rack2idle   ; 
    wire                sack2idle   ; 
    wire                stop2idle   ; 


//状态机
    always @(posedge clk or negedge rst_n) begin 
        if (rst_n==0) begin
            state_c <= IDLE ;
        end
        else begin
            state_c <= state_n;
       end
    end
    
    always @(*) begin 
        case(state_c)  
            IDLE :begin
                if(idle2start)
                    state_n = START ;
                else if(idle2write)
                    state_n = WRITE ;
                else if(idle2read)
                    state_n = READ ;
                else 
                    state_n = state_c ;
            end
            START :begin
                if(start2write)
                    state_n = WRITE ;
                else if(start2read)
                    state_n = READ ;
                else 
                    state_n = state_c ;
            end
            WRITE :begin
                if(write2rack)
                    state_n = RACK ;
                else 
                    state_n = state_c ;
            end
            RACK :begin
                if(rack2stop)
                    state_n = STOP ;
                else if(rack2idle)
                    state_n = IDLE ;
                else 
                    state_n = state_c ;
            end
            READ :begin
                if(read2sack)
                    state_n = SACK ;
                else 
                    state_n = state_c ;
            end
            SACK :begin
                if(sack2stop)
                    state_n = STOP ;
                else if(sack2idle)
                    state_n = IDLE ;
                else 
                    state_n = state_c ;
            end
            STOP :begin
                if(stop2idle)
                    state_n = IDLE ;
                else 
                    state_n = state_c ;
            end
            default : state_n = IDLE ;
        endcase
    end
    
    assign idle2start  = state_c==IDLE  && (req && (cmd&`CMD_START));
    assign idle2write  = state_c==IDLE  && (req && (cmd&`CMD_WRITE));
    assign idle2read   = state_c==IDLE  && (req && (cmd&`CMD_READ ));
    assign start2write = state_c==START && (end_cnt_bit && (command&`CMD_WRITE));
    assign start2read  = state_c==START && (end_cnt_bit && (command&`CMD_READ ));
    assign write2rack  = state_c==WRITE && (end_cnt_bit);
    assign read2sack   = state_c==READ  && (end_cnt_bit);
    assign rack2stop   = state_c==RACK  && (end_cnt_bit && (command&`CMD_STOP ));
    assign sack2stop   = state_c==SACK  && (end_cnt_bit && (command&`CMD_STOP ));
    assign rack2idle   = state_c==RACK  && (end_cnt_bit && (command&`CMD_STOP ) == 0);
    assign sack2idle   = state_c==SACK  && (end_cnt_bit && (command&`CMD_STOP ) == 0);
    assign stop2idle   = state_c==STOP  && (end_cnt_bit);
    
//计数器
    always @(posedge clk or negedge rst_n) begin 
        if (rst_n==0) begin
            cnt_scl <= 0; 
        end
        else if(add_cnt_scl) begin
            if(end_cnt_scl)
                cnt_scl <= 0; 
            else
                cnt_scl <= cnt_scl+1 ;
       end
    end
    assign add_cnt_scl = (state_c != IDLE);
    assign end_cnt_scl = add_cnt_scl  && cnt_scl == (`SCL_PERIOD)-1 ;

    always @(posedge clk or negedge rst_n) begin 
        if (rst_n==0) begin
            cnt_bit <= 0; 
        end
        else if(add_cnt_bit) begin
            if(end_cnt_bit)
                cnt_bit <= 0; 
            else
                cnt_bit <= cnt_bit+1 ;
       end
    end
    assign add_cnt_bit = (end_cnt_scl);
    assign end_cnt_bit = add_cnt_bit  && cnt_bit == (bit_num)-1 ;

    always  @(*)begin
        if(state_c == WRITE | state_c == READ) begin
            bit_num = 8;
        end
        else begin 
            bit_num = 1;
        end 
    end
//command
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            command <= 0;
        end
        else if(req)begin
            command <= cmd;
        end
    end

//tx_data
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            tx_data <= 0;
        end
        else if(req)begin
            tx_data <= din;
        end
    end

//scl
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            scl <= 1'b1;
        end
        else if(idle2start | idle2write | idle2read)begin//开始发送时，拉低
            scl <= 1'b0;
        end
        else if(add_cnt_scl && cnt_scl == `SCL_HALF-1)begin 
            scl <= 1'b1;
        end 
        else if(end_cnt_scl && ~stop2idle)begin 
            scl <= 1'b0;
        end 
    end

//sda_out
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            sda_out <= 1'b1;
        end
        else if(state_c == START)begin          //发起始位
            if(cnt_scl == `LOW_HLAF)begin       //时钟低电平时拉高sda总线
                sda_out <= 1'b1;
            end
            else if(cnt_scl == `HIGH_HALF)begin    //时钟高电平时拉低sda总线 
                sda_out <= 1'b0;                //保证从机能检测到起始位
            end 
        end 
        else if(state_c == WRITE && cnt_scl == `LOW_HLAF)begin  //scl低电平时发送数据   并串转换
            sda_out <= tx_data[7-cnt_bit];      
        end 
        else if(state_c == SACK && cnt_scl == `LOW_HLAF)begin  //发应答位
            sda_out <= (command&`CMD_STOP)?1'b1:1'b0;
        end 
        else if(state_c == STOP)begin //发停止位
            if(cnt_scl == `LOW_HLAF)begin       //时钟低电平时拉低sda总线
                sda_out <= 1'b0;
            end
            else if(cnt_scl == `HIGH_HALF)begin    //时钟高电平时拉高sda总线 
                sda_out <= 1'b1;                //保证从机能检测到停止位
            end 
        end 
    end

//sda_out_en  总线输出数据使能
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            sda_out_en <= 1'b0;
        end
        else if(idle2start | idle2write | read2sack | rack2stop)begin
            sda_out_en <= 1'b1;
        end
        else if(idle2read | start2read | write2rack | stop2idle)begin 
            sda_out_en <= 1'b0;
        end 
    end

//rx_data       接收读入的数据
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            rx_data <= 0;
        end
        else if(state_c == READ && cnt_scl == `HIGH_HALF)begin
            rx_data[7-cnt_bit] <= i2c_sda_i;    //串并转换
        end
    end

//rx_ack
    always  @(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            rx_ack <= 1'b1;
        end
        else if(state_c == RACK && cnt_scl == `HIGH_HALF)begin
            rx_ack <= i2c_sda_i;
        end
    end


//输出信号

    assign i2c_scl    = scl         ;
    assign i2c_sda_o  = sda_out     ;
    assign i2c_sda_oe = sda_out_en  ;
   
    assign dout = rx_data;
    assign done = rack2idle | sack2idle | stop2idle;
    assign slave_ack = rx_ack;

endmodule


```

- param.v

```verilog
//摄像头参数

//i2c时钟参数
`define  SCL_PERIOD  250
`define  SCL_HALF    125
`define  LOW_HLAF    65 
`define  HIGH_HALF   190

//i2c命令参数
`define CMD_START   4'b0001
`define CMD_WRITE   4'b0010
`define CMD_READ    4'b0100
`define CMD_STOP    4'b1000

//从机ID定义
`define WR_ID 8'h78
`define RD_ID 8'h79

//配置寄存器个数
//`define REG_NUM     254
`define REG_NUM     252

```



# 22、axi



# 23、以太网





# 24、sdk



