`timescale 1ns / 1ps
module block_coef_TB();

reg [11:0] coef_in;
reg clk;
reg rst;
reg enable_8a12;

wire [11:0] coef0 ;
wire [11:0] coef1 ;
wire [11:0] coef2 ;
wire [11:0] coef3 ;
wire [11:0] coef4 ;
wire [11:0] coef5 ;
wire [11:0] coef6 ;
wire [11:0] coef7 ;
wire [11:0] coef8 ;
wire [11:0] coef9 ;
wire [11:0] coef10;
wire [11:0] coef11;
wire [11:0] coef12;
wire [11:0] coef13;
wire [11:0] coef14;
wire [11:0] coef15;

block_coef SUT (
    .coef_in(coef_in),
    .clk(clk),
    .rst(rst),
    .enable_8a12(enable_8a12),
    .coef0(coef0 ),
    .coef1(coef1 ),
    .coef2(coef2 ),
    .coef3(coef3 ),
    .coef4(coef4 ),
    .coef5(coef5 ),
    .coef6(coef6 ),
    .coef7(coef7 ),
    .coef8(coef8 ),
    .coef9(coef9 ),
    .coef10(coef10),
    .coef11(coef11),
    .coef12(coef12),
    .coef13(coef13),
    .coef14(coef14),
    .coef15(coef15)
);

always 
#5 clk=~clk;
initial begin
    clk=0;
    rst=1;
    enable_8a12=1;
    coef_in=12'b101010101010;
    #5
    rst=0;
    #80
$finish;
end
endmodule
