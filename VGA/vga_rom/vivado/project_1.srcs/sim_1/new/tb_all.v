`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 22:50:24
// Design Name: 
// Module Name: tb_all
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


module tb_all();

    reg clk;
    reg rst;

    wire [11:0] rgb;
    wire        hsync;
    wire        vsync ;

    initial begin
        clk     =   1'b1;
        rst     <=  1'b1;
        #200
        rst     <=  1'b0;
    end

    always #5 clk <= ~clk;

    wire rom_en         = vga_pic.rom_en;
    wire [14:0]addra    = vga_pic.addra;
    wire [11:0] douta   = vga_pic.douta;

    
    wire        clk_108 = vga_rom.clk_108;
    wire        rst_n   = vga_rom.rst_n;
    wire        locked  = vga_rom.locked;

    vga_rom vga_rom_inst(
        .clk(clk),
        .rst(rst),
        .rgb(rgb),
        .hsync(hsync),
        .vsync(vsync)
    );

endmodule
