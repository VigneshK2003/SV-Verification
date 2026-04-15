class scoreboard;
  
   mailbox mon_scb;
  
  function new(mailbox mon_scb);
      this.mon_scb = mon_scb;
  endfunction
  
  function void check(transaction tr);
    
    bit [3:0]exp_count;
  
    begin
      
      if(tr.rst)
          exp_count = 0;
      else
        begin
       if(tr.up_ena)
         exp_count = exp_count + 1;
       else
         exp_count = exp_count - 1;
        end
      
     if(exp_count == tr.count)
       $display("testcase passed");
     else
       $display("testcase failed");
    end
    
  endfunction
  
 task scb_task();
   transaction tr;
   repeat(6) begin
     mon_scb.get(tr);
     
     tr.display("scoreboard signal");
     check(tr);
   end
 endtask
endclass 
