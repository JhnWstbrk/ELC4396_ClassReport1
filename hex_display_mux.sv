`timescale 1ns / 1ps

module hex_display_mux#(parameter N=18)(
    input logic clk, 
    input logic rst,
    input logic cw, en,
    output logic [3:0] an,
    output logic[6:0] sseg
    );
    
    logic [N-1:0] count = 0;
    logic up_wire = 1;
    logic tic;
    logic timer_out;
    
    count_n counter(.clk(clk),.rst(rst),.up(up_wire),.en(en),.tic(tic),.count(count));  
    
    always_comb
        if(en)
            if(cw) //for CW
                case(count[N-1:N-3])
                    3'b000 :
                        begin
                        an <= 4'b0111; 
                        sseg[6:0] <= 7'b0011100;
                        end
                    3'b001 :
                        begin
                        an <= 4'b1011;
                        sseg[6:0] <= 7'b0011100;
                        end
                    3'b010 :
                        begin
                        an <= 4'b1101;
                        sseg[6:0] <= 7'b0011100;
                        end
                    3'b011 :
                        begin
                        an = 4'b1110;
                        sseg[6:0] = 7'b0011100;
                        end
                    3'b100 :
                        begin
                        an = 4'b1110;
                        sseg[6:0] = 7'b1100010;
                        end
                    3'b101 :
                        begin
                        an = 4'b1101;
                        sseg[6:0] = 7'b1100010;
                        end
                    3'b110 : 
                        begin
                        an = 4'b1011;
                        sseg[6:0] = 7'b1100010;
                        end
                    default:
                        begin
                        an = 4'b0111;
                        sseg[6:0] = 7'b1100010;
                        end
                    endcase
             else //for CCW
                case(count[N-1:N-3])
                    3'b000 :
                        begin
                        an = 4'b1110; 
                        sseg[6:0] = 7'b0011100;
                        end
                    3'b001 :
                        begin
                        an = 4'b1101;
                        sseg[6:0] = 7'b0011100;
                        end
                    3'b010 :
                        begin
                        an = 4'b1011;
                        sseg[6:0] = 7'b0011100;
                        end
                    3'b011 :
                        begin
                        an = 4'b0111;
                        sseg[6:0] = 7'b0011100;
                        end
                    3'b100 :
                        begin
                        an = 4'b0111;
                        sseg[6:0] = 7'b1100010;
                        end
                     3'b101 :
                        begin
                        an = 4'b1011;
                        sseg[6:0] = 7'b1100010;
                        end
                    3'b110 : 
                        begin
                        an = 4'b1101;
                        sseg[6:0] = 7'b1100010;
                        end
                    default:
                        begin
                        an = 4'b1110;
                        sseg[6:0] = 7'b1100010;
                        end
                    endcase
