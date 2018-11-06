`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 11/04/2018 07:39:17 PM
// Design Name: 
// Module Name: mux_4t1_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 8:1 MUX with parametized data widths
//
//  USEAGE: (for 4-bit data instantion)
//
//  mux_8t1_nb  #(.n(4)) my_8t1_mux  (
//       .SEL   (my_sel), 
//       .D0    (my_d0), 
//       .D1    (my_d1), 
//       .D2    (my_d2), 
//       .D3    (my_d3),
//       .D4    (my_d4),
//       .D5    (my_d5),
//       .D6    (my_d6),
//       .D7    (my_d7),
//       .D_OUT (my_d_out) );  
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - File Created: 11-04-2018
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module mux_8t1_nb(SEL, D0, D1, D2, D3, D4, D5, D6, D7, D_OUT); 
       input  [2:0] SEL; 
       input  [n-1:0] D0, D1, D2, D3, D4, D5, D6, D7; 
       output reg [n-1:0] D_OUT;  
       
       parameter n = 8; 
        
       always @(SEL, D0, D1, D2, D3, D4, D5, D6, D7)
       begin 
          case (SEL)
		     0:  D_OUT = D0;
		     1:  D_OUT = D1;
		     2:  D_OUT = D2;
		     3:  D_OUT = D3;
		     4:  D_OUT = D4;
		     5:  D_OUT = D5;
		     6:  D_OUT = D6;
		     7:  D_OUT = D7;
			 default: D_OUT = 0; 
		  endcase 
       end
                
endmodule
   