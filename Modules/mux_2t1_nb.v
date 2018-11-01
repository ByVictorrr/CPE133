`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 10/23/2018 07:39:17 PM
// Design Name: 
// Module Name: mux_2t1_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2:1 MUX with parametized data widths
//
//  USEAGE: (for 4-bit data instantiation)
//
//  mux_2t1_nb  #(.n(4)) my_2t1_mux  (
//       .SEL   (my_sel), 
//       .D0    (my_d0), 
//       .D1    (my_d1), 
//       .D_OUT (my_d_out) );  
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - File Created: 10-23-2018
//          1.01 - fixed default width error (10-28-2018)
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module mux_2t1_nb(SEL, D0, D1, D_OUT); 
       input  SEL; 
       input  [n-1:0] D0, D1; 
       output reg [n-1:0] D_OUT;  
       
       parameter n = 8; 
        
       always @(SEL, D0, D1)
       begin 
          if      (SEL == 0)  D_OUT = D0;
          else if (SEL == 1)  D_OUT = D1; 
          else                D_OUT = 0; 
       end
                
endmodule
   
