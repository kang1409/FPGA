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