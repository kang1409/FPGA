# IP核的学习

## 理论学习

​			IP (用于ASIC和FPGA中的预先设计好的电路功能模块) ，IP核在数字电路中常用于较复杂的功能模块 (例如:FIFO，RAM，FIR滤波器，SDRAM 控制器，PCIE接口，等)设计成参数可修改的模块；

​			IP核有三种不同的存在形式：HDL语言形式，网表形式，版图形式；分别对应着我们常说的软核，固核，硬核。 

### 软核

在FPGA设计中，软核（Soft Core）是指以软件形式实现的处理器或其他可编程逻辑功能模块。相比于硬核（Hard Core），软核是通过配置FPGA内部资源来实现的，而不是通过硬件电路固化在FPGA芯片中。

IP核（Intellectual Property Core）是可重用的硬件模块，用于实现特定的功能，如处理器、存储器、通信接口等。IP核可以是硬核（由硬件电路实现）或软核（通过配置FPGA资源实现）。

软核通常指的是软件处理器，如ARM Cortex-M系列处理器或MicroBlaze处理器。这些软件处理器可以在FPGA上运行软件代码，实现特定的计算、控制或通信功能。软核的优点是灵活性和可编程性，可以通过更改软件代码来改变其行为，从而适应不同的应用需求。

使用软核可以在FPGA设计中实现更复杂的功能，而无需使用硬件描述语言（HDL）编写完整的硬件电路。软核的设计和配置通常通过特定的设计工具和开发环境进行，例如Xilinx的Vivado和Intel的Quartus Prime。

### 固核

在IP核（Intellectual Property Core）中，固核（Hard Core）是指通过硬件电路在芯片级别上实现的可重用功能模块。与软核不同，固核是在FPGA芯片中作为物理电路实现的，而不是通过配置FPGA资源来实现的。

固核是由FPGA芯片制造商提供的预先设计好的硬件模块，通常是针对特定的功能和性能需求进行优化的。这些功能可以包括处理器（如ARM Cortex-A系列处理器）、通信接口（如PCIe、Ethernet）、存储器控制器等。

与软核相比，固核的主要优点是性能和资源利用率。由于固核是通过硬件电路实现的，它可以提供更高的时钟频率、更低的延迟和更高的吞吐量。此外，固核通常具有更低的资源消耗，因为它们是专门为特定功能进行了优化。

使用固核可以加快设计的开发时间，因为它们已经经过验证和优化，可以直接在设计中使用，而无需从头开始设计硬件电路。此外，固核也可以提供更高的可靠性和稳定性，因为它们经过了严格的验证和测试。

然而，由于固核是特定芯片厂商提供的，因此在使用固核时，可能会受限于特定芯片平台和供应商的选择。此外，固核的配置和使用可能相对较为复杂，因为需要遵循特定的设计规范和接口要求。

固核在FPGA设计中广泛应用，尤其是在高性能和高可靠性的应用中。它们提供了一种高效的方式来实现复杂功能，并加快了设计的开发时间。

### 硬核

在IP核（Intellectual Property Core）中，硬核（Hard Core）是指在FPGA芯片中作为固定硬件电路实现的可重用功能模块。与软核和固核不同，硬核是由芯片制造商提供的，无法通过配置或修改来改变其功能或性能。

硬核通常是专用的处理器核、数字信号处理器（DSP）、存储器控制器等。这些硬核是经过芯片制造商优化和验证的，具有高性能、低功耗和可靠性。

与软核和固核相比，硬核具有以下优点：

1. **性能优化：** 硬核是通过物理电路实现的，可以提供更高的时钟频率、更低的延迟和更高的吞吐量。它们经过专门的优化，以满足特定的性能需求。
2. **资源效率：** 硬核通常具有更低的资源消耗，因为它们是专门为特定功能进行了优化。这使得设计人员能够在FPGA中实现更多的功能。
3. **可靠性和稳定性：** 硬核经过了严格的验证和测试，因此具有更高的可靠性和稳定性。它们经过芯片制造商的认证，可以在特定芯片平台上进行可靠的运行。

使用硬核可以加速设计的开发时间，因为它们不需要从头开始设计硬件电路。设计人员可以直接使用硬核，并根据特定的需求进行配置和集成。

然而，使用硬核也有一些限制。由于硬核是特定芯片制造商提供的，因此在使用硬核时，可能会受限于特定芯片平台和供应商的选择。此外，由于硬核的功能和性能是固定的，无法进行修改或扩展。

