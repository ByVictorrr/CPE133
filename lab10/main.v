`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer:  Victor Delaplaine, Esteban Rbuio
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: main
// Project Name: Exp. 10
// Target Devices: Basys3
// Tool Versions: 
// Description: The main module just displays our CNTR_3b_UPDOWN module on the
// basys board.
// Dependencies: clk_divider_nbit.v, univ_sseg.v 
// 
// Revision:
// Revision 1.00 - File Created (07-07-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




`timescale 1ns/1ps

`include "../Modules/clk_divider_nbit.v"
`include "../Modules/univ_sseg.v"
`include "./CNTR_3b_UPDOWN.v"


module main(RST,HOLD, UP,EVEN,ODD,CLK, seg, an);

wire clk_Reg; //slower clock
input CLK,RST,UP,EVEN,ODD, HOLD;
wire [2:0] mealy, moore;
output [3:0] an;
output [7:0] seg;


// f(n) * 2Hz = 100MHz  = > n = 25
//always slows down a clock
clk_divider_nbit #(.n(25)) clkReg(.clockin(CLK),.clockout(clk_Reg));


CNTR_3b_UPDOWN fsm(.RST(RST),.HOLD(HOLD),.UP(UP),.EVEN(EVEN),.ODD(ODD),.CLK(clk_Reg),.mealy(mealy),.moore(moore));

univ_sseg Univ( 	
	.cnt1(moore),                                                                                    
   	.cnt2(0),                                                                                     
    	.valid(1), 
    	.dp_en(0),                                                                                          
    	.dp_sel(0),                                                                                   
     	.mod_sel(0),                                                                                  
     	.sign(0),                                                                                           
     	.clk(CLK),                                                                                            
    	.ssegs(seg),                                                                               
    	.disp_en(an) 
);






endmodule
