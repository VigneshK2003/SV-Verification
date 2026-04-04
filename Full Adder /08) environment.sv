`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scb;
  
  mailbox gen_driv;
  mailbox mon_scb;
  
  virtual intf_fa vif;
  
  function new(virtual intf_fa intf_tb);
     vif = intf_tb;
    
    gen_driv = new();
    mon_scb = new();
    
    gen = new(gen_driv);
    driv = new(gen_driv,vif);
    mon = new(mon_scb,vif);
    scb = new(mon_scb);
  endfunction
  
  task drivedata();
    
    fork
    gen.gen_task();
    driv.driv_task();
    mon.mon_task();
    scb.scb_task();
    join
  endtask
endclass
