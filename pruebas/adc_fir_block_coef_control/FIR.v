`timescale 1ns / 1ps

module FIR(
        input [11:0] data_in, //ADC
        input clk_78MHz,
        input rst,
        input en_fir_i,
        input ready_i,
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
        output [15:0] data_fir_o
    );
       
    reg [11:0] m;
    reg [11:0] m1;
    reg [11:0] m2;
    reg [11:0] m3;
    reg [11:0] m4;
    reg [11:0] m5;
    reg [11:0] m6;
    reg [11:0] m7;
    reg [11:0] m8;
    reg [11:0] m9;
    reg [11:0] m10;
    reg [11:0] m11;
    reg [11:0] m12;
    reg [11:0] m13;
    reg [11:0] m14;
    reg [11:0] m15;
    
    reg [23:0] resp;
    reg [23:0] resp1;
    reg [23:0] resp2;
    reg [23:0] resp3;
    reg [23:0] resp4;
    reg [23:0] resp5;
    reg [23:0] resp6;
    reg [23:0] resp7;
    reg [23:0] resp8;
    reg [23:0] resp9;
    reg [23:0] resp10;
    reg [23:0] resp11;
    reg [23:0] resp12;
    reg [23:0] resp13;
    reg [23:0] resp14;
    reg [23:0] resp15;
    
    reg [4:0]  count_sample;
    reg [27:0] resS;
    reg [15:0] resT;    
    reg full;
    
    assign data_fir_o =resT;
    
    always @(negedge clk_78MHz)begin
        if (rst || !en_fir_i) begin
            count_sample<=0;
            full <= 0;
            resS<=27'b0;
            resT<=0;
            
            m<=0;
            m1<=0;
            m2<=0;
            m3<=0;
            m4<=0;
            m5<=0;
            m6<=0;
            m7<=0;
            m8<=0;
            m9<=0;
            m10<=0;
            m11<=0;
            m12<=0;
            m13<=0;
            m14<=0;
            m15<=0;
            
            resp<=0;
            resp1<=0;
            resp2<=0;
            resp3<=0;
            resp4<=0;
            resp5<=0;
            resp6<=0;
            resp7<=0;
            resp8<=0;
            resp9<=0;
            resp10<=0;
            resp11<=0;
            resp12<=0;
            resp13<=0;
            resp14<=0;
            resp15<=0;
            
        end else begin
            if (en_fir_i) begin
                if(ready_i)begin
                    m <= data_in;
                    m1<=m;
                    m2<=m1;
                    m3<=m2;
                    m4<=m3;
                    m5<=m4;
                    m6<=m5;
                    m7<=m6;
                    m8<=m7;
                    m9<=m8;
                    m10<=m9;
                    m11<=m10;
                    m12<=m11;
                    m13<=m12;
                    m14<=m13;
                    m15<=m14;  
                    count_sample <=  (count_sample + 1) ;
                    full <=  (count_sample < 15) ? 0 : 1 ;          
                end
                if (full) begin
                    resp   <= coef0   * m ;
                    resp1  <= coef1   * m1;
                    resp2  <= coef2   * m2;
                    resp3  <= coef3   * m3;
                    resp4  <= coef4   * m4;
                    resp5  <= coef5   * m5;
                    resp6  <= coef6   * m6;
                    resp7  <= coef7   * m7;
                    resp8  <= coef8   * m8;
                    resp9  <= coef9   * m9;
                    resp10 <= coef10 * m10;
                    resp11 <= coef11 * m11;
                    resp12 <= coef12 * m12;
                    resp13 <= coef13 * m13;
                    resp14 <= coef14 * m14;
                    resp15 <= coef15 * m15;
                    resS   <= resp + resp1 + resp2 + resp3 + resp4 + resp5 + resp6 + resp7 + resp8 +resp9 + resp10 + resp11 + resp12 + resp13 + resp14 + resp15;
                    resT   <= resS[27:11];
                end    
            end
        end
    end

endmodule
