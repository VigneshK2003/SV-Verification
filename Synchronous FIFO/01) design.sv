// design code

module synchronous_fifo #(parameter DEPTH = 8, DATA_WIDTH = 8)(
  
   input clk,
   input rst,
  input wrt_ena,
   input rd_ena,
  input [DATA_WIDTH-1:0] wrt_data,
  output reg [DATA_WIDTH-1:0] rd_data,
  output full,empty
);
  
 //  parameter PTR_WIDTH = 3;
 
  reg [$clog2(DEPTH)-1:0] rd_ptr,wrt_ptr;
  reg [$clog2(DEPTH):0] count;
  
  reg [DATA_WIDTH-1:0] fifo [DEPTH-1:0];
  
  always@(posedge clk)begin
  if(rst)begin
       wrt_ptr <= 0;
        rd_ptr <= 0;
       rd_data <= 0;
         count <= 0;
  end
  
   else
     
     if(wrt_ena && !full)begin
       fifo[wrt_ptr] <= wrt_data;
             wrt_ptr <= wrt_ptr + 1;
     end
    
     if(rd_ena && !empty)begin
      // fifo[rd_ptr] <= rd_data;
       rd_data <= fifo[rd_ptr];
        rd_ptr <= rd_ptr + 1;
     end
  
    case({wrt_ena && !full,rd_ena && !empty})
       2'b10: count <= count + 1;
       2'b01: count <= count - 1;
     default: count <= count;
   endcase
  end
  
     assign full = (count == DEPTH);
     assign empty = (count == 0);
  
endmodule
