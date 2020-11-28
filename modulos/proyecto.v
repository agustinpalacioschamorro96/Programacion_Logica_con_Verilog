`timescale 1ns / 1ps
module proyecto(
        input [11:0] data_in, //ADC
        input clk,
        input rst,
        input control,
        input [11:0] coef0,
        input [11:0] coef1,
        input [11:0] coef2,
        input [11:0] coef3,
        input [11:0] coef4,
        input [11:0] coef5,
        input [11:0] coef6,
        input [11:0] coef7,
        input [11:0] coef8,
        input [11:0] coef9,
        input [11:0] coef10,
        input [11:0] coef11,
        input [11:0] coef12,
        input [11:0] coef13,
        input [11:0] coef14,
        input [11:0] coef15,
        
        //Memoria
        input wr_en,
        input rd_en,
        output [15:0] dato_out,
        output full,
        output empty
    );
    
    wire [15:0] data_filt_o;
    
    FIR SUT1 (
        .data_in(data_in),
        .clk(clk),
        .rst(rst),
        .control(control),
        .coef0(coef0 ),
        .coef1(coef1 ),
        .coef2(coef2 ),
        .coef3(coef3 ),
        .coef4(coef4 ),
        .coef5(coef5 ),
        .coef6(coef6 ),
        .coef7(coef7 ),
        .coef8(coef8 ),
        .coef9(coef9 ),
        .coef10(coef10),
        .coef11(coef11),
        .coef12(coef12),
        .coef13(coef13),
        .coef14(coef14),
        .coef15(coef15),
        .data_filt_o(data_filt_o)
    );
    
    
    
     memoria SUT2 (
       .clk(clk),         // input wire clk
       .rst(rst),        // input wire srst
       .dato_in(data_filt_o),     // input wire [15 : 0] din
       .wr_en(wr_en),     // input wire wr_en
       .rd_en(rd_en),     // input wire rd_en
       .dato_out(dato_out),   // output wire [15 : 0] dout
       .full(full),       // output wire full
       .empty(empty)      // output wire empty
     );
    
    
endmodule
