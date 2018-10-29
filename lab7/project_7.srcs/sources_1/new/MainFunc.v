`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 12:16:05 PM
// Design Name: 
// Module Name: MainFunc
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
module mux_2t1_nb(SEL, D0, D1, D_OUT); 
      input  SEL; 
      input  [n:0] D0, D1; 
      output reg [n:0] D_OUT;  
      
      parameter n = 8; 
       
      always @(SEL, D0, D1)
      begin 
         if      (SEL == 0)  D_OUT = D0;
         else if (SEL == 1)  D_OUT = D1; 
         else                D_OUT = 0; 
      end
endmodule

module rca_nb(
    input [n-1:0] a,
    input [n-1:0] b,
    input cin,
    output reg [n-1:0] sum,
    output reg co
    );
	
    parameter n = 8;
	
    reg [n:0] tmp_sum;  
    
    always @(a,b,cin)
    begin
       {co,sum} = a + b + cin;    
    end
endmodule

module MainFunc(
    input [4:0] a,
    input [4:0] b,
    /*input clk,
    output [4:0] an,
    output [8:0] segs,*/
    input button,
    output [4:0]f/*,
    output valid
    */);
    wire muxoutb;
    wire bcomp;
    
    
    rca_nb #(.n(5)) bcomps(
         .a(0),
         .b(b),
         .cin(1),
         .sum(bcomp),
         .co(0));//adding bs comp to a
    
    mux_2t1_nb #(.n(5)) muxaddorsub(//this determines if we are adding or subtracting a and b
    
        .SEL(button),
        .D0(bcomp),
        .D1(b),
        .D_OUT(muxoutb)
    
    );
    rca_nb #(.n(5))Adding(
          .a(a),
          .b(muxoutb),
          .cin(0),
          .sum(f),
          .co(0)
           );// adding b to a straight
    
   // assign valid = ~(( a & b & ~f) | (~a & ~b & f));

    
    
endmodule
