`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: fsm_template
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic FSM model with both Mealy & Moore outputs. 
//    Note: data widths of state variables are not specified 
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (07-07-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "../Modules/mux_2t1_nb.v"
`include "../Modules/mux_4t1_nb.v"
`include "../Modules/reg_nb.v"
`include "../Modules/comp_nb.v"
`include "../Modules/clk_divider_nbit.v"


module SLAVE_CIRCUIT(input CLK, input CLR,  input [15:0] SW, input [5:0]SEL, input [3:0] LD, output [2:0] LT); 
     	
	parameter arr[3:0]; //[rows] [columns]
	wire [3:0] M[0], M[1], M[2], M[3] 
	
	//x=SW[3:0]
	//y=SW[7:4]
	//z=SW[11:8]
	//w=SW[15:12]


	mux_2t1_nb #(.n(4)) M_edges[0](.SEL(SEL[0]),.D0(SW[3:0]),.D1(arr[1]),.D_OUT(M[0]));
	mux_4t1_nb #(.n(4)) M_middle[0](.SEL(SEL[2:1]),.D0(SW[7:0]),.D1(arr[0]),.D2(arr[2]),.D3(arr[2]),.D_OUT(M[1]));	
	mux_4t1_nb #(.n(4)) M_middle[0](.SEL(SEL[4:3]),.D0(SW[11:8]),.D1(arr[3]),.D2(arr[1]),.D3(arr[1]),.D_OUT(M[2]));
	mux_2t1_nb #(.n(4)) M_edges[0](.SEL(SEL[5]),.D0(SW[15:12]),.D1(arr[2]),.D_OUT(M[3]));

	//array of registers
  	reg_nb #(.n(4)) REG[0](.data_in(), .clk(CLK), .clr(CLR), .ld(LD[0]), .data_out(arr[0]));
      	reg_nb #(.n(4)) REG[1](.data_in(), .clk(CLK), .clr(CLR), .ld(LD[1]), .data_out(arr[1]));
	reg_nb #(.n(4)) REG[2](.data_in(), .clk(CLK), .clr(CLR), .ld(LD[2]), .data_out(arr[2]));
	reg_nb #(.n(4)) REG[3](.data_in(), .clk(CLK), .clr(CLR), .ld(LD[3]), .data_out(arr[3]));

	
	//array of comparators
	comp_nb #(.n(4)) COMP[0](.a(arr[0]),.b(arr[1]),.eq(0),.lt(LT[0]),.gt(0));
	comp_nb #(.n(4)) COMP[1](.a(arr[1]),.b(arr[2]),.eq(0),.lt(LT[1]),.gt(0));
	comp_nb #(.n(4)) COMP[2](.a(arr[2]),.b(arr[3]),.eq(0),.lt(LT[2]),.gt(0));

endmodule

