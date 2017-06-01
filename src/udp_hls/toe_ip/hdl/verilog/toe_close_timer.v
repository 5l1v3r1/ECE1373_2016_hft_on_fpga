// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_close_timer (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng2timer_setCloseTimer_V_V_dout,
        rxEng2timer_setCloseTimer_V_V_empty_n,
        rxEng2timer_setCloseTimer_V_V_read,
        closeTimer2stateTable_releaseS_din,
        closeTimer2stateTable_releaseS_full_n,
        closeTimer2stateTable_releaseS_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_pp0_stg0_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv33_1000DBF24 = 33'b100000000000011011011111100100100;
parameter    ap_const_lv33_0 = 33'b000000000000000000000000000000000;
parameter    ap_const_lv16_2710 = 16'b10011100010000;
parameter    ap_const_lv16_1 = 16'b1;
parameter    ap_const_lv16_FFFF = 16'b1111111111111111;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] rxEng2timer_setCloseTimer_V_V_dout;
input   rxEng2timer_setCloseTimer_V_V_empty_n;
output   rxEng2timer_setCloseTimer_V_V_read;
output  [15:0] closeTimer2stateTable_releaseS_din;
input   closeTimer2stateTable_releaseS_full_n;
output   closeTimer2stateTable_releaseS_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng2timer_setCloseTimer_V_V_read;
reg closeTimer2stateTable_releaseS_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm = 1'b1;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_0;
reg    ap_sig_bdd_20;
wire    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
reg    ap_reg_ppiten_pp0_it2 = 1'b0;
wire   [0:0] tmp_nbreadreq_fu_70_p3;
reg    ap_sig_bdd_55;
reg   [0:0] ct_waitForWrite_load_reg_248;
reg   [0:0] ap_reg_ppstg_ct_waitForWrite_load_reg_248_pp0_it1;
reg   [0:0] tmp_reg_252;
reg   [0:0] ap_reg_ppstg_tmp_reg_252_pp0_it1;
reg   [0:0] tmp_503_reg_271;
reg   [0:0] tmp_185_reg_275;
reg    ap_sig_bdd_79;
reg   [0:0] ct_waitForWrite = 1'b0;
reg   [15:0] ct_setSessionID_V = 16'b0000000000000000;
reg   [15:0] ct_prevSessionID_V = 16'b0000000000000000;
reg   [13:0] closeTimerTable_address0;
reg    closeTimerTable_ce0;
reg    closeTimerTable_we0;
wire   [32:0] closeTimerTable_d0;
wire   [32:0] closeTimerTable_q0;
wire   [13:0] closeTimerTable_address1;
reg    closeTimerTable_ce1;
reg    closeTimerTable_we1;
reg   [32:0] closeTimerTable_d1;
reg   [15:0] ct_currSessionID_V = 16'b0000000000000000;
reg   [15:0] tmp_V_21_reg_256;
reg   [15:0] ap_reg_ppstg_tmp_V_21_reg_256_pp0_it1;
reg   [13:0] closeTimerTable_addr_1_reg_261;
wire   [0:0] tmp_s_fu_182_p2;
wire   [0:0] tmp_503_fu_211_p3;
wire   [0:0] tmp_185_fu_223_p2;
wire   [63:0] tmp_183_fu_139_p1;
wire   [63:0] tmp_182_fu_188_p1;
wire   [15:0] tmp_184_fu_199_p2;
wire   [15:0] storemerge_fu_156_p3;
wire   [32:0] closeTimerTable_time_V_addr_s_fu_235_p5;
wire   [0:0] tmp_187_fu_144_p2;
wire   [15:0] tmp_188_fu_150_p2;
wire   [31:0] tmp_504_fu_219_p1;
wire   [31:0] tmp_186_fu_229_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_pprstidle_pp0;
reg    ap_sig_bdd_112;
reg    ap_sig_bdd_139;
reg    ap_sig_bdd_38;
reg    ap_sig_bdd_251;
reg    ap_sig_bdd_86;
reg    ap_sig_bdd_50;


toe_probe_timer_probeTimerTable #(
    .DataWidth( 33 ),
    .AddressRange( 10000 ),
    .AddressWidth( 14 ))
