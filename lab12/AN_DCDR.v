`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/5/2018 12:31:47 PM
//// Design Name: 
//// Module Name: AN_DCDR
//// Project Name: Exp 9
//// Target Devices: Basy3
//// Tool Versions: 
///* Description: Uses the clocks ON/OFF attribute to switch between anodes
//*/
//// Dependencies: n/a  
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//
`include "../Modules/mux_2t1_nb.v"

module AN_DCDR(CLK,an);

input CLK;
output reg [3:0] an;

wire 

mux_2t1_nb(.SEL(CLK),.D0(a),.D1(),D_OUT());

	if(CLK == 1'b1) an = 4'b1101;
	else an = 4'b1110;


endmodule
