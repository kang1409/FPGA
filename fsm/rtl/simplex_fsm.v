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