closeTimerTable_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .address0( closeTimerTable_address0 ),
    .ce0( closeTimerTable_ce0 ),
    .we0( closeTimerTable_we0 ),
    .d0( closeTimerTable_d0 ),
    .q0( closeTimerTable_q0 ),
    .address1( closeTimerTable_address1 ),
    .ce1( closeTimerTable_ce1 ),
    .we1( closeTimerTable_we1 ),
    .d1( closeTimerTable_d1 )
);



/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_pp0_stg0_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_done_reg assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_done_reg
    if (ap_rst == 1'b1) begin
        ap_done_reg <= ap_const_logic_0;
    end else begin
        if ((ap_const_logic_1 == ap_continue)) begin
            ap_done_reg <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
            ap_done_reg <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it1 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
            ap_reg_ppiten_pp0_it1 <= ap_reg_ppiten_pp0_it0;
        end
    end
end

/// ap_reg_ppiten_pp0_it2 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it2
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
    end else begin
        if (~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
            ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_86) begin
        if (~(ct_waitForWrite == ap_const_lv1_0)) begin
            ct_prevSessionID_V <= tmp_184_fu_199_p2;
        end else if (ap_sig_bdd_112) begin
            ct_prevSessionID_V <= ct_currSessionID_V;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_86) begin
        if (ap_sig_bdd_139) begin
            ct_waitForWrite <= ap_const_lv1_0;
        end else if (ap_sig_bdd_50) begin
            ct_waitForWrite <= ap_const_lv1_1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ap_reg_ppstg_ct_waitForWrite_load_reg_248_pp0_it1 <= ct_waitForWrite_load_reg_248;
        ap_reg_ppstg_tmp_V_21_reg_256_pp0_it1 <= tmp_V_21_reg_256;
        ap_reg_ppstg_tmp_reg_252_pp0_it1 <= tmp_reg_252;
        ct_waitForWrite_load_reg_248 <= ct_waitForWrite;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ct_waitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        closeTimerTable_addr_1_reg_261 <= tmp_183_fu_139_p1;
        tmp_V_21_reg_256 <= ct_currSessionID_V;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (ct_waitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ct_currSessionID_V <= storemerge_fu_156_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (ct_waitForWrite == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ct_setSessionID_V <= rxEng2timer_setCloseTimer_V_V_dout;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == ct_waitForWrite_load_reg_248) & (ap_const_lv1_0 == tmp_reg_252) & ~(ap_const_lv1_0 == tmp_503_fu_211_p3))) begin
        tmp_185_reg_275 <= tmp_185_fu_223_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == ct_waitForWrite_load_reg_248) & (ap_const_lv1_0 == tmp_reg_252))) begin
        tmp_503_reg_271 <= closeTimerTable_q0[ap_const_lv32_20];
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ct_waitForWrite == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        tmp_reg_252 <= tmp_nbreadreq_fu_70_p3;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ap_sig_bdd_79)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_reg_ppiten_pp0_it2)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it2))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ap_sig_bdd_79)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_0 assign process. ///
always @ (ap_sig_bdd_20)
begin
    if (ap_sig_bdd_20) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_pprstidle_pp0 assign process. ///
always @ (ap_start or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1) & (ap_const_logic_0 == ap_start))) begin
        ap_sig_pprstidle_pp0 = ap_const_logic_1;
    end else begin
        ap_sig_pprstidle_pp0 = ap_const_logic_0;
    end
end

