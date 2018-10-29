`include "mainFunc.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 06:11:39 PM
// Design Name: 
// Module Name: test
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
module tb_comp_nb( );


reg [4:0] A, B; //- stimulus
wire [4:0] = F;

  //- instantiate the system
 comp_nb compare(
    .a (A),
    .b (B),
    .f (F),
);


 initial
 begin

 //values of A and B
 A = 'h8;
 B = 'h9;

 //values after 20 units
 #20 A = 'hB;
 B = 'hB;

 //values after 20units
 #20 A = 8'b00001011;
 B = 8'b00000001;

 //values after 20units
 #20 A = 8'b00000001;
 B = 8'b00100001;
 end
endmodule
