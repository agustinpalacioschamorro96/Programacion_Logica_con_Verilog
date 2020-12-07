module control_v2(
    input clk_i,
    input rst_i,    
    input pulsador_carga_coef_i, // pulsador : hablilitar escritura en la UART 
    input send_i,                // pulsador : inicia la transmision de datos a la PC                  
    input full_fifo_i,           // proveniente de la FIFO : indica que esta llena    
    input empty_i,               // proveniente de la FIFO : indica que esta vacia
    input fin_block_coef_i,      // Ya se cargaron todos los coeficientes  
    input full_fir_reg_i,       // proveniente del FIR : indica que se llenaron los registros.
    output en_recepcion_o,       // habilita el almacenamiento de coeficientes(8_12 y block_coef)
    output led_full_o,           // enciende un LED del kit p/indicar memoria llena
    output wr_o,                 // habilita la escritura de la FIFO
    output rd_o,                 // habilita la lectura de la FIFO    
    output en_fir_o              // habilita el filtro FIR
    );
    
    // Recepcion
    reg enable_recepcion_aux;
    reg en_recepcion;
    reg en_fir_aux; 
    // FIFO
    reg write;
    reg read;
    reg led;

    // FIFO
    assign wr_o   = write;
    assign rd_o   = read;
    assign led_full_o = led;
    // Recepcion
    assign en_recepcion_o = en_recepcion;
    //FIR
    assign en_fir_o =en_fir_aux;
    
    always @(posedge clk_i) begin
        if (rst_i) begin
            enable_recepcion_aux =0;
            write=0;
            read=0;            
            led    =0;
            en_fir_aux =0;
            en_recepcion  =0;
         // habilitar recepcion
        end else begin
            if (pulsador_carga_coef_i) begin
                enable_recepcion_aux =1;
                en_fir_aux=0;
                en_recepcion  =(enable_recepcion_aux)? 1 : 0;
            // cuando se ingresen los 16 coeficientes deshabilitar el coeff, 8a12 y habilitar el filtro FIR
            end if (fin_block_coef_i) begin 
                enable_recepcion_aux =0;
                en_fir_aux=1;
            // si full_i no esta llena se habilita la escritura 
            end if (full_fir_reg_i && !full_fifo_i) begin
                write =1;
                read  =0;
                led   =0;                 
            // si full_i esta llena se deshabilita la escritura de la FIFO y deshabilita FIR
            end if (full_fifo_i) begin                
                write =0;
                read  =0;
                led   =1; // puede salir de la FIFO
                en_fir_aux=0;
            // si se pulsa send_i mientras la memoria esta llena -> se activa la lectura y se apaga el led
            end if (full_fifo_i && send_i) begin
                write =0;
                read  =1;
                led   =0;
            // si se pulsa send_i mientras la memoria esta vacia -> se activa la escritura y el filtro FIR
            end if (empty_i && send_i) begin
                write =1;
                read  =0;
                en_fir_aux=1;
            end   
        end 
    end
endmodule