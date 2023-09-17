`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/16 19:24:47
// Design Name: 
// Module Name: tb_seg_dynamic
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


module tb_seg_dynamic();

    reg            sys_clk;
    reg            sys_rst;

    wire            led;
    wire    [7:0]   sel;
    wire    [7:0]   seg0_3;
    wire    [7:0]   seg4_7;

    initial begin
        sys_clk = 1'b0;
        sys_rst <= 1'b0;
        #20
        sys_rst <= 1'b1;
        #20
        sys_rst <= 1'b0; 
    end

    always #5 sys_clk = ~sys_clk;

    wire cnt_ms = seg_dynamic_inst.cnt_ms;

    seg_dynatic#(
        .CNT_MAX_MS(10'd1_000),
        .CNT_MAX_S(26'd49_999_999 )
    )
      seg_dynamic_inst(
        .sys_clk(sys_clk),
        .sys_rst(sys_rst),

        .led(led),        
        .sel(sel),
        .seg0_3 (seg0_3),
        .seg4_7 (seg4_7)
    );
endmodule
