// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_tx_compute_tcp_subchecksums (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        txEng_tcpPkgBuffer1_V_dout,
        txEng_tcpPkgBuffer1_V_empty_n,
        txEng_tcpPkgBuffer1_V_read,
        txEng_tcpPkgBuffer2_V_din,
        txEng_tcpPkgBuffer2_V_full_n,
        txEng_tcpPkgBuffer2_V_write,
        txEng_subChecksumsFifo_V_din,
        txEng_subChecksumsFifo_V_full_n,
        txEng_subChecksumsFifo_V_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_pp0_stg0_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv17_0 = 17'b00000000000000000;
parameter    ap_const_lv32_48 = 32'b1001000;
parameter    ap_const_lv32_40 = 32'b1000000;
parameter    ap_const_lv32_41 = 32'b1000001;
parameter    ap_const_lv2_3 = 2'b11;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv8_0 = 8'b00000000;
parameter    ap_const_lv32_42 = 32'b1000010;
parameter    ap_const_lv32_43 = 32'b1000011;
parameter    ap_const_lv32_18 = 32'b11000;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_17 = 32'b10111;
parameter    ap_const_lv32_44 = 32'b1000100;
parameter    ap_const_lv32_45 = 32'b1000101;
parameter    ap_const_lv32_28 = 32'b101000;
parameter    ap_const_lv32_2F = 32'b101111;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv32_27 = 32'b100111;
parameter    ap_const_lv32_46 = 32'b1000110;
parameter    ap_const_lv32_47 = 32'b1000111;
parameter    ap_const_lv32_38 = 32'b111000;
parameter    ap_const_lv32_3F = 32'b111111;
parameter    ap_const_lv32_30 = 32'b110000;
parameter    ap_const_lv32_37 = 32'b110111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [72:0] txEng_tcpPkgBuffer1_V_dout;
input   txEng_tcpPkgBuffer1_V_empty_n;
output   txEng_tcpPkgBuffer1_V_read;
output  [72:0] txEng_tcpPkgBuffer2_V_din;
input   txEng_tcpPkgBuffer2_V_full_n;
output   txEng_tcpPkgBuffer2_V_write;
output  [67:0] txEng_subChecksumsFifo_V_din;
input   txEng_subChecksumsFifo_V_full_n;
output   txEng_subChecksumsFifo_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg txEng_tcpPkgBuffer1_V_read;
reg txEng_tcpPkgBuffer2_V_write;
reg txEng_subChecksumsFifo_V_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm = 1'b1;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_0;
reg    ap_sig_bdd_20;
wire    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
reg    ap_reg_ppiten_pp0_it2 = 1'b0;
wire   [0:0] tmp_nbreadreq_fu_142_p3;
reg    ap_sig_bdd_52;
reg   [0:0] tmp_reg_992;
reg   [0:0] ap_reg_ppstg_tmp_reg_992_pp0_it1;
reg   [0:0] tcts_firstWord_load_reg_1021;
reg   [0:0] currWord_last_V_reg_1017;
reg   [0:0] ap_reg_ppstg_currWord_last_V_reg_1017_pp0_it1;
reg    ap_sig_bdd_80;
reg   [0:0] tcts_firstWord = 1'b1;
reg   [16:0] tcts_tcp_sums_V_0 = 17'b00000000000000000;
reg   [16:0] tcts_tcp_sums_V_1 = 17'b00000000000000000;
reg   [16:0] tcts_tcp_sums_V_2 = 17'b00000000000000000;
reg   [16:0] tcts_tcp_sums_V_3 = 17'b00000000000000000;
reg   [72:0] tmp40_reg_996;
reg   [72:0] ap_reg_ppstg_tmp40_reg_996_pp0_it1;
wire   [0:0] currWord_last_V_fu_275_p3;
wire   [16:0] tmp_sum0_V_fu_440_p3;
reg   [16:0] tmp_sum0_V_reg_1025;
wire   [16:0] tmp_sum1_V_fu_608_p3;
reg   [16:0] tmp_sum1_V_reg_1030;
wire   [16:0] tmp_sum2_V_fu_776_p3;
reg   [16:0] tmp_sum2_V_reg_1035;
wire   [16:0] tmp_sum3_V_fu_944_p3;
reg   [16:0] tmp_sum3_V_reg_1040;
wire   [0:0] ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it0;
reg   [0:0] ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it1;
reg   [0:0] tcts_firstWord_new_phi_fu_174_p4;
wire   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it0;
reg   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it1;
reg   [0:0] tcts_tcp_sums_V_0_flag_1_phi_fu_186_p4;
wire   [0:0] tcts_tcp_sums_V_0_flag_fu_425_p2;
wire   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it0;
reg   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it1;
reg   [16:0] tcts_tcp_sums_V_0_new_1_phi_fu_198_p4;
wire   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it0;
reg   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it1;
reg   [0:0] tcts_tcp_sums_V_1_flag_1_phi_fu_209_p4;
wire   [0:0] tcts_tcp_sums_V_1_flag_fu_593_p2;
wire   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it0;
reg   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it1;
reg   [16:0] tcts_tcp_sums_V_1_new_1_phi_fu_221_p4;
wire   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it0;
reg   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it1;
reg   [0:0] tcts_tcp_sums_V_2_flag_1_phi_fu_232_p4;
wire   [0:0] tcts_tcp_sums_V_2_flag_fu_761_p2;
wire   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it0;
reg   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it1;
reg   [16:0] tcts_tcp_sums_V_2_new_1_phi_fu_244_p4;
wire   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it0;
reg   [0:0] ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it1;
reg   [0:0] tcts_tcp_sums_V_3_flag_1_phi_fu_255_p4;
wire   [0:0] tcts_tcp_sums_V_3_flag_fu_929_p2;
wire   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it0;
reg   [16:0] ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it1;
reg   [16:0] tcts_tcp_sums_V_3_new_1_phi_fu_267_p4;
wire   [1:0] p_Result_s_fu_287_p4;
wire   [7:0] tmp_263_fu_315_p1;
wire   [7:0] p_Result_2_fu_306_p4;
wire   [15:0] p_Result_3_fu_318_p3;
wire   [16:0] tmp_72_fu_326_p1;
wire   [16:0] tmp_73_fu_330_p2;
wire   [0:0] tmp_264_fu_336_p3;
wire   [15:0] tmp_266_fu_348_p1;
wire   [15:0] tmp_265_fu_344_p1;
wire   [15:0] tmp_267_fu_352_p2;
wire   [15:0] p_Result_4_fu_369_p3;
wire   [16:0] tmp_74_fu_377_p1;
wire   [16:0] tmp_75_fu_381_p2;
wire   [0:0] tmp_269_fu_387_p3;
wire   [15:0] tmp_271_fu_399_p1;
wire   [15:0] tmp_270_fu_395_p1;
wire   [15:0] tmp_272_fu_403_p2;
wire   [0:0] tmp_s_fu_296_p2;
wire   [0:0] tmp_268_fu_362_p3;
wire   [0:0] sel_tmp1_fu_413_p2;
wire   [0:0] sel_tmp2_fu_419_p2;
wire   [16:0] p_cast_fu_358_p1;
wire   [16:0] p_12_cast_fu_409_p1;
wire   [16:0] sel_tmp4_fu_432_p3;
wire   [1:0] p_Result_169_1_fu_449_p4;
wire   [7:0] p_Result_172_1_fu_477_p4;
wire   [7:0] p_Result_170_1_fu_468_p4;
wire   [15:0] p_Result_173_1_fu_486_p3;
wire   [16:0] tmp_185_1_fu_494_p1;
wire   [16:0] tmp_186_1_fu_498_p2;
wire   [0:0] tmp_273_fu_504_p3;
wire   [15:0] tmp_275_fu_516_p1;
wire   [15:0] tmp_274_fu_512_p1;
wire   [15:0] tmp_276_fu_520_p2;
wire   [15:0] p_Result_176_1_fu_537_p3;
wire   [16:0] tmp_191_1_fu_545_p1;
wire   [16:0] tmp_192_1_fu_549_p2;
wire   [0:0] tmp_278_fu_555_p3;
wire   [15:0] tmp_280_fu_567_p1;
wire   [15:0] tmp_279_fu_563_p1;
wire   [15:0] tmp_281_fu_571_p2;
wire   [0:0] tmp_1_fu_458_p2;
wire   [0:0] tmp_277_fu_530_p3;
wire   [0:0] sel_tmp9_fu_581_p2;
wire   [0:0] sel_tmp_fu_587_p2;
wire   [16:0] p_1_cast_fu_526_p1;
wire   [16:0] p_12_1_cast_fu_577_p1;
wire   [16:0] sel_tmp3_fu_600_p3;
wire   [1:0] p_Result_169_2_fu_617_p4;
wire   [7:0] p_Result_172_2_fu_645_p4;
wire   [7:0] p_Result_170_2_fu_636_p4;
wire   [15:0] p_Result_173_2_fu_654_p3;
wire   [16:0] tmp_185_2_fu_662_p1;
wire   [16:0] tmp_186_2_fu_666_p2;
wire   [0:0] tmp_282_fu_672_p3;
wire   [15:0] tmp_284_fu_684_p1;
wire   [15:0] tmp_283_fu_680_p1;
wire   [15:0] tmp_285_fu_688_p2;
wire   [15:0] p_Result_176_2_fu_705_p3;
wire   [16:0] tmp_191_2_fu_713_p1;
wire   [16:0] tmp_192_2_fu_717_p2;
wire   [0:0] tmp_287_fu_723_p3;
wire   [15:0] tmp_289_fu_735_p1;
wire   [15:0] tmp_288_fu_731_p1;
wire   [15:0] tmp_290_fu_739_p2;
wire   [0:0] tmp_2_fu_626_p2;
wire   [0:0] tmp_286_fu_698_p3;
wire   [0:0] sel_tmp5_fu_749_p2;
wire   [0:0] sel_tmp6_fu_755_p2;
wire   [16:0] p_2_cast_fu_694_p1;
wire   [16:0] p_12_2_cast_fu_745_p1;
wire   [16:0] sel_tmp7_fu_768_p3;
wire   [1:0] p_Result_169_3_fu_785_p4;
wire   [7:0] p_Result_172_3_fu_813_p4;
wire   [7:0] p_Result_170_3_fu_804_p4;
wire   [15:0] p_Result_173_3_fu_822_p3;
wire   [16:0] tmp_185_3_fu_830_p1;
wire   [16:0] tmp_186_3_fu_834_p2;
wire   [0:0] tmp_291_fu_840_p3;
wire   [15:0] tmp_293_fu_852_p1;
wire   [15:0] tmp_292_fu_848_p1;
wire   [15:0] tmp_294_fu_856_p2;
wire   [15:0] p_Result_176_3_fu_873_p3;
wire   [16:0] tmp_191_3_fu_881_p1;
wire   [16:0] tmp_192_3_fu_885_p2;
wire   [0:0] tmp_296_fu_891_p3;
wire   [15:0] tmp_298_fu_903_p1;
wire   [15:0] tmp_297_fu_899_p1;
wire   [15:0] tmp_299_fu_907_p2;
wire   [0:0] tmp_3_fu_794_p2;
wire   [0:0] tmp_295_fu_866_p3;
wire   [0:0] sel_tmp8_fu_917_p2;
wire   [0:0] sel_tmp10_fu_923_p2;
wire   [16:0] p_3_cast_fu_862_p1;
wire   [16:0] p_12_3_cast_fu_913_p1;
wire   [16:0] sel_tmp11_fu_936_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_pprstidle_pp0;
reg    ap_sig_bdd_139;
reg    ap_sig_bdd_87;




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
        end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
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
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
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
        if (~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
            ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it1 <= ap_const_lv1_1;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it1 <= ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it1 <= ap_const_lv1_1;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it1 <= ap_const_lv17_0;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it1 <= ap_const_lv1_1;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it1 <= ap_const_lv17_0;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it1 <= ap_const_lv1_1;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it1 <= ap_const_lv17_0;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it1 <= ap_const_lv1_1;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_87) begin
        if (ap_sig_bdd_139) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it1 <= ap_const_lv17_0;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it1 <= ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ap_reg_ppstg_currWord_last_V_reg_1017_pp0_it1 <= currWord_last_V_reg_1017;
        ap_reg_ppstg_tmp40_reg_996_pp0_it1 <= tmp40_reg_996;
        ap_reg_ppstg_tmp_reg_992_pp0_it1 <= tmp_reg_992;
        tmp_reg_992 <= tmp_nbreadreq_fu_142_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(tmp_nbreadreq_fu_142_p3 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        currWord_last_V_reg_1017 <= txEng_tcpPkgBuffer1_V_dout[ap_const_lv32_48];
        tmp40_reg_996 <= txEng_tcpPkgBuffer1_V_dout;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == tmp_reg_992))) begin
        tcts_firstWord <= tcts_firstWord_new_phi_fu_174_p4;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == tmp_reg_992))) begin
        tcts_firstWord_load_reg_1021 <= tcts_firstWord;
        tmp_sum0_V_reg_1025 <= tmp_sum0_V_fu_440_p3;
        tmp_sum1_V_reg_1030 <= tmp_sum1_V_fu_608_p3;
        tmp_sum2_V_reg_1035 <= tmp_sum2_V_fu_776_p3;
        tmp_sum3_V_reg_1040 <= tmp_sum3_V_fu_944_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == tmp_reg_992) & ~(ap_const_lv1_0 == tcts_tcp_sums_V_0_flag_1_phi_fu_186_p4))) begin
        tcts_tcp_sums_V_0 <= tcts_tcp_sums_V_0_new_1_phi_fu_198_p4;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == tmp_reg_992) & ~(ap_const_lv1_0 == tcts_tcp_sums_V_1_flag_1_phi_fu_209_p4))) begin
        tcts_tcp_sums_V_1 <= tcts_tcp_sums_V_1_new_1_phi_fu_221_p4;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == tmp_reg_992) & ~(ap_const_lv1_0 == tcts_tcp_sums_V_2_flag_1_phi_fu_232_p4))) begin
        tcts_tcp_sums_V_2 <= tcts_tcp_sums_V_2_new_1_phi_fu_244_p4;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == tmp_reg_992) & ~(ap_const_lv1_0 == tcts_tcp_sums_V_3_flag_1_phi_fu_255_p4))) begin
        tcts_tcp_sums_V_3 <= tcts_tcp_sums_V_3_new_1_phi_fu_267_p4;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_52 or ap_sig_bdd_80)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))))) begin
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
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_52 or ap_sig_bdd_80)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
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