/// closeTimer2stateTable_releaseS_write assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ap_reg_ppstg_ct_waitForWrite_load_reg_248_pp0_it1 or ap_reg_ppstg_tmp_reg_252_pp0_it1 or tmp_503_reg_271 or tmp_185_reg_275 or ap_sig_bdd_79)
begin
    if (((ap_const_lv1_0 == ap_reg_ppstg_ct_waitForWrite_load_reg_248_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_reg_252_pp0_it1) & ~(ap_const_lv1_0 == tmp_503_reg_271) & ~(ap_const_lv1_0 == tmp_185_reg_275) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        closeTimer2stateTable_releaseS_write = ap_const_logic_1;
    end else begin
        closeTimer2stateTable_releaseS_write = ap_const_logic_0;
    end
end

/// closeTimerTable_address0 assign process. ///
always @ (tmp_183_fu_139_p1 or tmp_182_fu_188_p1 or ap_sig_bdd_112 or ap_sig_bdd_139 or ap_sig_bdd_38)
begin
    if (ap_sig_bdd_38) begin
        if (ap_sig_bdd_139) begin
            closeTimerTable_address0 = tmp_182_fu_188_p1;
        end else if (ap_sig_bdd_112) begin
            closeTimerTable_address0 = tmp_183_fu_139_p1;
        end else begin
            closeTimerTable_address0 = 'bx;
        end
    end else begin
        closeTimerTable_address0 = 'bx;
    end
end

/// closeTimerTable_ce0 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or tmp_nbreadreq_fu_70_p3 or ap_sig_bdd_55 or ap_sig_bdd_79 or ct_waitForWrite or tmp_s_fu_182_p2)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ct_waitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_s_fu_182_p2)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (ct_waitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))))) begin
        closeTimerTable_ce0 = ap_const_logic_1;
    end else begin
        closeTimerTable_ce0 = ap_const_logic_0;
    end
end

/// closeTimerTable_ce1 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ct_waitForWrite_load_reg_248 or tmp_reg_252 or ap_sig_bdd_79 or tmp_503_fu_211_p3 or tmp_185_fu_223_p2)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == ct_waitForWrite_load_reg_248) & (ap_const_lv1_0 == tmp_reg_252) & ~(ap_const_lv1_0 == tmp_503_fu_211_p3) & (ap_const_lv1_0 == tmp_185_fu_223_p2)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == ct_waitForWrite_load_reg_248) & (ap_const_lv1_0 == tmp_reg_252) & ~(ap_const_lv1_0 == tmp_503_fu_211_p3) & ~(ap_const_lv1_0 == tmp_185_fu_223_p2)))) begin
        closeTimerTable_ce1 = ap_const_logic_1;
    end else begin
        closeTimerTable_ce1 = ap_const_logic_0;
    end
end

/// closeTimerTable_d1 assign process. ///
always @ (tmp_185_fu_223_p2 or closeTimerTable_time_V_addr_s_fu_235_p5 or ap_sig_bdd_251)
begin
    if (ap_sig_bdd_251) begin
        if (~(ap_const_lv1_0 == tmp_185_fu_223_p2)) begin
            closeTimerTable_d1 = ap_const_lv33_0;
        end else if ((ap_const_lv1_0 == tmp_185_fu_223_p2)) begin
            closeTimerTable_d1 = closeTimerTable_time_V_addr_s_fu_235_p5;
        end else begin
            closeTimerTable_d1 = 'bx;
        end
    end else begin
        closeTimerTable_d1 = 'bx;
    end
end

/// closeTimerTable_we0 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ap_sig_bdd_79 or ct_waitForWrite or tmp_s_fu_182_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ct_waitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_s_fu_182_p2))) begin
        closeTimerTable_we0 = ap_const_logic_1;
    end else begin
        closeTimerTable_we0 = ap_const_logic_0;
    end
end

/// closeTimerTable_we1 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ct_waitForWrite_load_reg_248 or tmp_reg_252 or ap_sig_bdd_79 or tmp_503_fu_211_p3 or tmp_185_fu_223_p2)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == ct_waitForWrite_load_reg_248) & (ap_const_lv1_0 == tmp_reg_252) & ~(ap_const_lv1_0 == tmp_503_fu_211_p3) & (ap_const_lv1_0 == tmp_185_fu_223_p2)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == ct_waitForWrite_load_reg_248) & (ap_const_lv1_0 == tmp_reg_252) & ~(ap_const_lv1_0 == tmp_503_fu_211_p3) & ~(ap_const_lv1_0 == tmp_185_fu_223_p2)))) begin
        closeTimerTable_we1 = ap_const_logic_1;
    end else begin
        closeTimerTable_we1 = ap_const_logic_0;
    end
end

/// rxEng2timer_setCloseTimer_V_V_read assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or tmp_nbreadreq_fu_70_p3 or ap_sig_bdd_55 or ap_sig_bdd_79 or ct_waitForWrite)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (ct_waitForWrite == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        rxEng2timer_setCloseTimer_V_V_read = ap_const_logic_1;
    end else begin
        rxEng2timer_setCloseTimer_V_V_read = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_done_reg or ap_CS_fsm or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ap_sig_bdd_79 or ap_sig_pprstidle_pp0)
begin
    case (ap_CS_fsm)
        ap_ST_pp0_stg0_fsm_0 : 
        begin
            ap_NS_fsm = ap_ST_pp0_stg0_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_reg_ppiten_pp0_it0 = ap_start;

/// ap_sig_bdd_112 assign process. ///
always @ (tmp_nbreadreq_fu_70_p3 or ct_waitForWrite)
begin
    ap_sig_bdd_112 = ((ct_waitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3));
end

/// ap_sig_bdd_139 assign process. ///
always @ (ct_waitForWrite or tmp_s_fu_182_p2)
begin
    ap_sig_bdd_139 = (~(ct_waitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_s_fu_182_p2));
end

/// ap_sig_bdd_20 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_20 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_251 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or ct_waitForWrite_load_reg_248 or tmp_reg_252 or tmp_503_fu_211_p3)
begin
    ap_sig_bdd_251 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & (ap_const_lv1_0 == ct_waitForWrite_load_reg_248) & (ap_const_lv1_0 == tmp_reg_252) & ~(ap_const_lv1_0 == tmp_503_fu_211_p3));
