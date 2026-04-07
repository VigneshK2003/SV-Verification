// driver code

class driver;
   logic clk;
  
  transaction tr;
  
  mailbox gen_driv;
  
  virtual intf_df vif;
  
  function new( mailbox gen_driv,virtual intf_df vif);
        this.gen_driv = gen_driv;
        this.vif = vif;
  endfunction
  
  task driv_task();
     transaction tr;
    repeat(5) begin
   
      #1;
      gen_driv.get(tr);
       vif.rst = tr.rst;
       vif.d = tr.d;
      tr.display("driver signal");
      #4;
    end
  endtask
endclass