硬核在需要高性能、低功耗和可靠性的应用中广泛应用，例如高性能计算、数字信号处理、图像处理等领域。它们提供了一种高效的方式来实现复杂功能，并充分利用了FPGA芯片的硬件资源。

### IP核的优缺点

#### 优点

IP核（Intellectual Property Core）在FPGA设计中具有许多好处，这些好处包括：

加速设计开发： IP核是预先设计和验证的可重用硬件模块，可以直接在设计中使用，无需从头开始设计。这加快了设计的开发时间，减少了设计人员的工作量。

可靠性和稳定性： IP核经过了严格的验证和测试，由专业的芯片制造商或供应商提供。这增加了设计的可靠性和稳定性，并减少了设计中的错误和故障。

高性能和优化： IP核经过优化，以提供高性能和效率。它们经过专门的硬件设计和算法实现，可以在FPGA中实现复杂的功能，并提供高吞吐量、低延迟和高效能。

资源利用率： IP核可以充分利用FPGA芯片的资源，提供更大的设计灵活性。设计人员可以将IP核集成到设计中，以实现各种功能，并充分利用FPGA的逻辑资源、存储器、DSP等硬件资源。

可重用性和可移植性： IP核是独立于具体设计的可重用模块。设计人员可以在不同的项目中重复使用IP核，从而提高设计的可重用性和可移植性。此外，IP核通常具有标准化的接口和规范，使其可以在不同的设计环境和工具中使用。

专业支持和文档： IP核通常由专业的芯片制造商或供应商提供，并配有详细的文档和技术支持。这些文档包括IP核的功能说明、接口定义、使用指南等，为设计人员提供了必要的指导和支持。

综上所述，IP核在FPGA设计中提供了许多好处，包括加速开发、提高可靠性、实现高性能功能、优化资源利用、提供可重用性和可移植性，以及获得专业支持和文档等。这使得设计人员能够更高效地完成复杂的FPGA设计，并满足特定的应用需求。

#### 缺点

尽管IP核（Intellectual Property Core）在FPGA设计中具有许多好处，但也存在一些潜在的缺点，包括：

1. **有限的灵活性：** IP核的功能和性能是由提供商预先定义和优化的，因此在设计中的灵活性相对有限。无法直接修改IP核的内部实现，可能需要通过提供商的定制服务来实现特定需求，这可能增加设计的复杂性和成本。
2. **依赖供应商：** IP核是由芯片制造商或供应商提供的，因此设计人员在使用IP核时会受限于特定供应商的选择。这可能限制了设计的选择范围和可能性，并增加了对单一供应商的依赖性。
3. **知识产权问题：** 使用IP核时需要注意知识产权（IP）问题。某些IP核可能受到专利、版权或许可协议的限制，需要获得相应的授权或许可才能使用。设计人员需要仔细了解和遵守相关的知识产权规定，以避免侵权和法律风险。
4. **性能和资源限制：** 尽管IP核经过了优化，但某些应用场景可能需要更高的性能或更大的资源。在这种情况下，使用IP核可能无法满足设计的要求，可能需要自行设计硬件电路来实现更高的性能和资源利用率。
5. **成本：** 高性能、高级别的IP核通常会具有较高的价格。特别是对于复杂的IP核或需要专门定制的IP核，可能需要支付额外的费用。这可能增加设计的成本和预算压力。
6. **版本兼容性和支持：** IP核的不同版本之间可能存在兼容性问题。当需要升级或迁移设计时，可能需要调整和验证IP核的接口和功能。此外，对于某些IP核，供应商的支持可能有限，可能无法及时解决问题或提供更新和改进。

综上所述，尽管IP核在FPGA设计中具有许多优点，但也需要考虑其潜在的缺点，包括有限的灵活性、供应商依赖性、知识产权问题、性能和资源限制、成本以及版本兼容性和支持等方面的考虑。设计人员在选择和使用IP核时需要综合考虑这些因素，并根据具体的设计需求做出权衡和决策

# PLL

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

# ROM

## ROM介绍

ROM（只读存储器）IP 核。ROM 是一种存储器，其中的数据在设计时就被固定下来，而在运行时无法被修改。ROM IP 核可以用于存储程序代码、初始化数据等。

Xilinx 推出的ROM IP 核分为俩种类型，单端口ROM和双端口ROM，对于单端口ROM只提供一个读地址端口，一个写地址端口；

双端口ROM 可以表示为俩个单端口的叠加。

以下是  ROM IP 核的一些特点和用途：

