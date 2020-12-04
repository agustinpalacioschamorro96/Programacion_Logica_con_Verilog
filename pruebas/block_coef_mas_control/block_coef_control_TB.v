`timescale 1ns / 1ps

module block_coef_control_TB();

`define     Tbit    (1000000000/(115200))  // Este modulo será controlado mediante el clock de la UART
    
reg clk_100MHz=0;
reg rst;
reg pulsador_carga_coef_i;
reg send_i;
reg full_fifo_i;
reg empty_i;

wire led_full_o;
wire wr_o;
wire rd_o;
wire en_fir_o;

reg [11:0] coef_in;
reg cambio_coef_i;

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

block_coef_control SUT(
                    .clk_100MHz_i(clk_100MHz),
                    .rst_i(rst),
                    .pulsador_carga_coef_i(pulsador_carga_coef_i),
                    .send_i(send_i),
                    .full_fifo_i(full_fifo_i),
                    .empty_i(empty_i),
                    .led_full_o(led_full_o),
                    .wr_o(wr_o),
                    .rd_o(rd_o),
                    .en_fir_o(en_fir_o),
                    
                    .coef_in(coef_in),
                    .cambio_coef_i(cambio_coef_i),
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
#5 clk_100MHz=~clk_100MHz;

initial begin
    //RESET GENERAL
        clk_100MHz=0;
        rst=1;
        
        pulsador_carga_coef_i=0;
        send_i=0;        
        full_fifo_i=0;
        empty_i=0;
        
        coef_in= -  12'd99; ;
        cambio_coef_i=0;
    #1380
        rst=0;
        pulsador_carga_coef_i=1;        
    #`Tbit;
    //CARGA DE COEFICIENTES
                                     //Coef 0
        pulsador_carga_coef_i=0;
        cambio_coef_i=1;
    #`Tbit;
        cambio_coef_i=0;        
    #`Tbit;
        coef_in= 12'd65;        //Coef 1
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= 12'd136;       //Coef 2
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= 12'd33;        //Coef 3
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= -  12'd156;    //Coef 4
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= -  12'd86;     //Coef 5
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;        
    #`Tbit;
        coef_in= 12'd376;       //Coef 6
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= 12'd854;       //Coef 7
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;          
        coef_in= 12'd854;       //Coef 8
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in=12'd376;        //Coef 9
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= - 12'd86;        //Coef 10
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= -  12'd156;        //Coef 11
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;
        coef_in= 12'd33;        //Coef 12
        cambio_coef_i=1;                  
    #`Tbit;  
        cambio_coef_i=0;
    #`Tbit;
        coef_in= 12'd136;        //Coef 13
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;      
        coef_in= 12'd65;        //Coef 14
        cambio_coef_i=1;                  
    #`Tbit;
        cambio_coef_i=0;
    #`Tbit;      
        coef_in=-  12'd99;        //Coef 15
        cambio_coef_i=1;                  
    #`Tbit;
    #`Tbit;    
        
$finish;
end

endmodule

/*OBSERVACIONES:
la escritura de la fifo está activada desde un comienzo, multiplexar la escritura de la fifo entre 0 y ready, primer idea para escrbir

Se espera que una vez cargado los coeficientes fin_block_coef=1 que da aviso a control y este habilite al filtro con en_fir_o=1
La diferencia de tiempo en que en_fir_o=1 y la carga del coef15 es mínima 


CLOCKS:
        -Todos los clocks se estabilizan luego de 1380 ns
        -Se modificó clock de 78MHz quitandole la señal de rst_o por rst_clk=0, de esta manera los clocks se estabilizan todos en 1270
        -

CONTROL: 
        -Se debe mantener pulsador_carga_coef = 1 durante dos tiempos de clock
        -
        

*/
