// Code your testbench here
// or browse Examples
module tb;
  reg clk = 0,start,wr = 0,rd = 0;
  
  always #5 clk = ~clk;
 
  
  initial begin
   #30;
    rd = 1;
   #20;
    rd = 0;
    #30;
    rd = 1;
    #20;
    rd = 0;    
    #30;
    rd = 1;
    #20;
    rd = 0;  
  end
  
    initial begin
   start = 0;
    #15;
   wr = 1;
    #10;
   wr = 0;
   #60;
   wr = 1;
   #10;
   wr = 0;
   #20;
      wr = 1;
      #10;
      wr = 0;
      
  end
  
  assert property (@(posedge clk) $rose(rd) |->  not(wr[->1]) within rd[*2] ) $info("Suc at %0t",$time);
    
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
    $assertvacuousoff(0);
    #200;
    $finish;
  end
 
  
    
endmodule
