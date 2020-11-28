`timescale 1ns / 1ps

module proyecto_v2_TB();

reg clk;
reg rst;
reg [11:0] data_in;
reg [11:0] coef_in;
reg pulsador_carga_coef_i;
reg send_i;
reg cambio_coef_i;
wire [15:0] dato_out;
wire led_full;

proyecto_v2 SUT( .clk(clk),
                .rst(rst),
                .data_in(data_in),
                .coef_in(coef_in),
                .pulsador_carga_coef_i(pulsador_carga_coef_i),
                .send_i(send_i),
                .cambio_coef_i(cambio_coef_i),
                .dato_out(dato_out),
                .led_full(led_full)
);

always
#5 clk=~clk;

initial begin
    //RESET GENERAL
        clk=0;
        rst=1;
        data_in = 12'd1;
        coef_in= -  12'd99; ;
        pulsador_carga_coef_i=0;
        send_i=0;
        cambio_coef_i=0;
    #200
        rst=0;
        pulsador_carga_coef_i=1;
        cambio_coef_i=1;
    //CARGA DE COEFICIENTES
    #5                             //Coef 0
        pulsador_carga_coef_i=0;
        cambio_coef_i=0;        
    #5
        coef_in= 12'd65;        //Coef 1
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= 12'd136;       //Coef 2
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= 12'd33;        //Coef 3
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= -  12'd156;    //Coef 4
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= -  12'd86;     //Coef 5
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;        
    #5
        coef_in= 12'd376;       //Coef 6
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= 12'd854;       //Coef 7
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5          
        coef_in= 12'd854;       //Coef 8
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in=12'd376;        //Coef 9
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= - 12'd86;        //Coef 10
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= -  12'd156;        //Coef 11
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5
        coef_in= 12'd33;        //Coef 12
        cambio_coef_i=1;                  
    #5  
        cambio_coef_i=0;
    #5
        coef_in= 12'd136;        //Coef 13
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5      
        coef_in= 12'd65;        //Coef 14
        cambio_coef_i=1;                  
    #5
        cambio_coef_i=0;
    #5      
        coef_in=-  12'd99;        //Coef 15
        cambio_coef_i=1;                  
    #5    
    //Nunca se activó el fin_block_coef_o
$finish;
end
endmodule
