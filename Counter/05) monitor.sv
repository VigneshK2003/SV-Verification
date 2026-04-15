class monitor;
  
   mailbox mon_scb;
  
   virtual intf_c vif;
  
  function new( virtual intf_c vif,mailbox mon_scb);
        this.vif = vif;
        this.mon_scb = mon_scb;
  endfunction
  
 /* task mon_task();
     transaction tr;
    repeat(6) begin
        @(vif.cb_m);
    //  @(posedge vif.clk);
   //   #1;
        
        tr = new();
    //    mon_scb.put(tr);
        
     //   @(vif.cb_m);
        default input #1step;
          tr.rst <= vif.cb_m.rst;
          tr.up_ena <= vif.cb_m.up_ena;
          tr.count <= vif.cb_m.count;
        
          mon_scb.put(tr);
        
        tr.display("---monitor signal---");
      end
  endtask */
  
  task mon_task();
  transaction tr;

    repeat(5)begin
      #5;
//    @(vif.cb_m);   // wait for monitor clocking event

    tr = new();

    tr.rst     = vif.rst;
    tr.up_ena  = vif.up_ena;
    tr.count   = vif.count;

    mon_scb.put(tr);

    tr.display("---monitor signal---");
  end
endtask
endclass
