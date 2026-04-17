`include "interface.sv"
`include "test.sv"

module counter;
   
   parameter width=4;
  
  intf_c intf_tb();
  
   test_c count(intf_tb);
  
  up_down dut(.clk(intf_tb.clk), .rst(intf_tb.rst), .up_ena(intf_tb.up_ena), .count(intf_tb.count) );
  
  initial begin
    
//     intf_tb.rst = 1;
//     #10;
//     intf_tb.rst = 0;
    
    intf_tb.clk = 0;
    forever #5 intf_tb.clk = ~intf_tb.clk; 
  end
  
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars();
    
    forever #50 intf_tb.up_ena = ~intf_tb.up_ena;
  end
  
  initial #100 $finish;
  
endmodule
