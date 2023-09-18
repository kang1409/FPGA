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
