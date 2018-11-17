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

module main(BTN,CLK, seg, an, led);

input BTN, CLK;
output  led;
output [3:0] an;
output [7:0] seg;









//faster clock than reg
Multiplexed_Display Display(
                      	    .CLK(CLK),
                            .x(M), //mux output is sorted values
                            .seg(seg),
                            .an(an)

);



endmodule
