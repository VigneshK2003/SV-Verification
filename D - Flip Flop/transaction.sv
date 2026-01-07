
class transaction;
  
   rand bit rst;
   rand bit d;
         bit q;
 function void display(string name);

    $display("--%s--",name);
    $display(" time=%0t,rst=%0d,d=%0d,q=%0d",$time,rst,d,q);
  endfunction
endclass
