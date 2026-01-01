`include "interface.sv"
`include "test.sv"

module fa_tb;
 
  intf_fa intf_tb();
 
  test name(intf_tb);
  
  full_adder dut (.a(intf_tb.a),
                  .b(intf_tb.b),
                  .c(intf_tb.c),
                  .sum(intf_tb.sum),
                  .carry(intf_tb.carry));
endmodule
