module temp;
  reg a;
  reg clk = 0;
  reg rd;
  reg [7:0] addr;
 
 
 
  always#5 clk = ~clk;
  
  
  initial begin
  a = 0;
  #10;
  a = 1;
  #10;
  a = 0;
  #10;
  a = 1;  
  end
  
  
  initial begin
  rd = 0;
  #10;
  rd = 1;
  addr = 2;
  #20;
  rd = 0;
  #10;
  rd = 1;
  addr = 4;
  #20;
  rd = 0;
  #10;
  rd = 1;
  addr = 7;
  #10;
  addr = 9;
  #10;
  rd = 0;
  end
  
  initial begin
