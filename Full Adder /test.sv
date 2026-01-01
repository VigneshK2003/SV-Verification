`include "environment.sv"

program test(intf_fa intf_tb);
  
  environment env;
  
  initial begin
   env = new(intf_tb);
   env.drivedata();
  end
  
endprogram
