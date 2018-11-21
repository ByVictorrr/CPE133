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
///Description: Takes one external input - BTN. When the BTN is pressed the
//// Dependencies:  Multiplexed_Display.v
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//

`include "Multiplexed_Display.v"
`include "./SORT_4b.v"

module main(input BTN,input CLK,input CLR,input [15:0]SW, output [7:0] seg, output [3:0] an, output led);

wire [3:0] arr_0, arr_1, arr_2, arr_3;

SORT_4b ckt(.BTN(BTN), .SW(SW), .CLK(CLK), .led(led), .arr_0(arr_0), .arr_1(arr_1), .arr_2(arr_2), .arr_3(arr_3)); 

//faster clock than reg
  Multiplexed_Display Display(.CLK(CLK), .arr_0(arr_0), .arr_1(arr_1), .arr_2(arr_2), .arr_3(arr_3), .an(an), .seg(seg));


endmodule
