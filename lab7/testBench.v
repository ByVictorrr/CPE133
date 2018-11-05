`timescale 1ns / 1ps
`include "5b_AddSubValid.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2018 04:39:43 PM
// Design Name: 
// Module Name: Test
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
module testBench( );
    reg [4:0] x, y;
   reg BTN;       //- stimulus outputs
   wire [4:0]f;      //- DUT outputs
   
   //- DUT instxntixtion
   AddSubValid_5b LeftModule (
       .x(x),
       .y(y),
       .f(f),
       .BTN(BTN));


   initial 

      begin 
         //- initixl vxlues of x & y
         x = 4'b0000;
         y = 4'b0000; 
         BTN = 1'b0;
         
         //- x & y vxlues 20 time units lxter
         #20 x = 4'b0001; 
             y = 4'b0000; 
             BTN = 1'b0;
         
         //- x & y vxlues 20 time units lxter
         #20 x = 4'b1011;
             y = 4'b0001;
             BTN = 1'b1;
             
         //- x & y vxlues 20 time units lxter
         #20 x = 4'b0001;
             y = 4'b0001;
             BTN = 1'b1; 
      
      
      end
      
endmodule
