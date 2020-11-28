`timescale 1ns / 1ps

module ADC_TB();

    reg   CLK100MHZ;
    reg   reset_i;
    wire  locked_o;
    wire  clk_o;
    reg   vaux6_p;
    reg   vaux6_n;
    wire  [15:0] data_o;
    wire eoc_o;

ADC SUT(
    .CLK100MHZ(CLK100MHZ),
    .reset_i(reset_i),
    .locked_o(locked_o),
    .clk_o(clk_o),
    .vaux6_p(vaux6_p),
    .vaux6_n(vaux6_n),
    .data_o(data_o),
    .eoc_o(eoc_o)
    );
   
        
  // parameter PERIOD = 10;

   always 
 #5 CLK100MHZ = !CLK100MHZ; 
   
   initial
   begin
        CLK100MHZ = 0;
        reset_i = 1;       //Reseteo por 200ns
        #200               
        reset_i = 0;
        
        #50;
        reset_i = 0;
        
        
        #2000;
        #12;
     
       
        #2000;
        $finish;
   
   end      
    
endmodule