end

/// ap_sig_bdd_38 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0)
begin
    ap_sig_bdd_38 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0));
end

/// ap_sig_bdd_50 assign process. ///
always @ (tmp_nbreadreq_fu_70_p3 or ct_waitForWrite)
begin
    ap_sig_bdd_50 = ((ct_waitForWrite == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3));
end

/// ap_sig_bdd_55 assign process. ///
always @ (ap_start or ap_done_reg or rxEng2timer_setCloseTimer_V_V_empty_n or tmp_nbreadreq_fu_70_p3 or ct_waitForWrite)
begin
    ap_sig_bdd_55 = (((rxEng2timer_setCloseTimer_V_V_empty_n == ap_const_logic_0) & (ct_waitForWrite == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_70_p3)) | (ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_79 assign process. ///
always @ (closeTimer2stateTable_releaseS_full_n or ap_reg_ppstg_ct_waitForWrite_load_reg_248_pp0_it1 or ap_reg_ppstg_tmp_reg_252_pp0_it1 or tmp_503_reg_271 or tmp_185_reg_275)
begin
    ap_sig_bdd_79 = ((closeTimer2stateTable_releaseS_full_n == ap_const_logic_0) & (ap_const_lv1_0 == ap_reg_ppstg_ct_waitForWrite_load_reg_248_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_reg_252_pp0_it1) & ~(ap_const_lv1_0 == tmp_503_reg_271) & ~(ap_const_lv1_0 == tmp_185_reg_275));
end

/// ap_sig_bdd_86 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_55 or ap_sig_bdd_79)
begin
    ap_sig_bdd_86 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_55) | (ap_sig_bdd_79 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))));
end
assign closeTimer2stateTable_releaseS_din = ap_reg_ppstg_tmp_V_21_reg_256_pp0_it1;
assign closeTimerTable_address1 = closeTimerTable_addr_1_reg_261;
assign closeTimerTable_d0 = ap_const_lv33_1000DBF24;
assign closeTimerTable_time_V_addr_s_fu_235_p5 = {{closeTimerTable_q0[32'd32 : 32'd32]}, {tmp_186_fu_229_p2}};
assign storemerge_fu_156_p3 = ((tmp_187_fu_144_p2[0:0]===1'b1)? ap_const_lv16_0: tmp_188_fu_150_p2);
assign tmp_182_fu_188_p1 = ct_setSessionID_V;
assign tmp_183_fu_139_p1 = ct_currSessionID_V;
assign tmp_184_fu_199_p2 = ($signed(ct_prevSessionID_V) + $signed(ap_const_lv16_FFFF));
assign tmp_185_fu_223_p2 = (tmp_504_fu_219_p1 == ap_const_lv32_0? 1'b1: 1'b0);
assign tmp_186_fu_229_p2 = ($signed(tmp_504_fu_219_p1) + $signed(ap_const_lv32_FFFFFFFF));
assign tmp_187_fu_144_p2 = (ct_currSessionID_V == ap_const_lv16_2710? 1'b1: 1'b0);
assign tmp_188_fu_150_p2 = (ct_currSessionID_V + ap_const_lv16_1);
assign tmp_503_fu_211_p3 = closeTimerTable_q0[ap_const_lv32_20];
assign tmp_504_fu_219_p1 = closeTimerTable_q0[31:0];
assign tmp_nbreadreq_fu_70_p3 = rxEng2timer_setCloseTimer_V_V_empty_n;
assign tmp_s_fu_182_p2 = (ct_setSessionID_V == ct_prevSessionID_V? 1'b1: 1'b0);


endmodule //toe_close_timer

