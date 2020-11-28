`timescale 1ns / 1ps
module rx_uart(
    input rx_i,
    input clk_i,
    input rst_i,
    output [7:0] dato_recibido_o,
    output dato_listo_o
    );
    
    wire verif_edg_int;
    wire [9:0] trama_int;
    wire dato_compl_int;
    
    wire rst_check_int;
    wire rst_det_int;
    assign rst_det_int = rst_check_int | rst_i ;
    
    
    det_start S1 (  .rx_i(rx_i),
                    .clk_i(clk_i),
                    .rst_i(rst_det_int),
                    .verif_edg(verif_edg_int));

    recib_datos S2 (.rx_i(rx_i),
                    .verif_edg_i(verif_edg_int),
                    .clk_i(clk_i),
                    .rst_i(rst_i),
                    .trama(trama_int),
                    .dato_compl(dato_compl_int) );

     check_dato S3 ( .trama_i(trama_int),
                     .dato_compl_i(dato_compl_int),
                     .rst_i(rst_i),
                     .clk_i(clk_i),
                     .dato_recibido_o(dato_recibido_o),
                     .dato_listo_o(dato_listo_o),
                     .rst_o(rst_check_int));

endmodule