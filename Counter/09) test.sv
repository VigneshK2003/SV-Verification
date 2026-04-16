`include "environment.sv"

program test_c(intf_c intf_tb);
  
   environment env;
    initial begin
      env = new(intf_tb);
      env.drivedata();
    end
endprogram
