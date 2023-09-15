# 状态机

## 理论基础

​		**状态机（FSM）也称同步有限状态机**，“同步”是指状态机中的所有状态跳转都是在时钟的作用下进行的。

​																		“有限”是指状态机中的状态是有限的。状态机更据输出的原因分为俩种：

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
