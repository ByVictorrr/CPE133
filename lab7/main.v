`include "AddSubValid_5b.v"
`include "../Modules/univ_sseg.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 12:04:45 PM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main( 
    input [4:0]x,
    input [4:0]y,
    input CLK,
    input BTN,
    output [3:0] an,
    output [7:0] seg

    );

    wire [4:0]f;
    wire valid;

    assign valid = ~(( x[4] & y[4] & ~f[4]) | (~x[4] & ~y[4] & f[4]));
    
    
    
   	AddSubValid_5b leftModule(
         .a(x),
         .b(y),
         .button(BTN),
         .f(f)
	 
	 );
         
    assign valid = ~(( x[4] & y[4] & ~f[4]) | (~x[4] & ~y[4] & f[4]));
         
    univ_sseg runssegs(
         .cnt1(f),
         .cnt2(0),
         .valid(valid),
         .dp_en(0),
         .dp_sel(0),
         .mod_sel(0),
         .sign(f[4]),
         .clk(CLK),
         .ssegs(seg),
         .disp_en(an));
    
    
endmodule
