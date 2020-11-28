`timescale 1ns / 1ps

module memoria_TB();

  reg clk;               // input wire clk
  reg rst;               // input wire srst
  reg [15:0] dato_in;     // input wire [7 : 0] din
  reg wr_en;             // input wire wr_en
  reg rd_en;             // input wire rd_en
  wire [15:0] dato_out;   // output wire [7 : 0] dout
  wire full;             // output wire full
  wire empty;            // output wire empty
  
 memoria SUT (
    .clk(clk),         // input wire clk
    .rst(rst),        // input wire srst
    .dato_in(dato_in),     // input wire [15 : 0] din
    .wr_en(wr_en),     // input wire wr_en
    .rd_en(rd_en),     // input wire rd_en
    .dato_out(dato_out),   // output wire [15 : 0] dout
    .full(full),       // output wire full
    .empty(empty)      // output wire empty
  );

always 
#5 clk=~clk;
initial  begin
    clk=0;
    rst=1;
    dato_in=0;
    wr_en=0;
    rd_en=0;
#10
    rst=0;
    dato_in=8'd1;
    wr_en=1;
    rd_en=0;
#10
    dato_in=8'd2;
#10
    dato_in=8'd3;
#10
    dato_in=8'd4;
#10
    dato_in=8'd5;
#10
    dato_in=8'd6;
#10
    dato_in=8'd7;
#10
    dato_in=8'd8;
#10
    dato_in=8'd2;
#10
    dato_in=8'd3;
#10
    dato_in=8'd4;
#10
    dato_in=8'd5;
#10
    dato_in=8'd6;
#10
    dato_in=8'd7;
#10
    dato_in=8'd8;
#10
    rst=0;
    dato_in=8'b01010101;
    wr_en=1;
    rd_en=0;
#100
    rst=0;
    dato_in=8'b11110101;
    wr_en=0;
    rd_en=1;
#100

$finish;
end
endmodule
