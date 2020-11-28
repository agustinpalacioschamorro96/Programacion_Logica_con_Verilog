`timescale 1ns / 1ps

module memoria(
    input clk,
    input rst,
    input [15:0] dato_in,
    input wr_en,
    input rd_en,
    output [15:0] dato_out,
    output full,
    output empty
 );
 
 RAM_FIFO S1 (
   .clk(clk),      // input wire clk
   .srst(rst),    // input wire srst
   .din(dato_in),      // input wire [15 : 0] din
   .wr_en(wr_en),  // input wire wr_en
   .rd_en(rd_en),  // input wire rd_en
   .dout(dato_out),    // output wire [15 : 0] dout
   .full(full),    // output wire full
   .empty(empty)  // output wire empty
 );
 
 
 
endmodule
