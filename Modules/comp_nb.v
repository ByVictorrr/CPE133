`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Engineering
// Engineer: James Ratner
// 
// Create Date: 07/04/2018 02:13:56 PM
// Design Name: 
// Module Name: comp_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: n-bit comparator model
//
//   Usage (instantiation) example for 16-bit comparator 
//          (model defaults to 8-bit comparator)
//
//      comp_nb #(.n(16)) MY_COMP (
//          .a (my_a), 
//          .b (my_b), 
//          .eq (my_eq), 
//          .gt (my_gt), 
//          .lt (my_lt)
//          );  
// 
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created: 07-06-2018
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comp_nb(a, b, eq, lt, gt); 
    input  [n-1:0] a,b; 
    output reg eq, lt, gt; 
  
    parameter n = 8;
    
    always @ (a,b)
    begin      
       if (a == b)
       begin     
          eq = 1; lt = 0;  gt = 0;   
       end
       else if (a > b)   
       begin     
          eq = 0; lt = 0;  gt = 1; 
       end
       else if (a < b)  
       begin     
          eq = 0; lt = 1;  gt = 0; end
       else
       begin     
          eq = 0; lt = 0;  gt = 0; 
       end  
    end 

endmodule

