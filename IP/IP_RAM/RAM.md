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