/// tcts_firstWord_new_phi_fu_174_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_firstWord_new_phi_fu_174_p4 = ap_const_lv1_0;
    end else begin
        tcts_firstWord_new_phi_fu_174_p4 = ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it1;
    end
end

/// tcts_tcp_sums_V_0_flag_1_phi_fu_186_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it1 or tcts_tcp_sums_V_0_flag_fu_425_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_0_flag_1_phi_fu_186_p4 = tcts_tcp_sums_V_0_flag_fu_425_p2;
    end else begin
        tcts_tcp_sums_V_0_flag_1_phi_fu_186_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it1;
    end
end

/// tcts_tcp_sums_V_0_new_1_phi_fu_198_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or tmp_sum0_V_fu_440_p3 or ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_0_new_1_phi_fu_198_p4 = tmp_sum0_V_fu_440_p3;
    end else begin
        tcts_tcp_sums_V_0_new_1_phi_fu_198_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it1;
    end
end

/// tcts_tcp_sums_V_1_flag_1_phi_fu_209_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it1 or tcts_tcp_sums_V_1_flag_fu_593_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_1_flag_1_phi_fu_209_p4 = tcts_tcp_sums_V_1_flag_fu_593_p2;
    end else begin
        tcts_tcp_sums_V_1_flag_1_phi_fu_209_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it1;
    end
