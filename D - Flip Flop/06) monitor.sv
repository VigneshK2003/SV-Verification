
class monitor;
  logic clk;
  virtual intf_df vif;
  mailbox mon_scb;

  function new(mailbox mon_scb, virtual intf_df vif);
    this.mon_scb = mon_scb;
    this.vif     = vif;
  endfunction

  task mon_task();
    transaction tr;
    repeat (5) begin
    #5;
      tr = new(); 
      tr.rst = vif.rst;
      tr.d   = vif.d;
      tr.q   = vif.q;

      mon_scb.put(tr);
     tr.display("monitor signals");
    end
  endtask
endclass
