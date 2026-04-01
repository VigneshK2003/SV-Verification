class driver;
 
  virtual intf_fa vif;
  mailbox gen_driv;
  
  function new(mailbox gen_driv, virtual intf_fa vif);
      this.gen_driv = gen_driv;
      this.vif = vif;
  endfunction
  
  task driv_task();
    transaction tr;
    repeat(5) begin
     
     #1;
      gen_driv.get(tr);
      vif.a = tr.a;
      vif.b = tr.b;
      vif.c = tr.c;
 
      tr.display("driver signals");
      #4;
    end
  endtask
endclass