1. **可定制的存储容量和位宽**：您可以根据您的需求定制 ROM 的大小和位宽，以适应您的具体应用场景。
2. **初始化数据**：您可以在设计时将数据加载到 ROM 中，这些数据在运行时是只读的。
3. **高度可靠的存储**：ROM 的数据是在设计时写入的，因此是静态的，不会在运行时丢失或更改。
4. **快速访问**：由于数据是在 ROM 中存储的，因此可以实现快速的读取操作。
5. **可与其他 IP 核集成**：ROM 可以与其他 IP 核（如处理器、控制器等）一起使用，以构建更复杂的系统。
6. **支持不同的接口协议**：ROM IP 核可以支持不同的接口协议，如 AXI、Avalon 等，以便与其他模块进行通信。
7. **可视化配置界面**：Vivado 提供了一个用户友好的图形界面，可以用于配置和定制 ROM IP 核的属性和特性。
8. **仿真和验证支持**：您可以在 Vivado 中对包含 ROM IP 核的设计进行仿真和验证，以确保其在实际硬件中正常工作。

## ROM 初始化文件

ROM 初始化文件是一个包含在只读存储器（ROM）中的预先定义数据的文件。

这些文件的格式为coe文件，coe文件是vivado规定的一种文件格式。

这些数据在设计时被写入到 ROM 中，并在运行时保持不变。ROM 初始化文件的目的是为了在硬件设计中提供一个静态的、不可变的数据源。

以下是一些关于ROM初始化文件的重要信息：

1. **数据格式**：ROM初始化文件可以采用多种格式，如二进制、十六进制、文本等。具体的格式取决于您所使用的设计工具和ROM IP核的要求。
2. **数据内容**：这个文件包含了您想要预加载到ROM中的实际数据。这可以是任何您需要在运行时读取的信息，比如程序代码、初始化数据等。
3. **文件类型**：通常情况下，ROM初始化文件是一个单独的文件，但在某些设计工具中，您也可以将初始化数据直接嵌入到设计工程中。
4. **地址映射**：ROM初始化文件中的数据需要按照正确的地址映射到ROM的相应位置。这通常由设计工具或ROM IP核的配置参数来控制。
5. **仿真和验证**：在设计过程中，您可以在仿真环境中使用ROM初始化文件，以确保在实际硬件中正确加载数据。
6. **版本控制**：与其他代码和资源一样，最好对ROM初始化文件进行版本控制，以确保您始终可以访问先前的版本，并追溯到特定设计的状态。
7. **文档和注释**：建议在ROM初始化文件中添加必要的注释和文档，以便其他团队成员或将来的开发者能够理解其中包含的数据的含义和用途。

```verilog
MEMORY_INITIALIZATION_RADIX=16;			//表示数据格式为16进制
MEMORY_INITIALIZATION_VECTOR=
12,
34,
56,
78,
AB,
CD,
EF,
11,
22;
```

## 在vivado创建ROM核

## ROM代码仿真

### 顶层文件

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 19:10:03
// Design Name: 
// Module Name: rom
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


module rom(
    input wire clk,
    input wire [7:0]    addra,

    output wire [7:0]   douta
    );

    rom_256x8 rom_256x8_inst(
        .clka (clk),
        .addra (addra),
        .douta (douta)
    );
endmodule

```

### 测试文件

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 19:15:23
// Design Name: 
// Module Name: tb_rom
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


module tb_rom();

    reg clk;
    reg rst;
    reg [7:0] addra;
    wire [7:0] douta;

    initial begin
        clk = 1'b0;
        rst <= 1'b1;
        #10
        rst <= 1'b0;
    end

    always #5 clk <= ~clk;

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            addra <= 8'b0;
        else if(addra == 8'd255)
            addra <= 8'b0;
        else 
            addra <= addra + 1'b1;
        
    end

    rom rom_inst(
        .clk(clk),
        .addra(addra),
        .douta(douta)
    );

endmodule

```



# RAM

## 介绍

​		RAM IP 核是一种可重用的预先设计好的模块，用于实现随机访问存储器（Random Access Memory, RAM）功能。RAM 是一种可以在运行时进行读写操作的存储器，与只读存储器（ROM）相对应。RAM IP 核可以用于存储临时数据、缓存等。

