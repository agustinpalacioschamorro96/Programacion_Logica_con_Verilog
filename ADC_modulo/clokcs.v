`timescale 1ns / 1ps
module clocks(
    input clk_100MHz_i,
    input rst_i,
    output clk_78MHz_o
);  


wire clk, locked_78,clk_78;

clk_wiz_0 instMMCM0
(
// Clock out ports  
.clk_out1(clk_78),            //78Mhz output MMCM
// Status and control signals               
.reset(rst_i), 
.locked(locked_78),
// Clock in ports
.clk_in1(clk_100MHz_i)   //input board clock 100Mhz XTAL
);   

assign clk_78MHz_o = clk_78 ; 

endmodule
