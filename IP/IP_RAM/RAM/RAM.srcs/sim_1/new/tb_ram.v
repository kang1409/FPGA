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
