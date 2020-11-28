`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module check_dato(
     input [9:0] trama_i,
     input dato_compl_i,
     input rst_i,
     input clk_i,
     output [7:0] dato_recibido_o,
     output dato_listo_o,
     output rst_o
);
 
    reg [7:0] trama_aux;    
    reg dato_listo_aux;
    reg rst_aux;
    reg flag_error;
    reg [4:0] count;

    assign dato_recibido_o = trama_aux;
    assign dato_listo_o = dato_listo_aux;
    assign rst_o = rst_aux;

    always @(posedge clk_i) begin
        //Señal de reset.
        if(rst_i)begin
            count      = 0;
            trama_aux  = 0;
            flag_error = 0;
            rst_aux    = 0;
            dato_listo_aux =0;
        end else begin            
            //En caso de no recibir solicitud de envío
            if(!dato_compl_i)begin                        
                rst_aux     = 0;
                flag_error  = 0;          
            //Si recibí solicitud de envío de dato entonces se procede a chequear el dato y habilitar nuevamente el receptor
            end else begin
                flag_error = ( trama_i[9] == 0 )              ? 1 : 0;   //bit stop
                trama_aux  = {trama_i[7:0]};                             //Paridad
                flag_error = ( (^trama_aux) == (trama_i[8]) ) ? 0 : 1;
                //Si flag error no indica error se procede a habilitar el envío del dato
                if(!flag_error)begin                                     
                    trama_aux      = trama_aux;
                    dato_listo_aux = 1;
                    count          = 16; //Tiempo en que dejo la trama para el contestador
                end
                //Una vez que termina el proceso de chequeo habilito nuevamente receptor con un reset general
                rst_aux = 1;                      
            end
           //Envío del dato si fue habilitado el contador. El dato permanecerá habilitado durante 16 períodos de clock.
           if(count > 0) begin
                trama_aux       = trama_aux;            
                dato_listo_aux  = 1;
                count  =  count - 1;
           //Si el envío ha terminado o nunca fue habilitado mantengo por default los siguientes valores.
            end else begin
                trama_aux       = 0;
                dato_listo_aux  = 0;
                count           = 0;
            end             
        end      
    end
        
endmodule