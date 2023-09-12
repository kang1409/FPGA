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
