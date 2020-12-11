`timescale 1ns / 1ps
module clocks(
    input clk_100MHz_i,
    input rst_i,
    output clk_uart_o,
    output clk_read,
    output clk_78MHz_o
);  

reg clk2;
assign clk_read=clk2;
wire clk_out1;
wire locked;
reg led; 
reg [4:0] cont;
reg [31:0] cont2;
reg o_clk;
reg rst_ckl = 0;

  clk_wiz_0 uart
(
// Clock out ports
.clk_out1(clk_out1),     // output clk_out1 = 33.33333 Mhz
// Status and control signals
.reset(rst_ckl), // input reset
.locked(locked),       // output locked
// Clock in ports
.clk_in1(clk_100MHz_i));      // input clk_in1 = 100 Mhz

always @(posedge clk_out1) begin // clock de 33.33333 Mhz 
    if (locked == 0) begin // agregar condicion de locked
        cont  = 0;
        cont2  = 0;
        o_clk = 0;
        clk2 = 0;
        led = 0;
    end else begin
        cont  = cont + 1;
        cont2 = cont2 + 1;
        if (cont==9) begin // 9 ciclos
            o_clk <= !o_clk;
            cont  = 4'b0000;
        end
        if(cont2==18)begin
            clk2<=!clk2;
            cont2= 4'b0000;
        end
    end  
end

assign clk_uart_o = o_clk;

wire locked_78,clk_78;

 clk_wiz_1 adc
(
// Clock out ports  
.clk_out1(clk_78),            //78Mhz output MMCM
// Status and control signals               
.reset(rst_ckl), 
.locked(locked_78),
// Clock in ports
.clk_in1(clk_100MHz_i)   //input board clock 100Mhz XTAL
);   

assign clk_78MHz_o = (clk_78 & locked_78) ; 

endmodule
