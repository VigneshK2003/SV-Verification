
class scoreboard;
   
    logic prev_d;
  
   mailbox mon_scb;
   
  function new(mailbox mon_scb);
      this.mon_scb = mon_scb;
  endfunction
  
  function void check(transaction tr);
     logic exp_q;
     begin
       
      exp_q = (tr.rst == 1)? 1'b0 : tr.d;

//        if(tr.rst)
//          exp_q = 0;
//        else
//          exp_q = tr.d;
         
         
       if(exp_q == tr.q)
         $display("---pass---");
       else
         $display("---fail---");
     end
  endfunction
  
 task scb_task();
     transaction tr;
    repeat(5) begin
      mon_scb.get(tr);
      tr.display("scoreboard signal");
      
      check(tr);
    end
  endtask
endclass 
