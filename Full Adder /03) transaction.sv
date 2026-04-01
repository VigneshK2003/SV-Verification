
class transaction;
  
    rand bit a;
    rand bit b;
    rand bit c;
  
    bit sum;
    bit carry;
  
  function void display(string name);
    $display("---%s---",name);
    $display("time = %0t,a = %0d,b = %0d,c = %0d,sum = %0d,carry = %0d",$time,a,b,c,sum,carry);
  endfunction
  
endclass
