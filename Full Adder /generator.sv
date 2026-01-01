
class generator;
  
  transaction tr;
  
  mailbox gen_driv;
  
  function new(mailbox gen_driv);
      this.gen_driv = gen_driv;
  endfunction
  
  task gen_task();
    
    repeat(5) begin
    tr = new();
    tr.randomize();
    gen_driv.put(tr);
      
      tr.display("generator class signals");
    
    end
  endtask
endclass
