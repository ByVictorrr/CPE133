`include "FSM_MULT.v"
`include "./SLAVE_CIRCUIT.v"
`include "../Modules/clk_divider_nbit.v"


//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 11/15/2018 08:05:03 AM
// Design Name: 
// Module Name: SR_Multiplier_5b
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: Takes in two 5-bit numbers and multiplies one by another number. 
// These two 5-bit numbers are represented on the basy3 board by switches.
// Dependencies: SLAVE_CIRCUIT.v, clk_divider_nbit.v, FSM_MULT.v
// 
// Revision:
// Revision 1.00 - File Created (11-17-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SR_Muliplier_5b(input CLK,input BTN, input [9:0] SW, output [9:0] SUM);

wire CLK_S, EQ, CLR, LD;
wire [1:0] SEL_A, SEL_B;

clk_divider_nbit #(.n(20)) slow(.clockin(CLK), .clockout(CLK_S));
  
//This controls the slave circuit   
FSM_MULT FSM(
	.CLK(CLK), 
	.BTN(BTN), 
	.EQ(EQ), 
	.CLR(CLR), 
	.SEL_A(SEL_A), 
	.SEL_B(SEL_B),
	.LD(LD));
  
//this concadanates,multiplies, and acculmulates  
SLAVE_CIRCUIT SLAVE(
	.CLK(CLK), 
	.CLR(CLR),  
	.LD(LD), 
	.SEL_A(SEL_A), 
	.SEL_B(SEL_B), 
	.SW(SW) ,
	.EQ(EQ), 
	.SUM(SUM));

endmodule
