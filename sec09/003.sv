module tb;
  
    
  reg clk = 0, rst = 0;
  always #5 clk = ~clk;
  
  
   initial begin
     repeat(5) @(posedge clk);
     rst = 1;
  end
  
  
  
  
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end 
 
  initial A1: assert property (@(posedge clk) nexttime[2] rst) $info("success at %0t ",$time);
  
endmodule
