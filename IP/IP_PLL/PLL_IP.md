# PLL _IP 核

​		PLL(Phase  Locked  Loop ,即锁相环)，可以对FPGA的时钟信号进行任意分频，倍频，相位调制，占空比调整，，从而输出一个期望时钟。

## 	PLL 	IP核的简介

​		PLL（Phase-Locked Loop）是一种常见的IP核，用于时钟管理和信号生成应用。PLL IP核通过锁定输入参考信号的相位和频率，生成一个稳定的输出时钟信号。

### 功能和特点：

1. **时钟倍频和除频：** PLL可以将输入参考时钟信号的频率进行倍频或除频操作，生成高频或低频的输出时钟信号。这使得PLL在时钟频率转换和时钟域切换的应用中非常有用。
2. **锁定和跟踪：** PLL通过内部的反馈环路，可以自动锁定到输入参考信号的频率和相位。一旦锁定成功，PLL可以跟踪输入信号的变化，以保持输出时钟的稳定性。
3. **时钟延迟和相位偏移控制：** PLL允许对输出时钟信号进行延迟和相位偏移的控制。这对于需要精确的时序控制或时钟对齐的应用非常重要。
4. **频率合成：** PLL可以通过调整内部的控制参数，合成出特定的输出频率。这使得PLL在需要非标准时钟频率的应用中非常有用，例如无线通信、音视频处理等。
5. **时钟清晰度和抖动控制：** PLL可以提供良好的时钟清晰度和抖动控制。时钟清晰度指输出时钟的稳定性和准确性，而抖动是指时钟信号的瞬态波动。PLL可以通过内部的反馈环路和滤波器来减小抖动，并提供稳定的时钟信号。
6. **可配置性和可重用性：** PLL IP核通常具有可配置的参数，如输入频率范围、倍频或除频比、延迟控制等。这使得设计人员可以根据具体应用的需求进行定制，并在不同的设计中重复使用该IP核。

### 工作原理

<img src="F:\project\IP\IP_PLL\PLL_IP.png" alt="image-20230918171918778" style="zoom: 50%;" />

1. **参考信号输入：** PLL的工作始于将外部的参考信号输入到PLL中。参考信号通常是一个稳定的时钟信号，也称为参考时钟。

2. **相频比较器（Phase/Frequency Detector）：** 参考信号与PLL内部的反馈信号进行相频比较。相频比较器检测输入参考信号和反馈信号之间的相位差和频率差，并产生一个控制信号。

   ​		相频比较器的主要作用是检测输入参考信号和反馈信号之间的差异，并根据差异的大小和方向生成一个控制信号。这个控制信号会传递到PLL的后续阶段，以调整VCO的频率，使其与参考信号保持同步。

   具体来说，相频比较器通常有两个输入端和一个输出端：

   1. **参考信号输入端（Reference Input）：** 这个输入端接收外部的参考信号，通常是一个稳定的时钟信号。参考信号可以是一个单独的周期性信号，或者是一个特定频率的连续信号。
   2. **反馈信号输入端（Feedback Input）：** 这个输入端连接到PLL反馈回路中的某个位置，接收VCO输出的反馈信号。反馈信号是PLL输出时钟信号的一部分，它反映了VCO当前的频率和相位状态。
   3. **控制信号输出端（Control Signal Output）：** 这个输出端产生一个控制信号，其形式和特性取决于具体的相频比较器设计。控制信号通常是一个脉冲信号或者是一个模拟电压信号，用于调整VCO的频率。

