// up down counter

module up_down #(parameter WIDTH = 4)(
    input logic clk,
    input logic rst,
    input logic up_ena,
  output logic [WIDTH-1:0] count
);
  
  always_ff@(posedge clk or posedge rst)
    
     begin
       if(rst)
          count <= '0;   
       else if(up_ena)
          count <= count + 1;
      else
          count <= count - 1;
     end
endmodule
