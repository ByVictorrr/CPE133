`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 10/23/2018 07:39:17 PM
// Design Name: 
// Module Name: stand_dcdr_2t4_1cold
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2:4 standard decoder with 1-cold outputs
//
//  USEAGE: 
//
//  stand_dcdr_2t4_1cold  my_stand_dcdr  (
//       .SEL    (my_sel), 
//       .D_OUT  (my_d_out)  ); 
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - File Created: 11-04-2018

// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module stand_dcdr_2t4_1cold(SEL, D_OUT); 
    input  [1:0] SEL; 
    output reg [3:0] D_OUT;  
       
   
    //- standard decoder for display multiplex 
    always @ (SEL)
    begin
       case (SEL)
          0: D_OUT = 4'b1110;  
          1: D_OUT = 4'b1101; 
          2: D_OUT = 4'b1011;
          3: D_OUT = 4'b0111;
          default D_OUT = 0; 
       endcase 
    end 
	
	endmodule
	
	
