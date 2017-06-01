// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module txPath (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        lbTxDataOut_V_data_V_din,
        lbTxDataOut_V_data_V_full_n,
        lbTxDataOut_V_data_V_write,
        lbTxDataOut_V_keep_V_din,
        lbTxDataOut_V_keep_V_full_n,
        lbTxDataOut_V_keep_V_write,
        lbTxDataOut_V_last_V_din,
        lbTxDataOut_V_last_V_full_n,
        lbTxDataOut_V_last_V_write,
        lbTxMetadataOut_V_din,
        lbTxMetadataOut_V_full_n,
        lbTxMetadataOut_V_write,
        lbTxLengthOut_V_V_din,
        lbTxLengthOut_V_V_full_n,
        lbTxLengthOut_V_V_write,
        lb_packetBuffer_V_dout,
        lb_packetBuffer_V_empty_n,
        lb_packetBuffer_V_read,
        lb_metadataBuffer_V_s_dout,
        lb_metadataBuffer_V_s_empty_n,
        lb_metadataBuffer_V_s_read,
        lb_metadataBuffer_V_4_dout,
        lb_metadataBuffer_V_4_empty_n,
        lb_metadataBuffer_V_4_read,
        lb_metadataBuffer_V_3_dout,
        lb_metadataBuffer_V_3_empty_n,
        lb_metadataBuffer_V_3_read,
        lb_metadataBuffer_V_1_dout,
        lb_metadataBuffer_V_1_empty_n,
        lb_metadataBuffer_V_1_read,
        lb_lengthBuffer_V_V_dout,
        lb_lengthBuffer_V_V_empty_n,
        lb_lengthBuffer_V_V_read
);

