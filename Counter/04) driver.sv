class driver;
   
   virtual intf_c vif;
  
   mailbox gen_driv;

  function new( virtual intf_c vif, mailbox gen_driv);
       this.vif = vif;
       this.gen_driv = gen_driv;
  endfunction
  
  task driv_task();
    
    transaction tr;

    repeat(5) begin
      #1;
 
      gen_driv.get(tr);
      
//      @(vif.cb_d);
 
        vif.rst <= tr.rst;
        vif.up_ena <= tr.up_ena;
    
      tr.display("---driver signal---");
     #4;
    end
  endtask
endclass
