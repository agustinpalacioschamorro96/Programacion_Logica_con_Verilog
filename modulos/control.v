`timescale 1ns / 1ps

module control(
    input clk_i,
    input rst_i,    
    input en_uart_i, // pulsador : hablilitar escritura en la UART 
    input send_i,    // pulsador : inicia la transmision de datos a la PC                  
    input full_i,    // proveniente de la FIFO : indica que esta llena    
    input empty_i,   // proveniente de la FIFO : indica que esta vacia
    
    input fin_block_coef_i, // Ya se cargaron todos los coeficientes 
    //input c_listo_i, // proveniente de 8a12 : p/contar los coeficientes
     
    output en_recepcion_o, // habilita el almacenamiento de coeficientes(8_12 y block_coef)
    output full_o,       // enciende un LED del kit p/indicar memoria llena
    
    output en_uart_o,// habilita escritura y transmision en la UART
    output wr_o,     // habilita la escritura de la FIFO
    output rd_o,     // habilita la lectura de la FIFO    
    output en_fir_o  // habilita el filtro FIR
    );
    
    // UART
    reg uart_o;
    reg enable; 
    reg [4:0] contC;
    // FIFO
    reg write;
    reg read;
    reg led;
    //COEF
    reg en_rx;
    // FIR
    reg en_fir;
    
    // UART
    assign en_uart_o = uart_o;
    // FIFO
    assign wr_o   = write;
    assign rd_o   = read;
    assign full_o = led;
    // COEFF
    assign en_recepcion_o = en_rx;
    //FIR
    assign en_fir_o =en_fir;
    
    always @(posedge clk_i) begin
        if (rst_i) begin
            contC  =0;
            enable =0;
            led    =0;
            en_fir =0;
            en_rx=0;
        // habilitar escritura de la UART y coeff
        end if (en_uart_i) begin 
            enable =1;
            uart_o =(enable)? 1 : 0;
            en_coef =(enable)? 1 : 0;
        // deshabilitar escritura de la UART cuando se ingresen los 16 coeficientes , coeff y habilitar el filtro FIR
        end if (contC==15) begin 
            enable =0;
            contC  =0;
            en_fir=1;
        // contar los 16 coeficientes
        end if (c_listo_i) begin // c_listo_i es 1 duranto 1 tiempo de clock 
            contC =contC+1;
        // si full_i no esta llena se habilita la escritura 
        end if (!full_i) begin
            write =1;
            read  =0;
            led   =0;                 
        // si full_i esta llena se deshabilita la escritura de la FIFO y deshabilita FIR
        end if (full_i) begin
            write =0;
            read  =0;
            led   =1; // puede salir de la FIFO
            en_fir=0;
        // si se pulsa send_i mientras la memoria esta llena -> se activa la lectura y se apaga el led
        end if (full_i && send_i) begin
            write =0;
            read  =1;
            uart_o=1; // se habilita la UART p-transmision
            led   =0;
        // si se pulsa send_i mientras la memoria esta vacia -> se activa la escritura y el filtro FIR
        end if (empty_i && send_i) begin
            write =1;
            read  =0;
            en_fir=1;
        end
    
    end
    
endmodule
