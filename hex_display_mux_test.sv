`timescale 1ns / 1ps


module hex_display_mux_test();

  parameter N = 18;
  logic clk;
  logic rst;
  logic cw, en;
  //logic tic;
  logic [3:0] an;
  logic[6:0] sseg;
  
  initial begin
  clk=1'b0;
  forever #20 clk = ~clk;
  end
  
  hex_display_mux#(.N(N))dut(
  .clk(clk),
  .rst(rst),
  .cw(cw),
  .en(en),
  .an(an),
  .sseg(sseg));
  
 
  initial begin
  rst = 1'b0;
  #5 rst = 1'b1;
  #5 rst = 1'b0;
  end
  
  initial begin
  en = 1'b1;
  #5 en = 1'b0;
  #5 en = 1'b1;
  #100;
  $finish;
  end
  
  initial begin
  cw = 1'b1;
  
  #20 cw = 1'b0;
  #20 cw = 1'b1;
  
  end
 
endmodule
