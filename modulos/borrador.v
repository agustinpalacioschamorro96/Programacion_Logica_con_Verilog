ENTRADAS
input [11:0] coef0,
input [11:0] coef1,
input [11:0] coef2,
input [11:0] coef3,
input [11:0] coef4,
input [11:0] coef5,
input [11:0] coef6,
input [11:0] coef7,
input [11:0] coef8,
input [11:0] coef9,
input [11:0] coef10,
input [11:0] coef11,
input [11:0] coef12,
input [11:0] coef13,
input [11:0] coef14,
input [11:0] coef15,

REGISTROS Y ASIGNACIONES

    reg [11:0] coef0_aux;  assign coef0 = coef0_aux;
    reg [11:0] coef1_aux;  assign coef1 = coef1_aux;
    reg [11:0] coef2_aux;  assign coef2 = coef2_aux;
    reg [11:0] coef3_aux;  assign coef3 = coef3_aux;
    reg [11:0] coef4_aux;  assign coef4 = coef4_aux;
    reg [11:0] coef5_aux;  assign coef5 = coef5_aux;
    reg [11:0] coef6_aux;  assign coef6 = coef6_aux;
    reg [11:0] coef7_aux;  assign coef7 = coef7_aux;
    reg [11:0] coef8_aux;  assign coef8 = coef8_aux;
    reg [11:0] coef9_aux;  assign coef9 = coef9_aux;
    reg [11:0] coef10_aux; assign coef10 = coef10_aux;
    reg [11:0] coef11_aux; assign coef11 = coef11_aux;
    reg [11:0] coef12_aux; assign coef12 = coef12_aux;
    reg [11:0] coef13_aux; assign coef13 = coef13_aux;
    reg [11:0] coef14_aux; assign coef14 = coef14_aux;
    reg [11:0] coef15_aux; assign coef15 = coef15_aux;

SALIDAS
output [11:0] coef0, 
output [11:0] coef1, 
output [11:0] coef2, 
output [11:0] coef3, 
output [11:0] coef4, 
output [11:0] coef5, 
output [11:0] coef6, 
output [11:0] coef7, 
output [11:0] coef8, 
output [11:0] coef9, 
output [11:0] coef10, 
output [11:0] coef11, 
output [11:0] coef12, 
output [11:0] coef13, 
output [11:0] coef14, 
output [11:0] coef15, 

RESET

coef0_aux = 0 ;
coef1_aux = 0 ;
coef2_aux = 0 ;
coef3_aux = 0 ;
coef4_aux = 0 ;
coef5_aux = 0 ;
coef6_aux = 0 ;
coef7_aux = 0 ;
coef8_aux = 0 ;
coef9_aux = 0 ;
coef10_aux = 0 ;
coef11_aux = 0 ;
coef12_aux = 0 ;
coef13_aux = 0 ;
coef14_aux = 0 ;
coef15_aux = 0 ;

0 : coef0_aux=coef_in;
1 : coef1_aux=coef_in;
2 : coef2_aux=coef_in;
3 : coef3_aux=coef_in;
4 : coef4_aux=coef_in;
5 : coef5_aux=coef_in;
6 : coef6_aux=coef_in;
7 : coef7_aux=coef_in;
8 : coef8_aux=coef_in;
9 : coef9_aux=coef_in;
10 : coef10_aux=coef_in;
11 : coef11_aux=coef_in;
12 : coef12_aux=coef_in;
13 : coef13_aux=coef_in;
14 : coef14_aux=coef_in;
15 : coef15_aux=coef_in;

REGISTROS

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

blocl_coef SUT (
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
    .coef1(coef10),
    .coef1(coef11),
    .coef1(coef12),
    .coef1(coef13),
    .coef1(coef14),
    .coef1(coef15)
);

FIR ********************************************

input [11:0] data_in,
input clk,
input rst,
input control,
input [11:0] coef0,
input [11:0] coef1,
input [11:0] coef2,
input [11:0] coef3,
input [11:0] coef4,
input [11:0] coef5,
input [11:0] coef6,
input [11:0] coef7,
input [11:0] coef8,
input [11:0] coef9,
input [11:0] coef10,
input [11:0] coef11,
input [11:0] coef12,
input [11:0] coef13,
input [11:0] coef14,
input [11:0] coef15

reg [11:0] m;
reg [11:0] m1;
reg [11:0] m2;
reg [11:0] m3;
reg [11:0] m4;
reg [11:0] m5;
reg [11:0] m6;
reg [11:0] m7;
reg [11:0] m8;
reg [11:0] m9;
reg [11:0] m10;
reg [11:0] m11;
reg [11:0] m12;
reg [11:0] m13;
reg [11:0] m14;
reg [11:0] m15;

m=0;
m1=0;
m2=0;
m3=0;
m4=0;
m5=0;
m6=0;
m7=0;
m8=0;
m9=0;
m10=0;
m11=0;
m12=0;
m13=0;
m14=0;
m15=0;

m=data_in;
m1=m;
m2=m1;
m3=m2;
m4=m3;
m5=m4;
m6=m5;
m7=m6;
m8=m7;
m9=m8;
m10=m9;
m11=m10;
m12=m11;
m13=m12;
m14=m13;
m15=m14;

