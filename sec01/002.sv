module tb;
  
  reg clk = 0;
  reg a = 0;
  reg b = 0;
  
  task a_b();
    #10;
  a = 1;
    #10;
  a = 0;
    #30;
  b = 1;
    #10;
  b = 0;
    #50;
  a = 1;
    #10;
  a = 0;
    #30;
  b = 1;
    #10;
  b = 0;
    
  endtask
  
  always #5 clk =~clk;
  
 
 
  initial begin
    a_b();
  end
 
  
  
  
  /////////////////implementation with verilog
  
  always@(posedge clk)
    begin
      if(a == 1'b1)
         begin
           repeat(4) @(posedge clk);
           if( b == 1'b1)
             $display("Verilog Suc at %0t",$time);
           else
             $error("Verilog Failure at %0t",$time); 
         end
    end
  
  
  
  
  ////////implementation with SVA
  
  A1: assert property ( @(posedge clk)  a |-> ##4 b) $info("SVA Suc at %0t",$time);
  
    
    
    
      
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $assertvacuousoff(0); 
    #200;
    $finish;
  end
    
    
  
endmodule
