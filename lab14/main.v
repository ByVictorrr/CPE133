`include "../Modules/univ_sseg.v"
`include "SR_Multiplier_5b.v"


//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 11/15/2018 08:05:03 AM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: Takes in two 5-bit numbers and multiplies one by another number. 
// These two 5-bit numbers are represented on the basy3 board by switches.
// Dependencies: SR_Multiplier_5b.v, univ_sseg.v
// 
// Revision:
// Revision 1.00 - File Created (11-17-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module main(input CLK, input BTN, input [9:0] SW, output [7:0] seg, output [3:0] an);

wire [9:0] SUM;


SR_Muliplier_5b MULT( .CLK(CLK), .BTN(BTN), .SW(SW),  .SUM(SUM));


univ_sseg display(
     .cnt1(SUM),
     .cnt2(0),
     .valid(1),
     .dp_en(0),
     .dp_sel(0),
     .mod_sel(2'b10),
     .sign(0),
     .clk(CLK),
     .ssegs(seg),
     .disp_en(an)
    ); 
  
  


endmodule