parameter    ap_ST_fsm_state1 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_48 = 32'b1001000;
parameter    ap_const_lv32_40 = 32'b1000000;
parameter    ap_const_lv32_47 = 32'b1000111;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [63:0] lbTxDataOut_V_data_V_din;
input   lbTxDataOut_V_data_V_full_n;
output   lbTxDataOut_V_data_V_write;
output  [7:0] lbTxDataOut_V_keep_V_din;
input   lbTxDataOut_V_keep_V_full_n;
output   lbTxDataOut_V_keep_V_write;
output  [0:0] lbTxDataOut_V_last_V_din;
input   lbTxDataOut_V_last_V_full_n;
output   lbTxDataOut_V_last_V_write;
output  [95:0] lbTxMetadataOut_V_din;
input   lbTxMetadataOut_V_full_n;
output   lbTxMetadataOut_V_write;
output  [15:0] lbTxLengthOut_V_V_din;
input   lbTxLengthOut_V_V_full_n;
output   lbTxLengthOut_V_V_write;
input  [72:0] lb_packetBuffer_V_dout;
input   lb_packetBuffer_V_empty_n;
output   lb_packetBuffer_V_read;
input  [15:0] lb_metadataBuffer_V_s_dout;
input   lb_metadataBuffer_V_s_empty_n;
output   lb_metadataBuffer_V_s_read;
input  [31:0] lb_metadataBuffer_V_4_dout;
input   lb_metadataBuffer_V_4_empty_n;
output   lb_metadataBuffer_V_4_read;
input  [15:0] lb_metadataBuffer_V_3_dout;
input   lb_metadataBuffer_V_3_empty_n;
output   lb_metadataBuffer_V_3_read;
input  [31:0] lb_metadataBuffer_V_1_dout;
input   lb_metadataBuffer_V_1_empty_n;
output   lb_metadataBuffer_V_1_read;
input  [15:0] lb_lengthBuffer_V_V_dout;
input   lb_lengthBuffer_V_V_empty_n;
output   lb_lengthBuffer_V_V_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg lbTxMetadataOut_V_write;
reg lbTxLengthOut_V_V_write;
reg lb_packetBuffer_V_read;
reg lb_lengthBuffer_V_V_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_state1;
reg    lbTxDataOut_V_data_V_blk_n;
wire   [0:0] tmp_nbreadreq_fu_86_p3;
wire   [0:0] tmp_1_nbwritereq_fu_94_p5;
reg    lbTxDataOut_V_keep_V_blk_n;
reg    lbTxDataOut_V_last_V_blk_n;
reg    lbTxMetadataOut_V_blk_n;
wire   [0:0] tmp_2_nbreadreq_fu_125_p6;
wire   [0:0] tmp_3_nbwritereq_fu_139_p3;
reg    lbTxLengthOut_V_V_blk_n;
wire   [0:0] tmp_4_nbreadreq_fu_166_p3;
wire   [0:0] tmp_5_nbwritereq_fu_174_p3;
reg    lb_packetBuffer_V_blk_n;
reg    lb_metadataBuffer_V_s_blk_n;
reg    lb_metadataBuffer_V_4_blk_n;
reg    lb_metadataBuffer_V_3_blk_n;
reg    lb_metadataBuffer_V_1_blk_n;
reg    lb_lengthBuffer_V_V_blk_n;
wire    lbTxDataOut_V_data_V1_status;
wire    lb_metadataBuffer_V_s0_status;
reg    ap_condition_130;
reg    lbTxDataOut_V_data_V1_update;
reg    lb_metadataBuffer_V_s0_update;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'b1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_continue)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_condition_130 == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (*) begin
    if (((1'b1 == ap_done_reg) | ((ap_CS_fsm_state1 == 1'b1) & ~(ap_condition_130 == 1'b1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (ap_CS_fsm_state1 == 1'b1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_condition_130 == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5) & ~(ap_condition_130 == 1'b1))) begin
        lbTxDataOut_V_data_V1_update = 1'b1;
    end else begin
        lbTxDataOut_V_data_V1_update = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5))) begin
        lbTxDataOut_V_data_V_blk_n = lbTxDataOut_V_data_V_full_n;
    end else begin
        lbTxDataOut_V_data_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5))) begin
        lbTxDataOut_V_keep_V_blk_n = lbTxDataOut_V_keep_V_full_n;
    end else begin
        lbTxDataOut_V_keep_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5))) begin
        lbTxDataOut_V_last_V_blk_n = lbTxDataOut_V_last_V_full_n;
    end else begin
        lbTxDataOut_V_last_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_4_nbreadreq_fu_166_p3) & ~(1'b0 == tmp_5_nbwritereq_fu_174_p3))) begin
        lbTxLengthOut_V_V_blk_n = lbTxLengthOut_V_V_full_n;
    end else begin
        lbTxLengthOut_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_4_nbreadreq_fu_166_p3) & ~(1'b0 == tmp_5_nbwritereq_fu_174_p3) & ~(ap_condition_130 == 1'b1))) begin
        lbTxLengthOut_V_V_write = 1'b1;
    end else begin
        lbTxLengthOut_V_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3))) begin
        lbTxMetadataOut_V_blk_n = lbTxMetadataOut_V_full_n;
    end else begin
        lbTxMetadataOut_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3) & ~(ap_condition_130 == 1'b1))) begin
        lbTxMetadataOut_V_write = 1'b1;
    end else begin
        lbTxMetadataOut_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_4_nbreadreq_fu_166_p3) & ~(1'b0 == tmp_5_nbwritereq_fu_174_p3))) begin
        lb_lengthBuffer_V_V_blk_n = lb_lengthBuffer_V_V_empty_n;
    end else begin
        lb_lengthBuffer_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_4_nbreadreq_fu_166_p3) & ~(1'b0 == tmp_5_nbwritereq_fu_174_p3) & ~(ap_condition_130 == 1'b1))) begin
        lb_lengthBuffer_V_V_read = 1'b1;
    end else begin
        lb_lengthBuffer_V_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3))) begin
        lb_metadataBuffer_V_1_blk_n = lb_metadataBuffer_V_1_empty_n;
    end else begin
        lb_metadataBuffer_V_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3))) begin
        lb_metadataBuffer_V_3_blk_n = lb_metadataBuffer_V_3_empty_n;
    end else begin
        lb_metadataBuffer_V_3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3))) begin
        lb_metadataBuffer_V_4_blk_n = lb_metadataBuffer_V_4_empty_n;
    end else begin
        lb_metadataBuffer_V_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3) & ~(ap_condition_130 == 1'b1))) begin
        lb_metadataBuffer_V_s0_update = 1'b1;
    end else begin
        lb_metadataBuffer_V_s0_update = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3))) begin
        lb_metadataBuffer_V_s_blk_n = lb_metadataBuffer_V_s_empty_n;
    end else begin
        lb_metadataBuffer_V_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5))) begin
        lb_packetBuffer_V_blk_n = lb_packetBuffer_V_empty_n;
    end else begin
        lb_packetBuffer_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5) & ~(ap_condition_130 == 1'b1))) begin
        lb_packetBuffer_V_read = 1'b1;
    end else begin
        lb_packetBuffer_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[ap_const_lv32_0];

always @ (*) begin
    ap_condition_130 = ((~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5) & (lb_packetBuffer_V_empty_n == 1'b0)) | (~(tmp_nbreadreq_fu_86_p3 == 1'b0) & ~(1'b0 == tmp_1_nbwritereq_fu_94_p5) & (lbTxDataOut_V_data_V1_status == 1'b0)) | (~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3) & (lb_metadataBuffer_V_s0_status == 1'b0)) | (~(1'b0 == tmp_2_nbreadreq_fu_125_p6) & ~(1'b0 == tmp_3_nbwritereq_fu_139_p3) & (lbTxMetadataOut_V_full_n == 1'b0)) | (~(1'b0 == tmp_4_nbreadreq_fu_166_p3) & ~(1'b0 == tmp_5_nbwritereq_fu_174_p3) & (lb_lengthBuffer_V_V_empty_n == 1'b0)) | (~(1'b0 == tmp_4_nbreadreq_fu_166_p3) & ~(1'b0 == tmp_5_nbwritereq_fu_174_p3) & (lbTxLengthOut_V_V_full_n == 1'b0)) | (ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign lbTxDataOut_V_data_V1_status = (lbTxDataOut_V_data_V_full_n & lbTxDataOut_V_keep_V_full_n & lbTxDataOut_V_last_V_full_n);

assign lbTxDataOut_V_data_V_din = lb_packetBuffer_V_dout[63:0];

assign lbTxDataOut_V_data_V_write = lbTxDataOut_V_data_V1_update;

assign lbTxDataOut_V_keep_V_din = {{lb_packetBuffer_V_dout[ap_const_lv32_47 : ap_const_lv32_40]}};

assign lbTxDataOut_V_keep_V_write = lbTxDataOut_V_data_V1_update;

assign lbTxDataOut_V_last_V_din = lb_packetBuffer_V_dout[ap_const_lv32_48];

assign lbTxDataOut_V_last_V_write = lbTxDataOut_V_data_V1_update;

assign lbTxLengthOut_V_V_din = lb_lengthBuffer_V_V_dout;

assign lbTxMetadataOut_V_din = {{{{lb_metadataBuffer_V_1_dout}, {lb_metadataBuffer_V_3_dout}}, {lb_metadataBuffer_V_4_dout}}, {lb_metadataBuffer_V_s_dout}};

assign lb_metadataBuffer_V_1_read = lb_metadataBuffer_V_s0_update;

assign lb_metadataBuffer_V_3_read = lb_metadataBuffer_V_s0_update;

assign lb_metadataBuffer_V_4_read = lb_metadataBuffer_V_s0_update;

assign lb_metadataBuffer_V_s0_status = (lb_metadataBuffer_V_s_empty_n & lb_metadataBuffer_V_4_empty_n & lb_metadataBuffer_V_3_empty_n & lb_metadataBuffer_V_1_empty_n);

assign lb_metadataBuffer_V_s_read = lb_metadataBuffer_V_s0_update;

assign tmp_1_nbwritereq_fu_94_p5 = (lbTxDataOut_V_data_V_full_n & lbTxDataOut_V_keep_V_full_n & lbTxDataOut_V_last_V_full_n);

assign tmp_2_nbreadreq_fu_125_p6 = (lb_metadataBuffer_V_s_empty_n & lb_metadataBuffer_V_4_empty_n & lb_metadataBuffer_V_3_empty_n & lb_metadataBuffer_V_1_empty_n);

assign tmp_3_nbwritereq_fu_139_p3 = lbTxMetadataOut_V_full_n;

assign tmp_4_nbreadreq_fu_166_p3 = lb_lengthBuffer_V_V_empty_n;

assign tmp_5_nbwritereq_fu_174_p3 = lbTxLengthOut_V_V_full_n;

assign tmp_nbreadreq_fu_86_p3 = lb_packetBuffer_V_empty_n;

endmodule //txPath
