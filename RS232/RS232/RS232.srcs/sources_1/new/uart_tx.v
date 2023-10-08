`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/06 19:32:33
// Design Name: 
// Module Name: uart_tx
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


module uart_tx
#(
    parameter  UART_BPS = 14'd9600,
    parameter  CLK      = 27'd100_000_000
)(
    input wire          clk,
    input wire          rst,
    input wire [7:0]    pi_data,
    input wire          pi_data_flag,

    output reg          tx
    );
    localparam  CNT_MAX = CLK / UART_BPS;

    reg [13:0]      cnt;
    reg [3:0]       bit_cnt;


    reg             work_en;

    //工作使能
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            work_en <= 1'b0;
        else if(pi_data_flag == 1'b1)
            work_en <= 1'b1;
        else if((bit_cnt == 4'd9) && (cnt == CNT_MAX - 2'd2))
            work_en <= 1'b0;
        else 
            work_en <= work_en;
    end

    //计数器
    always @(negedge clk or posedge rst ) begin
        if(rst == 1'b1)
            cnt <= 1'b0;
        else if(cnt == CNT_MAX - 1'b1)
            cnt <= 1'b0;
        else if(work_en == 1'b1)
            cnt <= cnt + 1'b1;
        else
            cnt <= 1'b0;
    end

    //bit_cnt 计数器
    always @(negedge clk or posedge rst ) begin
        if (rst == 1'b1)
            bit_cnt <= 1'b0;
        else if(cnt == CNT_MAX - 1'b1)
            bit_cnt = bit_cnt + 1'b1;
        else if(work_en == 1'b0)
            bit_cnt <= 1'b0;
    end

    always @(posedge rst or negedge clk) begin
        if(rst == 1'b1)
            tx <= 1'b1;
        else if(work_en == 1'b1)
            case (bit_cnt)
                0:tx <= 1'b0;
                1:tx <= pi_data[0] ;
                2:tx <= pi_data[1] ;
                3:tx <= pi_data[2] ;
                4:tx <= pi_data[3] ;
                5:tx <= pi_data[4] ;
                6:tx <= pi_data[5] ;
                7:tx <= pi_data[6] ;
                8:tx <= pi_data[7] ;
                9:tx <= 1'b1 ;
                default: tx <= 1'b1;
            endcase
        else 
            tx <= 1'b1;
    end
    
endmodule
