`include "../Modules/mux_2t1_nb.v"
`include "../Modules/rca_nb.v"


`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 12:16:05 PM
// Design Name: 
// Module Name: AddSubValid_5b
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

module AddSubValid_5b (a,b,button,f);
    
    

    input [4:0] a, b;
    input button;
    output [4:0]f;
    
    
    wire [4:0] muxoutb, bcomp;
    
    wire co = 1'b0;
    wire cin = 1'b1;
    
    
    rca_nb #(.n(5)) bcomps(
         .a(0),
         .b(~b),
         .cin(cin),
         .sum(bcomp),
         .co(co)
         
         );
    
    mux_2t1_nb #(.n(5)) muxaddorsub(//this determines if we are adding or subtracting a and b
    
        .SEL(button),
        .D0(bcomp),
        .D1(b),
        .D_OUT(muxoutb)
    
    );

    rca_nb #(.n(5))Adding(
          .a(a),
          .b(muxoutb),
          .cin(co),
          .sum(f),
          .co(co)
           
           );// adding b to a straight
    
    
endmodule
