`timescale 1ns / 1ps

module ADC(
    input CLK100MHZ,
    input reset_i,
    output locked_o,
    output clk_o,
    input vaux6_p,
    input vaux6_n,
    output [15:0] data_o,
    output eoc_o    
);

wire clk, locked;
wire [15:0] data; 
wire ready;
wire eoc;    

clk_ADC instMMCM0
(
// Clock out ports  
.clk_out1(clk),            //78Mhz output MMCM
// Status and control signals               
.reset(reset_i), 
.locked(locked),
// Clock in ports
.clk_in1(CLK100MHZ)   //input board clock 100Mhz XTAL
);   

xadc_wiz_0 instXADC (
.di_in(0),              // input wire [15 : 0] di_in
.daddr_in(7'h16),      // input wire [6 : 0] daddr_in, colocamos la direcci?n del statua register 0x16 que corresponde a VAUXP[6] 
.den_in(eoc),            // input wire den_in
.dwe_in(0),            // input wire dwe_in
.drdy_out(ready),        // output wire drdy_out
.do_out(data),            // output wire [15 : 0] do_out
.dclk_in(clk),          // input wire dclk_in
.reset_in(reset_i),        // input wire reset_in
.vp_in(),              // input wire vp_in
.vn_in(),              // input wire vn_in
.vauxp6(vaux6_p),            // input wire vauxp6
.vauxn6(vaux6_n),            // input wire vauxn6
.channel_out(),  // output wire [4 : 0] channel_out
.eoc_out(eoc),          // output wire eoc_out
.alarm_out(),      // output wire alarm_out
.eos_out(),          // output wire eos_out
.busy_out()        // output wire busy_out
);



//Sacamos para mirar el clock del ADC, el locked del MMCM y dato convertido (data) 
assign data_o =   data;  
assign locked_o = locked;
assign clk_o = clk;   
assign eoc_o = eoc;   




endmodule

