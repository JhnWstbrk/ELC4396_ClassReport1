`timescale 1ns / 1ps
// John Westbrook
// System on Chip
// 9/5/2023

module count_n#(parameter N = 20)(
    input logic clk,
    input logic rst,
    input logic up,
    input logic en,
    output logic tic,
    output logic [N-1:0] count
    );
    
    parameter ZERO = {N, {1'b0}};
    logic [N-1:0] counter, n_counter;
    
    always_ff @(posedge clk, posedge rst)
        if(rst)
            counter <= ZERO;
        else
            counter <= n_counter;
        
    
    always_comb 
        if(en)
            if(up)
                n_counter = counter + 1;
            else
                n_counter = counter - 1;
        else
            n_counter = counter;
        
            
    assign count = counter;
    assign tic = counter == 1;
    
    
endmodule