3. **滤波器（Loop Filter）：** 控制信号通过滤波器，通常是一个低通滤波器。滤波器主要用于滤除控制信号中的高频噪声，以确保稳定的控制信号传递给下一阶段。

   ​		滤波器的作用是对输入信号进行频率选择，只允许特定频率范围内的信号通过，同时抑制频率范围之外的信号。在PLL中，滤波器主要用于平滑相频比较器输出的控制信号，并提供稳定的调整信号给VCO（Voltage-Controlled Oscillator）。

   在PLL中，滤波器通常被称为"Loop Filter"（环路滤波器），它的设计目标是平衡两个重要的方面：

   1. **抑制高频噪声和振荡：** 相频比较器的输出可能包含高频噪声和振荡，并且这些不需要的高频成分会对VCO的控制产生不稳定的影响。滤波器通过选择合适的截止频率，可以滤除这些高频成分，以保持控制信号的稳定性。
   2. **响应时间和锁定速度：** 滤波器的响应时间决定了PLL的锁定速度。过大的滤波器时间常数会导致响应时间较慢，PLL的锁定时间较长。而过小的滤波器时间常数可能会导致过度敏感，使得PLL对噪声和干扰更加敏感。因此，滤波器的设计需要在稳定性和锁定速度之间进行权衡。

   根据具体的设计需求和应用场景，滤波器可以采用不同的类型和结构，包括：

   - **低通滤波器（Low-Pass Filter）：** 只允许低频信号通过，抑制高频信号。
   - **带通滤波器（Band-Pass Filter）：** 允许特定频率范围内的信号通过，抑制低频和高频信号。
   - **高通滤波器（High-Pass Filter）：** 只允许高频信号通过，抑制低频信号。

   滤波器可以采用模拟滤波器或数字滤波器的形式实现，具体取决于PLL的设计要求和实现平台。在数字系统中，常用的数字滤波器包括FIR（Finite Impulse Response）滤波器和IIR（Infinite Impulse Response）滤波器。

   通过适当设计和调整滤波器的参数，可以实现滤波器在PLL中的稳定性和性能要求，确保控制信号的稳定性和抑制不需要的噪声和干扰。

4. **电压控制振荡器（Voltage-Controlled Oscillator，VCO）：** 控制信号经过滤波器后，进入VCO。VCO是一个自由振荡器，其频率可以根据输入的控制电压进行调整。

5. **反馈回路：** VCO的输出被反馈到相频比较器，形成一个反馈回路。通过调整VCO的频率，使得VCO的输出与参考信号的频率和相位保持一致。

6. **锁相和稳定：** 当相频比较器检测到VCO输出与参考信号的相位差和频率差很小时，控制信号的调整逐渐减小，直到达到稳定的状态。在稳定状态下，VCO的输出频率与参考信号的频率相同，且相位差稳定.

## 在vivado 中学会PLL  IP 核的配置

对配置好的IP核进行仿真

### 代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 16:23:17
// Design Name: 
// Module Name: pll
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


module pll(
    input   wire    clk,                    //100MHZ时钟信号

    output  wire    clk_mul_2,              //2倍频信号
    output  wire    clk_div_2,              //2分频信号
    output  wire    clk_phase_90,           //相移90
    output  wire    clk_ducle_20,           //占空比为20%
    output  wire    locked                  //检测锁相器是否已经锁定
                                            //只有当该信号为高电平时，输出的时钟信号是稳定的；
    );

    pll_ip  pll_ip_inst(
        .clk_in1 (clk),
        .clk_out1(clk_mul_2),
        .clk_out2(clk_div_2),
        .clk_out3(clk_phase_90),
        .clk_out4(clk_ducle_20),
        .locked(locked)
    );    
endmodule

```

仿真代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 16:41:46
// Design Name: 
// Module Name: tb_pll
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


module tb_pll();

    reg clk;

    wire clk_mul_2;
    wire clk_div_2;
    wire clk_phase_90;
    wire clk_ducle_20;
    wire locked;

    initial begin
        clk = 1'b0;
    end

    always #5 clk = ~clk;

    pll pll_inst(
        .clk(clk),
        .clk_div_2(clk_div_2),
        .clk_ducle_20 (clk_ducle_20),
        .clk_mul_2(clk_mul_2),
        .clk_phase_90 (clk_phase_90),
        .locked(locked)
    );
endmodule

```















