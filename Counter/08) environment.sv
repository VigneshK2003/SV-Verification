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
   
   virtual intf_c vif;
  
  function new(virtual intf_c vif_tb);
     this.vif = vif_tb;
    
    gen_driv = new();
    mon_scb = new();
    
    gen = new(gen_driv);
    driv = new(vif,gen_driv);
    mon = new(vif,mon_scb);
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