​		RAM 是随机存取存储器(Random Access Memory)的简称，是一个易失性存储器。 RAM 工作时可以随时从任何一个指定的地址写入或读出数据，同时我们还能修改其存储的 数据，即写入新的数据，这是 ROM 所并不具备的功能。在 FPGA 中这也是其与 ROM 的最 大区别。ROM 是只读存储器，而 RAM 是可写可读存储器，在我们 FPGA 中使用这两个存 储器主要也是要区分这一点，因为这两个存储器使用的都是我们 FPGA 内部的 RAM 资 源，不同的是 ROM 是只用到了 RAM 资源的读数据端口。
Xilinx 推出的 RAM IP 核分为两种类型:单端口 RAM 和双端口 RAM。其中双端口 RAM 又分为简单双端口 RAM 和真正双端口 RAM。对于单端口 RAM，读写操作共用一组 地址线，读写操作不能同时进行;对于简单双端口 RAM，读操作和写操作有专用地址端口 (一个读端口和一个写端口)，即写端口只能写不能读，而读端口只能读不能写;对于真 正双端口 RAM，有两个地址端口用于读写操作(两个读/写端口)，即两个端口都可以进 行读写。

以下是 RAM IP 核的一些特点和用途：

1. **可定制的存储容量和位宽**：您可以根据需要定制 RAM 的大小和位宽，以满足特定应用的需求。
2. **读写访问**：RAM 允许在运行时进行读取和写入操作，使其适用于存储临时数据。
3. **初始化数据**：您可以在设计时将初始数据加载到 RAM 中，也可以在运行时动态地更新数据。
4. **高度可靠的存储**：RAM 中的数据在运行时可以被修改，但与其他存储器相比，RAM 的数据不会在断电或重启时丢失。
5. **快速访问**：由于数据是在 RAM 中存储的，可以实现快速的读写操作。
6. **支持不同的接口协议**：RAM IP 核可以支持不同的接口协议，如 AXI、Avalon 等，以便与其他模块进行通信。
7. **可与其他 IP 核集成**：RAM 可以与其他 IP 核（如处理器、控制器等）一起使用，以构建更复杂的系统。
8. **仿真和验证支持**：您可以在 Vivado 中对包含 RAM IP 核的设计进行仿真和验证，以确保其在实际硬件中正常工作。

## RAM IP 配置

## RAM IP 核的调用

### 顶层代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 20:27:49
// Design Name: 
// Module Name: ram
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


module ram(
    input wire          clk,
    input wire [7:0]    addra,      //输入ram读写地址
    input wire [7:0]    dina,       //输入ram写入地址
    input wire          wea,        //输入ram写使能
    output wire [7:0]   douta       //输出读ram数据
    );

    ram_256x8 ram_256x8_inst(
        .clka(clk),
        .addra(addra),
        .dina(dina),
        .wea(wea),
        .douta(douta)
    );
endmodule

```

### 仿真代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 20:55:41
// Design Name: 
// Module Name: tb_ram
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


module tb_ram();
    reg         clk ;
    reg         rst ;
    reg [7:0]   addra;
    reg         wea;
    reg         wr_flag;

    wire [7:0]  dina;
    wire [7:0]  douta;

    initial begin
        clk = 1'b0;
        rst <= 1'b1;
        #200
        rst <= 1'b0;
    end

    always #5 clk = ~clk;

//标志信号
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            wr_flag <= 1'b0;
        else if(addra == 8'd255)
            wr_flag <= 1'b1;
        else 
            wr_flag <= wr_flag;
    end

//产生写使能信号
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            wea <= 1'b0;
        else if(wr_flag == 1'b1)
            wea <= 1'b0;
        else 
            wea <= 1'b1;
    end

    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            addra <= 8'd0;
        else if(addra == 8'd255)
            addra <= 8'd0;
        else 
            addra <= addra + 1'b1; 
    end

    assign dina = (wea == 1'b1) ? addra : 8'd0;



    ram ram_inst(
        .clk (clk),
        .addra (addra),
        .dina(dina),
        .wea(wea),
        .douta(douta)
    );

endmodule

```



# FIFO

FIFO(First In First Out，即先入先出)，是一种数据缓冲器，用来实现数据先入先出 的读写方式。与 ROM 或 RAM 的按地址读写方式不同，FIFO 的读写遵循“先进先出”的 原则，即数据按顺序写入 FIFO，先被写入的数据同样在读取的时候先被读出，所以 FIFO 存储器没有地址线。FIFO 有一个写端口和一个读端口外部无需使用者控制地址，使用方 便。

FIFO 存储器主要是作为缓存，应用在同步时钟系统和异步时钟系统中，在很多的设计 中都会使用，后面实例中如:多比特数据做跨时钟域的转换、前后带宽不同步等都用到了 FIFO。FIFO 根据读写时钟是否相同，分为 SCFIFO(同步 FIFO)和 DCFIFO(异步 FIFO)，SCFIFO 的读写为同一时钟，应用在同步时钟系统中;DCFIFO 的读写时钟不 同，应用在异步时钟系统中。

