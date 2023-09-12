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

### 基础篇

#### 点亮一个led灯   ————>led

# 点亮一个led灯

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

![image-20230901170102659](F:\progect\led\doc\image-20230901170102659.png)

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

![image-20230901170718807](F:\progect\led\doc\image-20230901170718807.png)

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

#### 二路选择器————> mux2_1

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

#### 3-8译码器————> decoder3_8dr

#### 半加器————>half_adder

#### 层次化设计 全加器 ————>full_adder

#### 时序逻辑 点亮led灯 ————>flip_flop

#### 计数器————>counter

#### 分频器————>divider

#### 流水灯————>water_led

#### 状态机————fsm

