`timescale 1ns / 1ps
module block_coef(
    input [11:0] coef_in,
    input clk,
    input rst,
    input pulsador_carga_coef_i,
    input en_recepcion_i,
    input cambio_coef_i,
    output fin_block_coef_o,
    output [11:0] coef0, 
    output [11:0] coef1, 
    output [11:0] coef2, 
    output [11:0] coef3, 
    output [11:0] coef4, 
    output [11:0] coef5, 
    output [11:0] coef6, 
    output [11:0] coef7, 
    output [11:0] coef8, 
    output [11:0] coef9, 
    output [11:0] coef10, 
    output [11:0] coef11, 
    output [11:0] coef12, 
    output [11:0] coef13, 
    output [11:0] coef14, 
    output [11:0] coef15
    );
    
    reg [5:0] count;
    reg fin_block_coef;
    assign  fin_block_coef_o = fin_block_coef;
    
    reg [11:0] coef0_aux;  assign coef0 = coef0_aux;
    reg [11:0] coef1_aux;  assign coef1 = coef1_aux;
    reg [11:0] coef2_aux;  assign coef2 = coef2_aux;
    reg [11:0] coef3_aux;  assign coef3 = coef3_aux;
    reg [11:0] coef4_aux;  assign coef4 = coef4_aux;
    reg [11:0] coef5_aux;  assign coef5 = coef5_aux;
    reg [11:0] coef6_aux;  assign coef6 = coef6_aux;
    reg [11:0] coef7_aux;  assign coef7 = coef7_aux;
    reg [11:0] coef8_aux;  assign coef8 = coef8_aux;
    reg [11:0] coef9_aux;  assign coef9 = coef9_aux;
    reg [11:0] coef10_aux; assign coef10 = coef10_aux;
    reg [11:0] coef11_aux; assign coef11 = coef11_aux;
    reg [11:0] coef12_aux; assign coef12 = coef12_aux;
    reg [11:0] coef13_aux; assign coef13 = coef13_aux;
    reg [11:0] coef14_aux; assign coef14 = coef14_aux;
    reg [11:0] coef15_aux; assign coef15 = coef15_aux;
    
    always @(posedge clk)begin
        if (rst || pulsador_carga_coef_i) begin
            fin_block_coef = 0;
            coef0_aux = 0 ;
            coef1_aux = 0 ;
            coef2_aux = 0 ;
            coef3_aux = 0 ;
            coef4_aux = 0 ;
            coef5_aux = 0 ;
            coef6_aux = 0 ;
            coef7_aux = 0 ;
            coef8_aux = 0 ;
            coef9_aux = 0 ;
            coef10_aux = 0 ;
            coef11_aux = 0 ;
            coef12_aux = 0 ;
            coef13_aux = 0 ;
            coef14_aux = 0 ;
            coef15_aux = 0 ;
        end else begin
            if (en_recepcion_i) begin
                if (count<=16) begin
                    case (count)
                    1 : coef0_aux=coef_in;
                    2 : coef1_aux=coef_in;
                    3 : coef2_aux=coef_in;
                    4 : coef3_aux=coef_in;
                    5 : coef4_aux=coef_in;
                    6 : coef5_aux=coef_in;
                    7 : coef6_aux=coef_in;
                    8 : coef7_aux=coef_in;
                    9 : coef8_aux=coef_in;
                    10 : coef9_aux=coef_in;
                    11 : coef10_aux=coef_in;
                    12 : coef11_aux=coef_in;
                    13 : coef12_aux=coef_in;
                    14 : coef13_aux=coef_in;
                    15 : coef14_aux=coef_in;
                    16 : coef15_aux=coef_in;
                   // default: count=0;                
                    endcase   
                end
                fin_block_coef = (count == 16 )? 1 : 0 ;                           
            end               
        end     
    end
    
    always@(posedge cambio_coef_i, posedge rst)begin
        if(rst) count = 0;
        count = count+1;        
    end
    
endmodule
