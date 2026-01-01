
class scoreboard;
  
  logic sum_exp;
  logic carry_exp;
  
  mailbox mon_scb;
  
  function new(mailbox mon_scb);
     this.mon_scb = mon_scb;
  endfunction
  
  function void check(transaction scb_tr);
    int sum_exp;
    int carry_exp;
    begin
      
    sum_exp = (scb_tr.a ^ scb_tr.b ^ scb_tr.c);
    carry_exp = (scb_tr.a & scb_tr.b) | (scb_tr.b & scb_tr.c) | (scb_tr.a & scb_tr.c);
    
      if((sum_exp == scb_tr.sum) && (carry_exp == scb_tr.carry))
        $display("------test case passed------");
    else
      $display("------test case failed------");
    end
  endfunction
  
  task scb_task;
    transaction scb_tr;
    repeat(10) begin
      mon_scb.get(scb_tr);
      scb_tr.display("signals recieved on scoreboard");
      
      check(scb_tr);
    end
  endtask
endclass
