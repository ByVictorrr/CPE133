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


module SLAVE_CIRCUIT(input CLK, input [5:0]SEL, input [3:0] LD, output [2:0] LT); 
     	
	parameter arr[3:0][3:0]; //[rows] [columns]
	//array of registers
  	reg_nb #(.n(4)) REG[3:0](.data_in(), .clk(), .clr(), .ld(), .data_out());
      	mux_2t1_nb #(.n(4)) M[1:0]();
	mux_4t1_nb #(.n(4)) M[1:0]();
	comp_nb #(.n(4))();

endmodule

