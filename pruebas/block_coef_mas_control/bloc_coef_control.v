`timescale 1ns / 1ps

module block_coef_control(
    input clk_100MHz_i,
    input rst_i,    
    input pulsador_carga_coef_i, // pulsador : hablilitar escritura en la UART 
    input send_i,                // pulsador : inicia la transmision de datos a la PC                  
    input full_fifo_i,           // proveniente de la FIFO : indica que esta llena    
    input empty_i,               // proveniente de la FIFO : indica que esta vacia
    output led_full_o,           // enciende un LED del kit p/indicar memoria llena
    output wr_o,                 // habilita la escritura de la FIFO
    output rd_o,                 // habilita la lectura de la FIFO    
    output en_fir_o,              // habilita el filtro FIR 
    
    //Block Coef
    input [11:0] coef_in,
    input cambio_coef_i,         //Señal que indica que un nuevo coeficiente va a entrar
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
    output [11:0] coef15
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
                    .en_fir_o(en_fir_o) 
        );
      
        

  
    block_coef SUT3 (
                    .coef_in(coef_in),
                    .clk(clk_uart_int),
                    .rst(rst_i),
                    .pulsador_carga_coef_i(pulsador_carga_coef_i),
                    .en_recepcion_i(en_recepcion_int),
                    .cambio_coef_i(cambio_coef_i),
                    .fin_block_coef_o(fin_block_coef_int),
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

endmodule
