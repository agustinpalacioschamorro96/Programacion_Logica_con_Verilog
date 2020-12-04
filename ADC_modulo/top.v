`timescale 1ns / 1ps
module top (
        input clk_100MHz_i,
        input rst_i,
        input vaux6_p,
        input vaux6_n,
        output [15:0] data_o, 
        output [15:0] data_o2, 
        output eoc_o,
        output ready_o    
);

wire clk_78MHz;

clocks M1 (
.clk_100MHz_i(clk_100MHz_i),
.rst_i(rst_i),
.clk_78MHz_o(clk_78MHz)
);


ADC M2 (
.CLK100MHZ(clk_78MHz),
.reset_i(rst_i),
.vaux6_p(vaux6_p),
.vaux6_n(vaux6_n),
.data_o(data_o),
.eoc_o(eoc_o)
);

ADC_v2 M3 (
.clk_78MHz_i(clk_78MHz),
.reset_i(rst_i),
.data_o(data_o2),
.ready_o(ready_o)
);


endmodule