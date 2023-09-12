// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Sep  8 17:08:16 2023
// Host        : LAPTOP-03UPN56G running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               F:/project/fsm/vivado/simplex_fsm/simplex_fsm.sim/sim_1/synth/func/modelsim/tb_simplex_fsm_func_synth.v
// Design      : simplex_fsm
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* HALF = "7'b0000010" *) (* NULL = "7'b0000001" *) (* ONE = "7'b0000100" *) 
(* ONE_HALF = "7'b0001000" *) (* THREE = "7'b1000000" *) (* TWO = "7'b0010000" *) 
(* TWO_HALF = "7'b0100000" *) 
(* NotValidForBitStream *)
module simplex_fsm
   (sys_clk,
    sys_rst_n,
    pi_money_one,
    pi_money_half,
    po_cola,
    po_money);
  input sys_clk;
  input sys_rst_n;
  input pi_money_one;
  input pi_money_half;
  output po_cola;
  output po_money;

  wire [6:0]p_0_in;
  wire pi_money_one;
  wire pi_money_one_IBUF;
  wire po_cola;
  wire po_cola_OBUF;
  wire po_cola_i_1_n_0;
  wire po_money;
  wire po_money_OBUF;
  wire po_money_i_1_n_0;
  wire [6:0]stage;
  wire \stage[2]_i_1_n_0 ;
  wire \stage[4]_i_1_n_0 ;
  wire \stage[6]_i_2_n_0 ;
  wire sys_clk;
  wire sys_clk_IBUF;
  wire sys_clk_IBUF_BUFG;
  wire sys_rst_n;
  wire sys_rst_n_IBUF;

  IBUF pi_money_one_IBUF_inst
       (.I(pi_money_one),
        .O(pi_money_one_IBUF));
  OBUF po_cola_OBUF_inst
       (.I(po_cola_OBUF),
        .O(po_cola));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    po_cola_i_1
       (.I0(stage[0]),
        .I1(stage[4]),
        .I2(stage[6]),
        .I3(stage[2]),
        .O(po_cola_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    po_cola_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\stage[6]_i_2_n_0 ),
        .D(po_cola_i_1_n_0),
        .Q(po_cola_OBUF));
  OBUF po_money_OBUF_inst
       (.I(po_money_OBUF),
        .O(po_money));
  LUT4 #(
    .INIT(16'h0002)) 
    po_money_i_1
       (.I0(stage[6]),
        .I1(stage[0]),
        .I2(stage[2]),
        .I3(stage[4]),
        .O(po_money_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    po_money_reg
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\stage[6]_i_2_n_0 ),
        .D(po_money_i_1_n_0),
        .Q(po_money_OBUF));
  LUT5 #(
    .INIT(32'hFEFFEBEB)) 
    \stage[0]_i_1 
       (.I0(stage[6]),
        .I1(stage[2]),
        .I2(stage[4]),
        .I3(pi_money_one_IBUF),
        .I4(stage[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000024)) 
    \stage[2]_i_1 
       (.I0(pi_money_one_IBUF),
        .I1(stage[2]),
        .I2(stage[0]),
        .I3(stage[4]),
        .I4(stage[6]),
        .O(\stage[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000024)) 
    \stage[4]_i_1 
       (.I0(pi_money_one_IBUF),
        .I1(stage[4]),
        .I2(stage[2]),
        .I3(stage[0]),
        .I4(stage[6]),
        .O(\stage[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \stage[6]_i_1 
       (.I0(stage[0]),
        .I1(stage[6]),
        .I2(pi_money_one_IBUF),
        .I3(stage[4]),
        .I4(stage[2]),
        .O(p_0_in[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \stage[6]_i_2 
       (.I0(sys_rst_n_IBUF),
        .O(\stage[6]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "NULL:0000001,HALF:0000010,ONE:0000100,ONE_HALF:0001000,iSTATE:0100000,TWO:0010000,iSTATE0:1000000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \stage_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[0]),
        .PRE(\stage[6]_i_2_n_0 ),
        .Q(stage[0]));
  (* FSM_ENCODED_STATES = "NULL:0000001,HALF:0000010,ONE:0000100,ONE_HALF:0001000,iSTATE:0100000,TWO:0010000,iSTATE0:1000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \stage_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\stage[6]_i_2_n_0 ),
        .D(\stage[2]_i_1_n_0 ),
        .Q(stage[2]));
  (* FSM_ENCODED_STATES = "NULL:0000001,HALF:0000010,ONE:0000100,ONE_HALF:0001000,iSTATE:0100000,TWO:0010000,iSTATE0:1000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \stage_reg[4] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\stage[6]_i_2_n_0 ),
        .D(\stage[4]_i_1_n_0 ),
        .Q(stage[4]));
  (* FSM_ENCODED_STATES = "NULL:0000001,HALF:0000010,ONE:0000100,ONE_HALF:0001000,iSTATE:0100000,TWO:0010000,iSTATE0:1000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \stage_reg[6] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\stage[6]_i_2_n_0 ),
        .D(p_0_in[6]),
        .Q(stage[6]));
  BUFG sys_clk_IBUF_BUFG_inst
       (.I(sys_clk_IBUF),
        .O(sys_clk_IBUF_BUFG));
  IBUF sys_clk_IBUF_inst
       (.I(sys_clk),
        .O(sys_clk_IBUF));
  IBUF sys_rst_n_IBUF_inst
       (.I(sys_rst_n),
        .O(sys_rst_n_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
