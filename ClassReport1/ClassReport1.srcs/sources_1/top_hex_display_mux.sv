`timescale 1ns / 1ps



module top_hex_display_mux(
    input logic clk,
    input logic sw[1:0],
    output logic [7:0] sseg,
    output logic [7:0] an
    );
    
    hex_display_mux hexmux(
    .clk(clk),
    .rst(rst),
    .cw(sw[1]),
    .en(sw[0]),
    .an(an),
    .sseg(sseg));
    
endmodule
