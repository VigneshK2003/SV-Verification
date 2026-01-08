
`include "interface.sv"
`include "test.sv"

module d_tb;
  
  logic clk;
 
  intf_df intf_tb(); 
 
  test dff(intf_tb);
  
 
  d_ff dut(.clk(intf_tb.clk), .rst(intf_tb.rst), .d(intf_tb.d),    .q(intf_tb.q));
  
  initial begin
    intf_tb.clk=0;
    forever #5 intf_tb.clk = ~intf_tb.clk;
  end
  
  initial #100 $finish;
    
endmodule 
