`timescale 1ns / 1ps

module hex_display_mux#(parameter N=26)(
    input logic clk, 
    input logic rst,
    input logic cw, 
    input logic en,
    output logic [7:0] an,
    output logic[7:0] sseg
    );
    
    logic [7:0] an_wire;
    logic [N-1:0] count;
    
    count_n# (.N(N)) counter(
    .clk(clk),
    .rst(rst),
    .en(en),
    .up(cw),
    .count(count));
    
    always_comb begin
        case(count[N-1:N-3])
            0: an_wire = 1;
            1: an_wire = 2;
            2: an_wire = 4;
            3: an_wire = 8;
            4: an_wire = 8;
            5: an_wire = 4;
            6: an_wire = 2;
            7: an_wire = 1;
               
            
        endcase
        
        sseg = count[N-1]? 8'b10011100:8'b10100011;
        an <= ~(an_wire);
    end

   
endmodule
       
