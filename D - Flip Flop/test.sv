
`include "environment.sv"

program test(intf_df intf_tb);
  
  environment env;
  initial begin
    env = new(intf_tb);
    env.drivedata();
  end
endprogram 
