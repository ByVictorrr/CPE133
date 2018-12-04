`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer:  Victor Delaplaine, Esteban Rubio
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: SLAVE_CIRCUIT
// Project Name: 
// Target Devices: basy3
// Tool Versions: 
// Description: Controlled by the FSM, takes in the Switches as inputs, LD,SEL, and LD signals which are control signals from FSM.
// The output of this circuit gives the FSM a status for what needs to be selected based on the LT signals of the array of comparators.
// The four muxes allow the shift the value in the circuit.
//
// Dependencies: mux_2t1_nb.v, mux_4t1_nb.v, comp_nb.v, clk_divider_nbit.v
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


module SLAVE_CIRCUIT(input CLK, input CLR,  input [15:0] SW, input [5:0]SEL, input [3:0] LD, output [2:0] LT, output [3:0] arr_0, output [3:0] arr_1, output [3:0] arr_2, output [3:0] arr_3); 
     	
	wire [3:0] M_0, M_1, M_2, M_3; //mux output 
	
	//x=SW[3:0]
	//y=SW[7:4]
	//z=SW[11:8]
	//w=SW[15:12]
        mux_2t1_nb #(.n(4)) M_edges_0(
		.SEL(SEL[0]),
		.D0({SW[3],SW[2],SW[1],SW[0]}),
		.D1(arr_1),
		.D_OUT(M_0));
        
        mux_4t1_nb #(.n(4)) M_middle_0(
		.SEL({SEL[2],SEL[1]}),
		.D0({SW[7],SW[6],SW[5],SW[4]}),
		.D1(arr_0),
		.D2(arr_2),
		.D3(arr_2),
		.D_OUT(M_1));    
        
        mux_4t1_nb #(.n(4)) M_middle_1(
		.SEL({SEL[4],SEL[3]}),
		.D0({SW[11], SW[10], SW[9], SW[8]}),
		.D1(arr_3),
		.D2(arr_1),
		.D3(arr_1),
		.D_OUT(M_2));
        
        mux_2t1_nb #(.n(4)) M_edges_1(
		.SEL(SEL[5]),
		.D0({SW[15],SW[14], SW[13], SW[12]}),.
		D1(arr_2),
		.D_OUT(M_3));

	
	//array of registers
  	reg_nb #(.n(4)) REG_0(.data_in(M_0), .clk(CLK), .clr(CLR), .ld(LD[0]), .data_out(arr_0));
    	reg_nb #(.n(4)) REG_1(.data_in(M_1), .clk(CLK), .clr(CLR), .ld(LD[1]), .data_out(arr_1));
	reg_nb #(.n(4)) REG_2(.data_in(M_2), .clk(CLK), .clr(CLR), .ld(LD[2]), .data_out(arr_2));
	reg_nb #(.n(4)) REG_3(.data_in(M_3), .clk(CLK), .clr(CLR), .ld(LD[3]), .data_out(arr_3));

	
	//array of comparators
	comp_nb #(.n(4)) COMP_0(.a(arr_0),.b(arr_1),.eq(0),.lt(LT[0]),.gt(0));
	comp_nb #(.n(4)) COMP_1(.a(arr_1),.b(arr_2),.eq(0),.lt(LT[1]),.gt(0));
	comp_nb #(.n(4)) COMP_2(.a(arr_2),.b(arr_3),.eq(0),.lt(LT[2]),.gt(0));

endmodule

