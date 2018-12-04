`include "Multiplexed_Display.v"
`include "./SORT_4b.v"

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/5/2018 12:31:47 PM
//// Design Name: 
//// Module Name: main
//// Project Name: Exp 12
//// Target Devices: Basy3
//// Tool Versions: 
///  Description: When the BTN is pressed the circuit takes 4 values as sorts them into accending order. 
///  It takes the 4 4-bit numbers and sorts according to their value. 
///  On the basy 7-segment display the board displays the the number being sorted. And when done the led indicates.
//// Dependencies:  Multiplexed_Display.v, SORT_4b.v
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
////////////////////////////////////////////////////////////////////////////////////


module main(input BTN,input CLK,input CLR,input [15:0]SW, output [7:0] seg, output [3:0] an, output led);

wire [3:0] arr_0, arr_1, arr_2, arr_3;

SORT_4b ckt(
  .BTN(BTN), 
  .SW(SW), 
  .CLK(CLK), 
  .led(led), 
  .arr_0(arr_0), 
  .arr_1(arr_1), 
  .arr_2(arr_2), 
  .arr_3(arr_3)); 

//faster clock than reg
  Multiplexed_Display Display(
    .CLK(CLK), 
    .arr_0(arr_0), 
    .arr_1(arr_1), 
    .arr_2(arr_2), 
    .arr_3(arr_3), 
    .an(an), 
    .seg(seg));


endmodule
