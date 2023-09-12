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