1. 功能性：FIFO存储器的设计目的是按照数据接收的顺序存储和检索数据，遵循“先进先出”的原则。最先进入FIFO的数据将首先被读取出来。这种行为使其适用于需要按照到达顺序处理数据的应用场景。
2. 缓冲功能：FIFO充当数据的缓冲区或临时存储区。当数据的产生（写入）和消费（读取）速率不匹配时，它可以临时存储数据。这种缓冲功能可以平衡数据流的不同速率，确保数据传输的可靠性。
3. 无需地址控制：与其他存储器（如ROM或RAM）不同，FIFO存储器不需要使用地址线进行读写操作。它使用写端口和读端口进行数据的写入和读取，无需外部用户控制地址，从而简化了接口设计。
4. 应用领域：FIFO广泛应用于数字系统设计中的各种场景。它在跨时钟域数据传输、数据流控制、数据缓冲和调度等方面发挥重要作用。例如，在通信系统中，FIFO用于临时存储传入或传出的数据，确保数据按照正确的顺序传输。
5. 同步与异步FIFO：根据读写操作的时钟信号是否相同，FIFO可以分为同步FIFO和异步FIFO。同步FIFO的读写操作在相同的时钟信号下进行，适用于同步系统。异步FIFO的读写操作使用不同的时钟信号，适用于异步系统。

## 顶层代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/21 19:31:32
// Design Name: 
// Module Name: scfifo
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


module scfifo(

    input wire          clk,
    input wire          rst,
    input wire [7:0]    pi_data,        //输入顶层模块的数据，输入FIFO的数据
    input wire          pi_flag,        //输入数据有效标志信号,也是写请求信号
    inout wire          rd_en,          //FIFO读请求信号
    
    output wire [7:0]   po_data,        //FIFO读出的数据
    output wire         empty,          //FIFO空标志信号，高有效；
    output wire         full,           //FIFO满标志信号，高有效；
    output wire [7:0]   data_count      //FIFO存在的个数
    );

    scfifo_256x8 scfifo_256x8_inst(
        .clk(clk),
        .srst(rst),
        .din(pi_data),
        .wr_en(pi_flag),
        .rd_en(rd_en),
        
        .dout(po_data),
        .full(full),
        .empty(empty),
        .data_count(data_count)
    );
endmodule

```



## 测试代码

```verilog
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/21 20:18:11
// Design Name: 
// Module Name: tb_scfifo
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


module tb_scfifo();

    reg          clk;
    reg          rst;
    reg [7:0]    pi_data;        //输入顶层模块的数据，输入FIFO的数据
    reg          pi_flag;        //输入数据有效标志信号,也是写请求信号
    reg          rd_en;          //FIFO读请求信号
    
    wire [7:0]   po_data;        //FIFO读出的数据
    wire         empty;          //FIFO空标志信号，高有效；
    wire         full;           //FIFO满标志信号，高有效；
    wire [7:0]   data_count;      //FIFO存在的个数

    reg [1:0]   cnt_baud;

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #20
        rst = 1'b0;
    end

    always #5 clk = ~clk;

    //计数4
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            cnt_baud <= 2'b00;
        else if(cnt_baud == 2'b10)
            cnt_baud <= 2'b00;
        else
            cnt_baud <= cnt_baud + 1'b1;
    end

    //输入数据有效标志信号,也是写请求信号
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_flag <= 1'b0;
        else if(cnt_baud == 2'b01)
            pi_flag <= 1'b1;
        else
            pi_flag <= 1'b0;
    end

    //输入顶层模块的数据，输入FIFO的数据
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            pi_data <= 8'b0;
        else if((pi_data == 8'd255) && (pi_flag == 1'b1))
            pi_data <= 8'b0;
        else if(pi_flag == 1'b1)
            pi_data <= pi_data + 1'b1;
    end

    //FIFO读请求信号
    always @(posedge clk or posedge rst) begin
        if(rst == 1'b1)
            rd_en <= 1'b0;
        else if(full == 1'b1)
            rd_en <= 1'b1;
        else if(empty == 1'b1)
            rd_en <= 1'b0;
    end

    scfifo scfifo_inst(
        .clk        (clk),
        .rst        (rst),
        .pi_data    (pi_data),
        .pi_flag    (pi_flag),
        .rd_en      (rd_en),
        .po_data    (po_data),
        .full       (full),
        .empty      (empty),
        .data_count (data_count)
    );
endmodule

```
















