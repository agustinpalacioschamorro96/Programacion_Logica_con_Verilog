`timescale 1ns / 1ps

module det_start(
    input rx_i,
    input clk_i,
    input rst_i,
    output verif_edg
    );
           
    reg [4:0] count;
    reg rx_ant;
    reg verif_edg_aux;
    assign verif_edg = verif_edg_aux; 
    
    always @(posedge clk_i) begin
        if(rst_i) begin
            rx_ant        = 0;
            count         = 0;
            verif_edg_aux = 0;
        end else begin
            if (!verif_edg_aux) begin
                rx_ant <= rx_i;
                count = ((rx_i == rx_ant) && (rx_i == 0)) ? (count+1) : 0;
                verif_edg_aux = (count >= 8) ? 1 : 0;
            end
        end
    end
endmodule