interface intf_c #(parameter WIDTH = 4);
  
   logic clk;
   logic rst;
   logic up_ena;
   logic [WIDTH-1:0]count;
  
//   clocking cb_d @(posedge clk);
//       // output clk;
//        output rst;
//        output up_ena;
//   endclocking
  
//  /* clocking cb_m @(posedge clk);
//     //  input clk;
//     // default input #1step;
//       input rst;
//       input up_ena;
//       input count;
//   endclocking */
  
//   clocking cb_m @(posedge clk);
//   //  default input #1step;  
//     input rst;
//     input up_ena;
//     input count;
//   endclocking
  
endinterface