end

/// tcts_tcp_sums_V_1_new_1_phi_fu_221_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or tmp_sum1_V_fu_608_p3 or ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_1_new_1_phi_fu_221_p4 = tmp_sum1_V_fu_608_p3;
    end else begin
        tcts_tcp_sums_V_1_new_1_phi_fu_221_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it1;
    end
end

/// tcts_tcp_sums_V_2_flag_1_phi_fu_232_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it1 or tcts_tcp_sums_V_2_flag_fu_761_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_2_flag_1_phi_fu_232_p4 = tcts_tcp_sums_V_2_flag_fu_761_p2;
    end else begin
        tcts_tcp_sums_V_2_flag_1_phi_fu_232_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it1;
    end
end

/// tcts_tcp_sums_V_2_new_1_phi_fu_244_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or tmp_sum2_V_fu_776_p3 or ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_2_new_1_phi_fu_244_p4 = tmp_sum2_V_fu_776_p3;
    end else begin
        tcts_tcp_sums_V_2_new_1_phi_fu_244_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it1;
    end
end

/// tcts_tcp_sums_V_3_flag_1_phi_fu_255_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it1 or tcts_tcp_sums_V_3_flag_fu_929_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_3_flag_1_phi_fu_255_p4 = tcts_tcp_sums_V_3_flag_fu_929_p2;
    end else begin
        tcts_tcp_sums_V_3_flag_1_phi_fu_255_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it1;
    end
