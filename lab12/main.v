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



SORT_4b ckt(BTN(), .CLR(), .CLK(), .led());

//faster clock than reg
Multiplexed_Display Display(
                      	    .CLK(CLK),
                            .x(M), //mux output is sorted values
                            .seg(seg),
                            .an(an)

);



endmodule
