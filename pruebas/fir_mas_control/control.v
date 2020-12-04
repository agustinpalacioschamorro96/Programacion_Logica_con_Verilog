module control(
    input clk_i,
    input rst_i,    
    input pulsador_carga_coef_i, // pulsador : hablilitar escritura en la UART 
    input send_i,                // pulsador : inicia la transmision de datos a la PC                  
    input full_fifo_i,           // proveniente de la FIFO : indica que esta llena    
    input empty_i,               // proveniente de la FIFO : indica que esta vacia
    input fin_block_coef_i,      // Ya se cargaron todos los coeficientes  
    output en_recepcion_o,       // habilita el almacenamiento de coeficientes(8_12 y block_coef)
    output led_full_o,           // enciende un LED del kit p/indicar memoria llena
    output wr_o,                 // habilita la escritura de la FIFO
    output rd_o,                 // habilita la lectura de la FIFO    
    output en_fir_o              // habilita el filtro FIR
    );
    
    // Recepcion
    reg enable;
    reg en_rx;
    reg en_fir; 
    // FIFO
    reg write;
    reg read;
    reg led;

    // FIFO
    assign wr_o   = write;
    assign rd_o   = read;
    assign led_full_o = led;
    // Recepcion
    assign en_recepcion_o = en_rx;
    //FIR
    assign en_fir_o =en_fir;
    
    always @(posedge clk_i) begin
        if (rst_i) begin
            enable =0;
            led    =0;
            en_fir =0;
            en_rx  =0;
         // habilitar recepcion
         end if (pulsador_carga_coef_i) begin
            enable =1;
            en_rx  =(enable)? 1 : 0;
         // cuando se ingresen los 16 coeficientes deshabilitar el coeff, 8a12 y habilitar el filtro FIR
         end if (fin_block_coef_i) begin 
             enable =0;
             en_fir=1;
         // si full_i no esta llena se habilita la escritura 
         end if (!full_fifo_i) begin
            write =1;
            read  =0;
            led   =0;                 
        // si full_i esta llena se deshabilita la escritura de la FIFO y deshabilita FIR
         end if (full_fifo_i) begin
            write =0;
            read  =0;
            led   =1; // puede salir de la FIFO
            en_fir=0;
        // si se pulsa send_i mientras la memoria esta llena -> se activa la lectura y se apaga el led
         end if (full_fifo_i && send_i) begin
            write =0;
            read  =1;
            led   =0;
        // si se pulsa send_i mientras la memoria esta vacia -> se activa la escritura y el filtro FIR
         end if (empty_i && send_i) begin
            write =1;
            read  =0;
            en_fir=1;
        end    
    end
endmodule
