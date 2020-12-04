`timescale 1ns / 1ps

module adc_fir_control_block_coef_TB();
`define     Tbit    (1000000000/(115200))
    
reg clk_100MHz=0;
reg rst;
reg pulsador_carga_coef_i;
reg send_i;
reg full_fifo_i;
reg empty_i;

wire led_full_o;
wire wr_o;
wire rd_o;

reg [11:0] coef_in;
reg cambio_coef_i;
wire [15:0]data_fir_mem_int;

adc_fir_control_block_coef SUT(
                            .clk_100MHz_i(clk_100MHz),
                            .rst_i(rst),
                            .pulsador_carga_coef_i(pulsador_carga_coef_i),
                            .send_i(send_i),
                            .full_fifo_i(full_fifo_i),
                            .empty_i(empty_i),
                            .led_full_o(led_full_o),
                            .wr_o(wr_o),
                            .rd_o(rd_o),
                            .coef_in(coef_in),
                            .cambio_coef_i(cambio_coef_i),
                            .data_fir_mem_int(data_fir_mem_int)        
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
        cambio_coef_i=0;
    #`Tbit; 
    #`Tbit;   
        
$finish;
end

endmodule
