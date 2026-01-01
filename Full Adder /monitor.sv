
class monitor;
  
  mailbox mon_scb;
  virtual intf_fa vif;
  
  function new(mailbox mon_scb, virtual intf_fa vif);
     this.mon_scb = mon_scb;
     this.vif = vif;
  endfunction
  
  task mon_task();
    
    transaction tr;
    repeat(5) begin
      #5;
      tr = new();
    tr.a = vif.a;
    tr.b = vif.b;
    tr.c = vif.c;
    tr.sum = vif.sum;
    tr.carry = vif.carry;
    mon_scb.put(tr);
    
    tr.display("monitor class signal");
    end
  endtask
endclass