reg [23:0] resp;
reg [23:0] resp1;
reg [23:0] resp2;
reg [23:0] resp3;
reg [23:0] resp4;
reg [23:0] resp5;
reg [23:0] resp6;
reg [23:0] resp7;
reg [23:0] resp8;
reg [23:0] resp9;
reg [23:0] resp10;
reg [23:0] resp11;
reg [23:0] resp12;
reg [23:0] resp13;
reg [23:0] resp14;
reg [23:0] resp15;

resp=0;
resp1=0;
resp2=0;
resp3=0;
resp4=0;
resp5=0;
resp6=0;
resp7=0;
resp8=0;
resp9=0;
resp10=0;
resp11=0;
resp12=0;
resp13=0;
resp14=0;
resp15=0;

resp = coef * m;
resp1 = coef1 * m1;
resp2 = coef2 * m2;
resp3 = coef3 * m3;
resp4 = coef4 * m4;
resp5 = coef5 * m5;
resp6 = coef6 * m6;
resp7 = coef7 * m7;
resp8 = coef8 * m8;
resp9 = coef9 * m9;
resp10 = coef10 * m10;
resp11 = coef11 * m11;
resp12 = coef12 * m12;
resp13 = coef13 * m13;
resp14 = coef14 * m14;
resp15 = coef15 * m15;


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

FIR SUT (
    .data_in(data_in),
    .clk(clk),
    .rst(rst),
    .contro(control),
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
    .coef1(coef10),
    .coef1(coef11),
    .coef1(coef12),
    .coef1(coef13),
    .coef1(coef14),
    .coef1(coef15),
    .data_filt_o(data_filt_o)
);


    data_in= 12'b111111111111;
    clk=1;
    rst=1;
    control=1;
    coef0 = 12'b111111111111; 
    coef1 = 12'b111111111111; 
    coef2 = 12'b111111111111; 
    coef3 = 12'b111111111111; 
    coef4 = 12'b111111111111; 
    coef5 = 12'b111111111111; 
    coef6 = 12'b111111111111; 
    coef7 = 12'b111111111111; 
    coef8 = 12'b111111111111; 
    coef9 = 12'b111111111111; 
    coef10 = 12'b111111111111;
    coef11 = 12'b111111111111;
    coef12 = 12'b111111111111;
    coef13 = 12'b111111111111;
    coef14 = 12'b111111111111;
    coef15 = 12'b111111111111;



    
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





    
    wire [11:0] coef0_int ;
    wire [11:0] coef1_int ;
    wire [11:0] coef2_int ;
    wire [11:0] coef3_int ;
    wire [11:0] coef4_int ;
    wire [11:0] coef5_int ;
    wire [11:0] coef6_int ;
    wire [11:0] coef7_int ;
    wire [11:0] coef8_int ;
    wire [11:0] coef9_int ;
    wire [11:0] coef10_int;
    wire [11:0] coef11_int;
    wire [11:0] coef12_int;
    wire [11:0] coef13_int;
    wire [11:0] coef14_int;
    wire [11:0] coef15_int;
    
    block_coef SUT (
        .coef_in(coef_in),
        .clk(clk),
        .rst(rst),
        .enable_8a12(enable_8a12),
        .coef0(coef0_int ),
        .coef1(coef1_int ),
        .coef2(coef2_int ),
        .coef3(coef3_int ),
        .coef4(coef4_int ),
        .coef5(coef5_int ),
        .coef6(coef6_int ),
        .coef7(coef7_int ),
        .coef8(coef8_int ),
        .coef9(coef9_int ),
        .coef10(coef10_int),
        .coef11(coef11_int),
        .coef12(coef12_int),
        .coef13(coef13_int),
        .coef14(coef14_int),
        .coef15(coef15_int)
);
    
    wire [15:0] data_filt_o;
    
    FIR SUT2 (
        .data_in(data_in),
        .clk(clk),
        .rst(rst),
        .control(control),
        .coef0(coef0_int ),
        .coef1(coef1_int ),
        .coef2(coef2_int ),
        .coef3(coef3_int ),
        .coef4(coef4_int ),
        .coef5(coef5_int ),
        .coef6(coef6_int ),
        .coef7(coef7_int ),
        .coef8(coef8_int ),
        .coef9(coef9_int ),
        .coef10(coef10_int),
        .coef11(coef11_int),
        .coef12(coef12_int),
        .coef13(coef13_int),
        .coef14(coef14_int),
        .coef15(coef15_int),
        .data_filt_o(data_filt_o)
    );


reg clk;
reg rst;
reg [11:0] data_in;
reg [11:0] coef_in;
reg pulsador_carga_coef_i;
reg send_i;
reg cambio_coef_i;
wire [15:0] dato_out;
wire led_full;

proyecto_v2 SUT(
.clk(clk),
.rst(rst),
.data_in(data_in),
.coef_in(coef_in),
.pulsador_carga_coef_i(pulsador_carga_coef_i),
.send_i(send_i),
.cambio_coef_i(cambio_coef_i),
.dato_out(dato_out),
.led_full(led_full)
);


    clk=0;
    rst=1;
    data_in = 12'd1;
    coef_in= -  12'd99; ;
    pulsador_carga_coef_i=1;
    send_i=0;
    cambio_coef_i=0;
#200
    rst=0;
    pulsador_carga_coef_i=1;
    cambio_coef_i=1;
#10
    cambio_coef_i=0;
