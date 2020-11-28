`timescale 1ns / 1ps
module Tx_uart(
    input clk_i,
    input rst_i,
    input [7:0] dato_tx_i,
    input enable_tx_i, // = Transmitir_o 
    output dato_serie_o
    );

    reg [10:0] trama;
    reg dato_o;
    reg [4:0] cont; // contar los bits enviados
    reg bit_p; // bit de paridad
    reg [4:0]clk_aux;

    assign dato_serie_o=dato_o;

    always @(posedge clk_i)begin 
        if(rst_i || !enable_tx_i ) begin
            dato_o  = 1;
            cont    = 16;
            clk_aux = 0;
        end else begin
            if (cont==16 && enable_tx_i==1) begin
                if(clk_aux<=11) begin
                    bit_p    = (^dato_tx_i);
                    trama    = {1'b1,bit_p,dato_tx_i[7:0],1'b0};
                    dato_o  <= trama[clk_aux];
                    clk_aux  = clk_aux+1;
                    cont     = 0;
                end 
                if (clk_aux==11) clk_aux = 0;         
            end            
            if (cont!=16 && enable_tx_i==1) cont = cont + 1;
       end
    end
endmodule