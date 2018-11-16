`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/5/2018 12:31:47 PM
//// Design Name: 
//// Module Name: main
//// Project Name: Exp 8
//// Target Devices: Basy3
//// Tool Versions: 
///*Description: Takes one external input - BTN. When the BTN is pressed the
//counter counts up from a sequence of {0,1,2,.....,15,0,..}. When the BTN
//isnt pressed the counter counts down in the sequence
//{0,15,14,....,2,1.0,..}. This sequence is displayed on the Basy3 boards
//7-segment display as a decimal number, also the stoneary unary equivalent is
//shown when the btn is asserted. If the button isnt asserted it shows the
//compliment of that number. 
//*/ 
//// Dependencies: "Stone_Age_CNTR.v, Multiplexed_Display.v
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//

`include "./Stone_Age_CNTR.v"
`include "Multiplexed_Display.v"

module main(BTN,CLK, seg, an, led);

input BTN, CLK;
output [14:0] led;
wire [3:0] ST;
output [3:0] an;
output [7:0] seg;




Stone_Age_CNTR LeftModule(
                        .BTN(BTN),
                        .CLK(CLK), //clk_Reg is a slowed down version
                        .ST(ST),
                        .led_mealy(led)


);



//faster clock than reg
Multiplexed_Display Display(
                      	    .CLK(CLK),
                            .x(ST),
                            .seg(seg),
                            .an(an)

);



endmodule
