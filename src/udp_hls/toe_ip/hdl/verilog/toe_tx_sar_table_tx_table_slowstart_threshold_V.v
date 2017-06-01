// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps
module toe_tx_sar_table_tx_table_slowstart_threshold_V_ram (addr0, ce0, d0, we0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 14;
parameter MEM_SIZE = 10000;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input clk;

(* ram_style = "block" *)reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];

initial begin
    $readmemh("./toe_tx_sar_table_tx_table_slowstart_threshold_V_ram.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        if (we0) 
        begin 
            ram[addr0] <= d0; 
        end 
    end
end


always @(posedge clk)  
begin 
    if (ce1) 
    begin
            q1 <= ram[addr1];
    end
end


endmodule


`timescale 1 ns / 1 ps
module toe_tx_sar_table_tx_table_slowstart_threshold_V(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    address1,
    ce1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd10000;
parameter AddressWidth = 32'd14;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;



toe_tx_sar_table_tx_table_slowstart_threshold_V_ram toe_tx_sar_table_tx_table_slowstart_threshold_V_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .d0( d0 ),
    .we0( we0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 ));

endmodule

