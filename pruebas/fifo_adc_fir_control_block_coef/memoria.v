`timescale 1ns / 1ps

module memoria(
    input clk_i, //78MHz
    input rst_i,
    input [15:0] dato_in_i,
    input wr_en_i,
    input rd_en_i,
    input ready_i,
    output [15:0] dato_o,
    output full_o,
    output empty_o
 );
 
 
 reg wr_aux;
 wire [15:0] dato_fifo;
 //fifo 1024x16 real
 //fifo 16x16 pruebas
fifo_generator_0 S1 (
   .clk(clk_i),      // input wire clk
   .srst(rst_i),    // input wire srst
   .din(dato_in_i),      // input wire [15 : 0] din
   .wr_en(wr_aux),  // input wire wr_en
   .rd_en(rd_en_i),  // input wire rd_en
   .dout(dato_fifo),    // output wire [15 : 0] dout
   .full(full_o),    // output wire full
   .empty(empty_o)  // output wire empty
 );


reg [15:0] dato_aux;
assign dato_o = dato_aux;

//wr_aux=0 = (rst_i=0)? 0
 
 always @(negedge clk_i)begin
     if(rst_i)begin
        wr_aux=0;
        dato_aux=0;
     end else begin
        dato_aux = (rd_en_i == 1) ? dato_fifo : 0;
        wr_aux = ready_i & wr_en_i;  
     end     
 end
 
endmodule
