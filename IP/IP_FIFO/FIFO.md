# IP_FIFO

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

