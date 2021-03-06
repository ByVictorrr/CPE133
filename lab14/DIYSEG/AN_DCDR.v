`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/15/2018 12:31:47 PM
//// Design Name: 
//// Module Name: AN_DCDR
//// Project Name: Exp 13
//// Target Devices: Basy3
//// Tool Versions: 
///* Description: Uses the clocks ON/OFF attribute to switch between anodes
//*/
//// Dependencies: mux_4t1_nb.v 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//
`include "../Modules/mux_4t1_nb.v"

module AN_DCDR(input CLK_S, input CLK_F ,output [3:0] an);

mux_4t1_nb #(.n(4)) anDCDR(.SEL({CLK_S, CLK_F}),.D0(4'b1110),.D1(4'b1101),.D2(4'b1011),.D3(4'b0111),.D_OUT(an));

endmodule
