`include "MainFunc.v"
`include "ssegs.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 12:04:45 PM
// Design Name: 
// Module Name: Main
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


module Main( 
    input [4:0]x,
    input [4:0]y,
    input clk,
    output [3:0] an,
    input button,
    output [7:0] seg
    );
    wire [4:0]f;
    wire valid;
   
    
    
    
    MainFunc runmainfuncs(
         .a(x),
         .b(y),
         .button(button),
         .f(f));
         
    assign valid = ~(( x & y & ~f) | (~x & ~y & f));
    
    univ_sseg runssegs(
         .cnt1(f),
         .cnt2(0),
         .valid(valid),
         .dp_en(0),
         .dp_sel(0),
         .mod_sel(0),
         .sign(f[4]),
         .clk(clk),
         .ssegs(seg),
         .disp_en(an));
    
    
endmodule
