`timescale 1ns / 1ps
module proyecto_v2(
        //Generales        
        input clk,
        input rst,
        
        //FIR
        input [11:0] data_in, //ADC
        
        //block_coef
        input [11:0]coef_in,
             
        //control                
        input pulsador_carga_coef_i, // pulsador : hablilitar escritura en la UART 
        input send_i,                // pulsador : inicia la transmision de datos a la PC 
        
        //8a12 
        input cambio_coef_i,
          
        //salidas
        output [15:0] dato_out,
        output led_full
    );          
                       
    wire en_recepcion_int;
    //wire cambio_coef_int;
    wire fin_block_coef_int;
    wire full_fifo_int;
    wire empty_int;
    wire wr_int; 
    wire rd_int;     
    wire en_fir_int;
    
    
   control SUT1(
                .clk_i(clk),
                .rst_i(rst),
                .pulsador_carga_coef_i(pulsador_carga_coef_i),  
                .send_i(send_i),
                .full_fifo_i(full_fifo_int),  
                .empty_i(empty_int),
                .fin_block_coef_i(fin_block_coef_int),
                .en_recepcion_o(en_recepcion_int),
                .led_full_o(led_full),
                .wr_o(wr_int), 
                .rd_o(rd_int),  
                .en_fir_o(en_fir_int) 
    );
    
    
      wire [11:0] coef0_int ;
      wire [11:0] coef1_int ;
      wire [11:0] coef2_int ;
      wire [11:0] coef3_int ;
      wire [11:0] coef4_int ;
      wire [11:0] coef5_int ;
      wire [11:0] coef6_int ;
      wire [11:0] coef7_int ;
      wire [11:0] coef8_int ;
      wire [11:0] coef9_int ;
      wire [11:0] coef10_int;
      wire [11:0] coef11_int;
      wire [11:0] coef12_int;
      wire [11:0] coef13_int;
      wire [11:0] coef14_int;
      wire [11:0] coef15_int;
            
      
      block_coef SUT2 (
                      .coef_in(coef_in),
                      .clk(clk),
                      .rst(rst),
                      .pulsador_carga_coef_i(pulsador_carga_coef_i),
                      .en_recepcion_i(en_recepcion_int),
                      .cambio_coef_i(cambio_coef_i),
                      .fin_block_coef_o(fin_block_coef_int),
                      .coef0(coef0_int ),
                      .coef1(coef1_int ),
                      .coef2(coef2_int ),
                      .coef3(coef3_int ),
                      .coef4(coef4_int ),
                      .coef5(coef5_int ),
                      .coef6(coef6_int ),
                      .coef7(coef7_int ),
                      .coef8(coef8_int ),
                      .coef9(coef9_int ),
                      .coef10(coef10_int),
                      .coef11(coef11_int),
                      .coef12(coef12_int),
                      .coef13(coef13_int),
                      .coef14(coef14_int),
                      .coef15(coef15_int)
       );
      
      wire [15:0] data_filt_int;
      
      FIR SUT3 (
              .data_in(data_in),
              .clk(clk),
              .rst(rst),
              .en_fir(en_fir_int),
              .coef0(coef0_int ),
              .coef1(coef1_int ),
              .coef2(coef2_int ),
              .coef3(coef3_int ),
              .coef4(coef4_int ),
              .coef5(coef5_int ),
              .coef6(coef6_int ),
              .coef7(coef7_int ),
              .coef8(coef8_int ),
              .coef9(coef9_int ),
              .coef10(coef10_int),
              .coef11(coef11_int),
              .coef12(coef12_int),
              .coef13(coef13_int),
              .coef14(coef14_int),
              .coef15(coef15_int),
              .data_filt_o(data_filt_int) 
      );        
    
     memoria SUT4 (
                   .clk(clk),              // input wire clk
                   .rst(rst),              // input wire srst
                   .dato_in(data_filt_int),// input wire [15 : 0] din
                   .wr_en(wr_int),         // input wire wr_en
                   .rd_en(rd_int),         // input wire rd_en
                   .dato_out(dato_out),    // output wire [15 : 0] dout
                   .full(full_fifo_int),   // output wire full
                   .empty(empty_int)       // output wire empty
     ); 
        
endmodule