end

/// tcts_tcp_sums_V_3_new_1_phi_fu_267_p4 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it1 or tmp_reg_992 or currWord_last_V_reg_1017 or tmp_sum3_V_fu_944_p3 or ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_992) & (ap_const_lv1_0 == currWord_last_V_reg_1017))) begin
        tcts_tcp_sums_V_3_new_1_phi_fu_267_p4 = tmp_sum3_V_fu_944_p3;
    end else begin
        tcts_tcp_sums_V_3_new_1_phi_fu_267_p4 = ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it1;
    end
end

/// txEng_subChecksumsFifo_V_write assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_52 or ap_reg_ppstg_tmp_reg_992_pp0_it1 or ap_reg_ppstg_currWord_last_V_reg_1017_pp0_it1 or ap_sig_bdd_80)
begin
    if ((~(ap_const_lv1_0 == ap_reg_ppstg_tmp_reg_992_pp0_it1) & ~(ap_const_lv1_0 == ap_reg_ppstg_currWord_last_V_reg_1017_pp0_it1) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        txEng_subChecksumsFifo_V_write = ap_const_logic_1;
    end else begin
        txEng_subChecksumsFifo_V_write = ap_const_logic_0;
    end
end

/// txEng_tcpPkgBuffer1_V_read assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or tmp_nbreadreq_fu_142_p3 or ap_sig_bdd_52 or ap_sig_bdd_80)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(tmp_nbreadreq_fu_142_p3 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        txEng_tcpPkgBuffer1_V_read = ap_const_logic_1;
    end else begin
        txEng_tcpPkgBuffer1_V_read = ap_const_logic_0;
    end
end

/// txEng_tcpPkgBuffer2_V_write assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_52 or ap_reg_ppstg_tmp_reg_992_pp0_it1 or tcts_firstWord_load_reg_1021 or ap_sig_bdd_80)
begin
    if ((~(ap_const_lv1_0 == ap_reg_ppstg_tmp_reg_992_pp0_it1) & (ap_const_lv1_0 == tcts_firstWord_load_reg_1021) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        txEng_tcpPkgBuffer2_V_write = ap_const_logic_1;
    end else begin
        txEng_tcpPkgBuffer2_V_write = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_done_reg or ap_CS_fsm or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_52 or ap_sig_bdd_80 or ap_sig_pprstidle_pp0)
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

assign ap_reg_phiprechg_tcts_firstWord_new_reg_170pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_0_flag_1_reg_182pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_0_new_1_reg_194pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_1_flag_1_reg_205pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_1_new_1_reg_217pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_2_flag_1_reg_228pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_2_new_1_reg_240pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_3_flag_1_reg_251pp0_it0 = 'bx;
assign ap_reg_phiprechg_tcts_tcp_sums_V_3_new_1_reg_263pp0_it0 = 'bx;
assign ap_reg_ppiten_pp0_it0 = ap_start;

/// ap_sig_bdd_139 assign process. ///
always @ (tmp_nbreadreq_fu_142_p3 or currWord_last_V_fu_275_p3)
begin
    ap_sig_bdd_139 = (~(tmp_nbreadreq_fu_142_p3 == ap_const_lv1_0) & ~(ap_const_lv1_0 == currWord_last_V_fu_275_p3));
end

/// ap_sig_bdd_20 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_20 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_52 assign process. ///
always @ (ap_start or ap_done_reg or txEng_tcpPkgBuffer1_V_empty_n or tmp_nbreadreq_fu_142_p3)
begin
    ap_sig_bdd_52 = (((txEng_tcpPkgBuffer1_V_empty_n == ap_const_logic_0) & ~(tmp_nbreadreq_fu_142_p3 == ap_const_lv1_0)) | (ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_80 assign process. ///
always @ (txEng_tcpPkgBuffer2_V_full_n or ap_reg_ppstg_tmp_reg_992_pp0_it1 or tcts_firstWord_load_reg_1021 or txEng_subChecksumsFifo_V_full_n or ap_reg_ppstg_currWord_last_V_reg_1017_pp0_it1)
begin
    ap_sig_bdd_80 = (((txEng_tcpPkgBuffer2_V_full_n == ap_const_logic_0) & ~(ap_const_lv1_0 == ap_reg_ppstg_tmp_reg_992_pp0_it1) & (ap_const_lv1_0 == tcts_firstWord_load_reg_1021)) | (~(ap_const_lv1_0 == ap_reg_ppstg_tmp_reg_992_pp0_it1) & (txEng_subChecksumsFifo_V_full_n == ap_const_logic_0) & ~(ap_const_lv1_0 == ap_reg_ppstg_currWord_last_V_reg_1017_pp0_it1)));
end

/// ap_sig_bdd_87 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_52 or ap_sig_bdd_80)
begin
    ap_sig_bdd_87 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_52) | (ap_sig_bdd_80 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))));
end
assign currWord_last_V_fu_275_p3 = txEng_tcpPkgBuffer1_V_dout[ap_const_lv32_48];
assign p_12_1_cast_fu_577_p1 = tmp_281_fu_571_p2;
assign p_12_2_cast_fu_745_p1 = tmp_290_fu_739_p2;
assign p_12_3_cast_fu_913_p1 = tmp_299_fu_907_p2;
assign p_12_cast_fu_409_p1 = tmp_272_fu_403_p2;
assign p_1_cast_fu_526_p1 = tmp_276_fu_520_p2;
assign p_2_cast_fu_694_p1 = tmp_285_fu_688_p2;
assign p_3_cast_fu_862_p1 = tmp_294_fu_856_p2;
assign p_Result_169_1_fu_449_p4 = {{tmp40_reg_996[ap_const_lv32_43 : ap_const_lv32_42]}};
assign p_Result_169_2_fu_617_p4 = {{tmp40_reg_996[ap_const_lv32_45 : ap_const_lv32_44]}};
assign p_Result_169_3_fu_785_p4 = {{tmp40_reg_996[ap_const_lv32_47 : ap_const_lv32_46]}};
assign p_Result_170_1_fu_468_p4 = {{tmp40_reg_996[ap_const_lv32_1F : ap_const_lv32_18]}};
assign p_Result_170_2_fu_636_p4 = {{tmp40_reg_996[ap_const_lv32_2F : ap_const_lv32_28]}};
assign p_Result_170_3_fu_804_p4 = {{tmp40_reg_996[ap_const_lv32_3F : ap_const_lv32_38]}};
assign p_Result_172_1_fu_477_p4 = {{tmp40_reg_996[ap_const_lv32_17 : ap_const_lv32_10]}};
assign p_Result_172_2_fu_645_p4 = {{tmp40_reg_996[ap_const_lv32_27 : ap_const_lv32_20]}};
assign p_Result_172_3_fu_813_p4 = {{tmp40_reg_996[ap_const_lv32_37 : ap_const_lv32_30]}};
assign p_Result_173_1_fu_486_p3 = {{p_Result_172_1_fu_477_p4}, {p_Result_170_1_fu_468_p4}};
assign p_Result_173_2_fu_654_p3 = {{p_Result_172_2_fu_645_p4}, {p_Result_170_2_fu_636_p4}};
assign p_Result_173_3_fu_822_p3 = {{p_Result_172_3_fu_813_p4}, {p_Result_170_3_fu_804_p4}};
assign p_Result_176_1_fu_537_p3 = {{p_Result_172_1_fu_477_p4}, {ap_const_lv8_0}};
assign p_Result_176_2_fu_705_p3 = {{p_Result_172_2_fu_645_p4}, {ap_const_lv8_0}};
assign p_Result_176_3_fu_873_p3 = {{p_Result_172_3_fu_813_p4}, {ap_const_lv8_0}};
assign p_Result_2_fu_306_p4 = {{tmp40_reg_996[ap_const_lv32_F : ap_const_lv32_8]}};
assign p_Result_3_fu_318_p3 = {{tmp_263_fu_315_p1}, {p_Result_2_fu_306_p4}};
assign p_Result_4_fu_369_p3 = {{tmp_263_fu_315_p1}, {ap_const_lv8_0}};
assign p_Result_s_fu_287_p4 = {{tmp40_reg_996[ap_const_lv32_41 : ap_const_lv32_40]}};
assign p_cast_fu_358_p1 = tmp_267_fu_352_p2;
assign sel_tmp10_fu_923_p2 = (tmp_295_fu_866_p3 & sel_tmp8_fu_917_p2);
assign sel_tmp11_fu_936_p3 = ((tmp_3_fu_794_p2[0:0]===1'b1)? p_3_cast_fu_862_p1: tcts_tcp_sums_V_3);
assign sel_tmp1_fu_413_p2 = (tmp_s_fu_296_p2 ^ ap_const_lv1_1);
assign sel_tmp2_fu_419_p2 = (tmp_268_fu_362_p3 & sel_tmp1_fu_413_p2);
assign sel_tmp3_fu_600_p3 = ((tmp_1_fu_458_p2[0:0]===1'b1)? p_1_cast_fu_526_p1: tcts_tcp_sums_V_1);
assign sel_tmp4_fu_432_p3 = ((tmp_s_fu_296_p2[0:0]===1'b1)? p_cast_fu_358_p1: tcts_tcp_sums_V_0);
assign sel_tmp5_fu_749_p2 = (tmp_2_fu_626_p2 ^ ap_const_lv1_1);
assign sel_tmp6_fu_755_p2 = (tmp_286_fu_698_p3 & sel_tmp5_fu_749_p2);
assign sel_tmp7_fu_768_p3 = ((tmp_2_fu_626_p2[0:0]===1'b1)? p_2_cast_fu_694_p1: tcts_tcp_sums_V_2);
assign sel_tmp8_fu_917_p2 = (tmp_3_fu_794_p2 ^ ap_const_lv1_1);
assign sel_tmp9_fu_581_p2 = (tmp_1_fu_458_p2 ^ ap_const_lv1_1);
assign sel_tmp_fu_587_p2 = (tmp_277_fu_530_p3 & sel_tmp9_fu_581_p2);
assign tcts_tcp_sums_V_0_flag_fu_425_p2 = (sel_tmp2_fu_419_p2 | tmp_s_fu_296_p2);
assign tcts_tcp_sums_V_1_flag_fu_593_p2 = (sel_tmp_fu_587_p2 | tmp_1_fu_458_p2);
assign tcts_tcp_sums_V_2_flag_fu_761_p2 = (sel_tmp6_fu_755_p2 | tmp_2_fu_626_p2);
assign tcts_tcp_sums_V_3_flag_fu_929_p2 = (sel_tmp10_fu_923_p2 | tmp_3_fu_794_p2);
assign tmp_185_1_fu_494_p1 = p_Result_173_1_fu_486_p3;
assign tmp_185_2_fu_662_p1 = p_Result_173_2_fu_654_p3;
assign tmp_185_3_fu_830_p1 = p_Result_173_3_fu_822_p3;
assign tmp_186_1_fu_498_p2 = (tmp_185_1_fu_494_p1 + tcts_tcp_sums_V_1);
assign tmp_186_2_fu_666_p2 = (tmp_185_2_fu_662_p1 + tcts_tcp_sums_V_2);
assign tmp_186_3_fu_834_p2 = (tmp_185_3_fu_830_p1 + tcts_tcp_sums_V_3);
assign tmp_191_1_fu_545_p1 = p_Result_176_1_fu_537_p3;
assign tmp_191_2_fu_713_p1 = p_Result_176_2_fu_705_p3;
assign tmp_191_3_fu_881_p1 = p_Result_176_3_fu_873_p3;
assign tmp_192_1_fu_549_p2 = (tmp_191_1_fu_545_p1 + tcts_tcp_sums_V_1);
assign tmp_192_2_fu_717_p2 = (tmp_191_2_fu_713_p1 + tcts_tcp_sums_V_2);
assign tmp_192_3_fu_885_p2 = (tmp_191_3_fu_881_p1 + tcts_tcp_sums_V_3);
assign tmp_1_fu_458_p2 = (p_Result_169_1_fu_449_p4 == ap_const_lv2_3? 1'b1: 1'b0);
assign tmp_263_fu_315_p1 = tmp40_reg_996[7:0];
assign tmp_264_fu_336_p3 = tmp_73_fu_330_p2[ap_const_lv32_10];
assign tmp_265_fu_344_p1 = tmp_73_fu_330_p2[15:0];
assign tmp_266_fu_348_p1 = tmp_264_fu_336_p3;
assign tmp_267_fu_352_p2 = (tmp_266_fu_348_p1 + tmp_265_fu_344_p1);
assign tmp_268_fu_362_p3 = tmp40_reg_996[ap_const_lv32_40];
assign tmp_269_fu_387_p3 = tmp_75_fu_381_p2[ap_const_lv32_10];
assign tmp_270_fu_395_p1 = tmp_75_fu_381_p2[15:0];
assign tmp_271_fu_399_p1 = tmp_269_fu_387_p3;
assign tmp_272_fu_403_p2 = (tmp_271_fu_399_p1 + tmp_270_fu_395_p1);
assign tmp_273_fu_504_p3 = tmp_186_1_fu_498_p2[ap_const_lv32_10];
assign tmp_274_fu_512_p1 = tmp_186_1_fu_498_p2[15:0];
assign tmp_275_fu_516_p1 = tmp_273_fu_504_p3;
assign tmp_276_fu_520_p2 = (tmp_275_fu_516_p1 + tmp_274_fu_512_p1);
assign tmp_277_fu_530_p3 = tmp40_reg_996[ap_const_lv32_42];
assign tmp_278_fu_555_p3 = tmp_192_1_fu_549_p2[ap_const_lv32_10];
assign tmp_279_fu_563_p1 = tmp_192_1_fu_549_p2[15:0];
assign tmp_280_fu_567_p1 = tmp_278_fu_555_p3;
assign tmp_281_fu_571_p2 = (tmp_280_fu_567_p1 + tmp_279_fu_563_p1);
assign tmp_282_fu_672_p3 = tmp_186_2_fu_666_p2[ap_const_lv32_10];
assign tmp_283_fu_680_p1 = tmp_186_2_fu_666_p2[15:0];
assign tmp_284_fu_684_p1 = tmp_282_fu_672_p3;
assign tmp_285_fu_688_p2 = (tmp_284_fu_684_p1 + tmp_283_fu_680_p1);
assign tmp_286_fu_698_p3 = tmp40_reg_996[ap_const_lv32_44];
assign tmp_287_fu_723_p3 = tmp_192_2_fu_717_p2[ap_const_lv32_10];
assign tmp_288_fu_731_p1 = tmp_192_2_fu_717_p2[15:0];
assign tmp_289_fu_735_p1 = tmp_287_fu_723_p3;
assign tmp_290_fu_739_p2 = (tmp_289_fu_735_p1 + tmp_288_fu_731_p1);
assign tmp_291_fu_840_p3 = tmp_186_3_fu_834_p2[ap_const_lv32_10];
assign tmp_292_fu_848_p1 = tmp_186_3_fu_834_p2[15:0];
assign tmp_293_fu_852_p1 = tmp_291_fu_840_p3;
assign tmp_294_fu_856_p2 = (tmp_293_fu_852_p1 + tmp_292_fu_848_p1);
assign tmp_295_fu_866_p3 = tmp40_reg_996[ap_const_lv32_46];
assign tmp_296_fu_891_p3 = tmp_192_3_fu_885_p2[ap_const_lv32_10];
assign tmp_297_fu_899_p1 = tmp_192_3_fu_885_p2[15:0];
assign tmp_298_fu_903_p1 = tmp_296_fu_891_p3;
assign tmp_299_fu_907_p2 = (tmp_298_fu_903_p1 + tmp_297_fu_899_p1);
assign tmp_2_fu_626_p2 = (p_Result_169_2_fu_617_p4 == ap_const_lv2_3? 1'b1: 1'b0);
assign tmp_3_fu_794_p2 = (p_Result_169_3_fu_785_p4 == ap_const_lv2_3? 1'b1: 1'b0);
assign tmp_72_fu_326_p1 = p_Result_3_fu_318_p3;
assign tmp_73_fu_330_p2 = (tmp_72_fu_326_p1 + tcts_tcp_sums_V_0);
assign tmp_74_fu_377_p1 = p_Result_4_fu_369_p3;
assign tmp_75_fu_381_p2 = (tmp_74_fu_377_p1 + tcts_tcp_sums_V_0);
assign tmp_nbreadreq_fu_142_p3 = txEng_tcpPkgBuffer1_V_empty_n;
assign tmp_s_fu_296_p2 = (p_Result_s_fu_287_p4 == ap_const_lv2_3? 1'b1: 1'b0);
assign tmp_sum0_V_fu_440_p3 = ((sel_tmp2_fu_419_p2[0:0]===1'b1)? p_12_cast_fu_409_p1: sel_tmp4_fu_432_p3);
assign tmp_sum1_V_fu_608_p3 = ((sel_tmp_fu_587_p2[0:0]===1'b1)? p_12_1_cast_fu_577_p1: sel_tmp3_fu_600_p3);
assign tmp_sum2_V_fu_776_p3 = ((sel_tmp6_fu_755_p2[0:0]===1'b1)? p_12_2_cast_fu_745_p1: sel_tmp7_fu_768_p3);
assign tmp_sum3_V_fu_944_p3 = ((sel_tmp10_fu_923_p2[0:0]===1'b1)? p_12_3_cast_fu_913_p1: sel_tmp11_fu_936_p3);
assign txEng_subChecksumsFifo_V_din = {{{{tmp_sum3_V_reg_1040}, {tmp_sum2_V_reg_1035}}, {tmp_sum1_V_reg_1030}}, {tmp_sum0_V_reg_1025}};
assign txEng_tcpPkgBuffer2_V_din = ap_reg_ppstg_tmp40_reg_996_pp0_it1;


endmodule //toe_tx_compute_tcp_subchecksums

