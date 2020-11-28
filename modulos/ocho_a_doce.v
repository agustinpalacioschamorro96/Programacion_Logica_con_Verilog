`timescale 1ns / 1ps

module ocho_a_doce(
    input signed [7:0] componente_coef,
    input control,
    input dato_listo,
    input rst,        
    input clk,
    output [11:0] coeficiente 
    );
    
//  ALWAYS SINCRONO
    reg [4:0] count_coef;
    reg [4:0] count_coef_ant;    
    reg [11:0] coeficiente_aux;
    reg [4:0] temporizador;

// ALWAYS ASINCRONO    
    reg [3:0] op_code;
    reg [11:0] coeficiente_op;
    reg [9:0] decimal_aux;
    reg error;
         
    assign coeficiente = coeficiente_aux;
    
    always @(posedge clk) begin    
        if (rst || !control) begin
            coeficiente_aux = 0;
            temporizador=0;
        end else begin
            if (control) begin
                case (op_code)
                    1:  begin
                        coeficiente_aux = coeficiente_op;
                        temporizador = temporizador +1;
                        end
                    2:  begin
                        end
                endcase        
            end
        end
    end
    
    always @(posedge dato_listo,posedge rst)begin
        if (rst)begin
            coeficiente_op=0;
            op_code=0;
            decimal_aux=1;
            error=0;
        end else begin
            //si recibo una c (por "Cambio") entonces paso el dato
            if(componente_coef == "c")begin
                op_code=1;
            //armo el coeficiente                
            end else if((componente_coef>=47)&&(componente_coef<=57)) begin
                 coeficiente_op = coeficiente_op +(componente_coef - "0")*decimal_aux;
                 decimal_aux=decimal_aux*10;
            end else if() begin
            end
            end else begin
                error=1;
            end
        end
    end
    
endmodule
