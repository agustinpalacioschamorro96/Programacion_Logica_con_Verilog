`timescale 1ns / 1ps

module proyecto_TB();

reg clk;
reg rst;
reg control;
reg [11:0] data_in;
reg [11:0] coef0;
reg [11:0] coef1;
reg [11:0] coef2;
reg [11:0] coef3;
reg [11:0] coef4;
reg [11:0] coef5;
reg [11:0] coef6;
reg [11:0] coef7;
reg [11:0] coef8;
reg [11:0] coef9;
reg [11:0] coef10;
reg [11:0] coef11;
reg [11:0] coef12;
reg [11:0] coef13;
reg [11:0] coef14;
reg [11:0] coef15;
//Memoria
reg wr_en;             // input wire wr_en
reg rd_en;             // input wire rd_en
wire [15:0] dato_out;   // output wire [7 : 0] dout
wire full;             // output wire full
wire empty;            // output wire empty

proyecto SUT (
    .data_in(data_in),
    .clk(clk),
    .rst(rst),
    .control(control),
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
    .coef15(coef15),
    .wr_en(wr_en),     // input wire wr_en
    .rd_en(rd_en),     // input wire rd_en
    .dato_out(dato_out),   // output wire [15 : 0] dout
    .full(full),       // output wire full
    .empty(empty)      // output wire empty
);


always
#5 clk = ~clk;

initial begin
        data_in= 12'b111111111111;
        clk=1;
        rst=1;
        control=1;
        coef0 =  -  12'd99; 
        coef1 =     12'd65; 
        coef2 =     12'd136;
        coef3 =     12'd33; 
        coef4 =  -  12'd156; 
        coef5 =  -  12'd86; 
        coef6 =     12'd376; 
        coef7 =     12'd854; 
        coef8 =     12'd854; 
        coef9 =     12'd376; 
        coef10 = -  12'd86;
        coef11 = -  12'd156;
        coef12 =    12'd33;
        coef13 =    12'd136;
        coef14 =    12'd65;
        coef15 = -  12'd99;        
        wr_en = 0;
        rd_en=0;
    #90
        rst=0;
    #200
        wr_en=1;
    #10240
        wr_en=0;
        rd_en=1;
    #90
$finish;
end



endmodule
