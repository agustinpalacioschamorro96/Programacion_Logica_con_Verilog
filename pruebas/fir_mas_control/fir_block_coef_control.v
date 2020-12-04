`timescale 1ns / 1ps

module fir_block_coef_control(
        input clk_100MHz_i,
        input rst_i,    
        
        //control
        input pulsador_carga_coef_i, // pulsador : hablilitar escritura en la UART 
        input send_i,                // pulsador : inicia la transmision de datos a la PC                  
        input full_fifo_i,           // proveniente de la FIFO : indica que esta llena    
        input empty_i,               // proveniente de la FIFO : indica que esta vacia
        output led_full_o,           // enciende un LED del kit p/indicar memoria llena
        output wr_o,                 // habilita la escritura de la FIFO
        output rd_o,                 // habilita la lectura de la FIFO    

        //Block Coef
        input [11:0] coef_in,
        input cambio_coef_i,         //Señal que indica que un nuevo coeficiente va a entrar
        
        //FIR
        input [11:0] data_adc_fir_int,
        input ready_int,
        
        output [15:0] data_fir_mem_int
);

wire clk_uart_int;
wire clk_78MHz_int;
    clocks SUT1(
            .clk_100MHz_i(clk_100MHz_i),
            .rst_i(rst_i),
            .clk_uart_o(clk_uart_int),
            .clk_78MHz_o(clk_78MHz_int)
    );
    
wire en_recepcion_int;
wire fin_block_coef_int;
wire full_fifo_int;
wire empty_int;
wire wr_int; 
wire rd_int;     
wire en_fir_int;  
        control SUT2(
                    .clk_i(clk_100MHz_i),
                    .rst_i(rst_i),
                    .pulsador_carga_coef_i(pulsador_carga_coef_i),  
                    .send_i(send_i),
                    .full_fifo_i(full_fifo_i),  
                    .empty_i(empty_i),
                    .fin_block_coef_i(fin_block_coef_int),
                    .en_recepcion_o(en_recepcion_int),
                    .led_full_o(led_full_o),
                    .wr_o(wr_o), 
                    .rd_o(rd_o),  
                    .en_fir_o(en_fir_int) 
);
    
    
    
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

block_coef SUT3 (
                    .coef_in(coef_in),
                    .clk(clk_uart_int),
                    .rst(rst_i),
                    .pulsador_carga_coef_i(pulsador_carga_coef_i),
                    .en_recepcion_i(en_recepcion_int),
                    .cambio_coef_i(cambio_coef_i),
                    .fin_block_coef_o(fin_block_coef_int),
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
     
FIR SUT4(
            .data_in(data_adc_fir_int),
            .clk_78MHz(clk_78MHz_int),
            .rst(rst_i),
            .en_fir_i(en_fir_int),
            .ready_i(ready_int),
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
            .data_fir_o(data_fir_mem_int) 
);     
     
      
endmodule
