`timescale 1ns / 1ps

module ADC(
    input clk_78MHz_i,
    input reset_i,
    output [11:0] data_o,
    output ready_o    
);

//wire clk, locked;
wire [15:0] data; 
wire ready;    

xadc_wiz_0 instXADC (
.di_in(16'h0),              // input wire [15 : 0] di_in
.daddr_in(7'h16),      // input wire [6 : 0] daddr_in, colocamos la direcci?n del statua register 0x16 que corresponde a VAUXP[6] 
.den_in(eoc),            // input wire den_in
.dwe_in(16'h0),            // input wire dwe_in
.drdy_out(ready),        // output wire drdy_out
.do_out(data),            // output wire [15 : 0] do_out
.dclk_in(clk_78MHz_i),          // CAMBIAR POR CLK SI SE VUELVE A USAR EL CLOCK COMENTADO MAS ARRIBA
.reset_in(reset_i),        // input wire reset_in
.vp_in(),              // input wire vp_in
.vn_in(),              // input wire vn_in
.vauxp6(),            // input wire vauxp6
.vauxn6(),            // input wire vauxn6
.channel_out(),  // output wire [4 : 0] channel_out
.eoc_out(eoc),          // output wire eoc_out
.alarm_out(),      // output wire alarm_out
.eos_out(),          // output wire eos_out
.busy_out()        // output wire busy_out
);



//Sacamos para mirar el clock del ADC, el locked del MMCM y dato convertido (data) 
wire [11:0] adc_data_out;
assign adc_data_out = data/16;
assign data_o =   adc_data_out;   
assign ready_o = ready;   




endmodule

