`timescale 1ns / 1ps

module adc_memoria_TB( );
    reg CLK100MHZ=0;
    reg rst_i;
    reg wr_en_i;
    reg rd_en_i;
    wire [15:0] dato_o;
    wire full_o;
    wire empty_o;
    
adc_memoria SUT(
    .clk_100MHz_i(CLK100MHZ),
    .rst_i(rst_i),
    .wr_en_i(wr_en_i),
    .rd_en_i(rd_en_i),
    .dato_o(dato_o),
    .full_o(full_o),
    .empty_o(empty_o)
    );
    
always 
#5 CLK100MHZ = !CLK100MHZ; 

initial
begin
        CLK100MHZ = 0;
        rst_i = 1;       //Reseteo por 200ns
        wr_en_i=0;
        rd_en_i=0;
    #3000;
        wr_en_i=1;             
        rst_i = 0;
    #1030000;
        wr_en_i=0;
        rd_en_i=1;
    #24000;
        wr_en_i=1;
        rd_en_i=0;
    #10000;
        rd_en_i=1;
    #2000;
     
     
     $finish;

end      
endmodule

//FIFO de 16x1024
