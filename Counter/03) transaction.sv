class transaction;
  
   rand bit rst;
   rand bit up_ena;
   
  bit [3:0] count;
  
  function void display(string name);
    $display("---%0s---",name);
    $display("Time = %0t, rst = %0d,up_ena = %0d, count = %b",
               $time,rst,up_ena,count);
  endfunction
endclass
