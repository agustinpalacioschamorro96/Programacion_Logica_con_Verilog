`timescale 1ns / 1ps

module filtro_TB();
`define     Tbit    (1000000000/(115200))
    
reg clk_100MHz=0;
reg rst;

reg pulsador_carga_coef_i;
reg send_i;
wire led_full_o;

reg [11:0] coef_in;
reg cambio_coef_i;
wire [15:0] dato_out_int;

filtro SUT(
                            .clk_100MHz_i(clk_100MHz),
                            .rst_i(rst),
                            .pulsador_carga_coef_i(pulsador_carga_coef_i),
                            .send_i(send_i),
                            .led_full_o(led_full_o),
                            .coef_in(coef_in),
                            .cambio_coef_i(cambio_coef_i),
                            .dato_o(dato_out_int)        
);


always
#5 clk_100MHz=~clk_100MHz;

initial begin
    //RESET GENERAL
        clk_100MHz=0;
        rst=1;
        
        pulsador_carga_coef_i=0;
        send_i=0;        
        
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
        cambio_coef_i=0; //279ns
//    #25000; //fifo
    #1040000; //RAM_fifo
//    #600000;
        send_i=1;
    #50;     
        send_i=0;
    #14000;
        send_i=1;
    #50;
        send_i=0;
    #1040000;     
        send_i=1;
    #50;
        send_i=0;
        
$finish;
end

endmodule

/*
1380ns************************
Se resetea hasta los 1380 ns luego

10us************************
pulsador_carga_coef_i = 1 hasta 10 us

270.795 ************************
por lo que en_recepcion_o = 1 -->  ya que fin_block_coef_i = 1 ---> en_fir_o en 270.795 us

286.08************************
full_fir_reg_i = 1 --> wr_o = 1 (write memory) en 286.08us

302.08************************
full_fifo_i =1 en 302.08 (con fifo de 16x1024) 
wr_o = 0
en_fir_o=0
full_fir_reg=0

304.14************************
send_i = 1 activo la lectura y descargo la memoria.
rd_o = 1
full_fifo_i =0
wr_o =0

304.345************************
empty_o = 1 
wr_o = 0

305 *************************
send_i = 1  --> Activo la escritura nuevamente y cargo la memoria

322 *************************
se completa la fifo nuevamente



*/