`include "../Modules/mux_2t1_nb.v"
`include "../Modules/reg_nb.v"
`include "../Modules/comp_nb.v"
`include "../Modules/usr_nb.v"
`include "../Modules/rca_nb.v"

//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 11/15/2018 08:05:03 AM
// Design Name: 
// Module Name: SLAVE_CIRCUIT
// Project Name: Exp 14
// Target Devices: Basy3 
// Tool Versions: 
// Description: This takes in SEL_A, SEL_B from the FSM and controls the two shift registers 
//              to shift accordingly, when in the shift state. This type of shifting is effectivley multiplying one number 
//              by another number. The operation ends when the other number that is being multiplied by which is OP_B is 5'b00000

// Dependencies: mux_2t1_nb.v, reg_nb.v, comp_nb.v, usr_nb.v, rca_nb.v
// 
// Revision:
// Revision 1.00 - File Created (11-17-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SLAVE_CIRCUIT(input CLK, 
		     input CLR, 
		     input LD, 
		     input [1:0] SEL_A,
		     input [1:0] SEL_B, 
		     input [9:0] SW, 
		     output EQ, 
		     output [9:0] SUM);

wire [4:0] D_OUT_B,ZER;
wire [9:0] D_OUT_A, RCA_OUT, M_OUT;

assign ZER = 10'b0000000000;

//11111
//11111
//x----

//This concadanates then shifts a 0 into the most significant bit dividing by two 
usr_nb #(.n(10)) USR_A(
	.data_in({5'b00000, SW[9],SW[8],SW[7],SW[6],SW[5]}), 
	.dbit(0), 
	.sel(SEL_A), 
	.clk(CLK), 
	.clr(0), 
	.data_out(D_OUT_A));

 //This concadanates and then shifts a 0 into the Left/right-most
usr_nb #(.n(5)) USR_B(
	.data_in({SW[4],SW[3],SW[2],SW[1],SW[0]}), 
	.dbit(0), 
	.sel(SEL_B), 
	.clk(CLK), 
	.clr(0), 
	.data_out(D_OUT_B));

mux_2t1_nb #(.n(10)) MUX(.D0(ZER),.D1(D_OUT_A),.SEL(D_OUT_B[0]),.D_OUT(M_OUT));

 //When EQ high on then the process is done
 comp_nb #(.n(5)) COMP(
          .a (D_OUT_B), 
          .b (5'b00000), 
          .eq (EQ), 
          .gt (0), 
          .lt (0)
 );  

//RCA and REG together are accumulating
rca_nb #(.n(10)) add(
	.a(SUM),
	.b(M_OUT),
	.cin(0),
	.sum(RCA_OUT),
	.co(0));

reg_nb #(.n(10)) MY_REG (
          .data_in  (RCA_OUT), 
          .ld       (LD), 
          .clk      (CLK), 
          .clr      (CLR), 
          .data_out (SUM)
          );  

endmodule

