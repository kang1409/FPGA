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