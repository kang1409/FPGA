# IP ROM

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

