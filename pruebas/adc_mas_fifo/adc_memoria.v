`timescale 1ns / 1ps

module adc_memoria(
input clk_100MHz_i,
input rst_i,  
input wr_en_i,
input rd_en_i,
output [15:0] dato_o,
output full_o,
output empty_o

    );
    
wire clk_uart_int;
wire clk_78MHz_int;

    clocks SUT1(
        .clk_100MHz_i(clk_100MHz_i),
        .rst_i(rst_i),
        .clk_uart_o(clk_uart_int),
        .clk_78MHz_o(clk_78MHz_int)
    );    
    
    
wire ready_int;
wire [15:0] data_adc_fir_int;
    adc_para_memoria SUT2 (
        .clk_78MHz_i(clk_78MHz_int),
        .reset_i(rst_i),
        .data_o(data_adc_fir_int),
        .ready_o(ready_int)
    );
    
    
    
    memoria SUT3 (
        .clk_i(clk_78MHz_int),
        .rst_i(rst_i),
        .dato_in_i(data_adc_fir_int),
        .wr_en_i(wr_en_i),
        .rd_en_i(rd_en_i),
        .ready_i(ready_int),
        .dato_o(dato_o),
        .full_o(full_o),
        .empty_o(empty_o)
    );


endmodule
