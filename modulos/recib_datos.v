`timescale 1ns / 1ps
module recib_datos(
    input rx_i,
    input verif_edg_i,
    input clk_i,
    input rst_i,
    output[9:0] trama,
    output dato_compl
    );
    
    reg [9:0] trama_aux;
    reg [4:0]  count;
    reg [4:0] clk_aux;
    reg dato_compl_aux;
    assign trama=trama_aux;
    assign dato_compl=dato_compl_aux;
    
    always @(posedge clk_i) begin
        if(!verif_edg_i || rst_i )begin
            count     = 0;
            clk_aux   = 0;
            trama_aux = 0;
            dato_compl_aux  = 0;
        end else begin                 
            if(count == 16) begin
                trama_aux[clk_aux]=rx_i;
                clk_aux = clk_aux+1;
                count = 0;
                dato_compl_aux = (clk_aux > 10) ? 1 : 0;
            end
            count = count + 1;           
        end
    end
    
endmodule

