`include "../Modules/clk_divider_nbit.v"
`include "./AN_DCDR.v"
`include "BCH_Decoder.v"
`include "../Modules/mux_2t1_nb.v"
`include "../Modules/mux_4t1_nb.v"

//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/5/2018 12:31:47 PM
//// Design Name: 
//// Module Name: Multiplexed_Display
//// Project Name: Exp 9
//// Target Devices: Basy3
//// Tool Versions: 
///* Description: Extracts the ones and tens place of a four-bit binary number
//and displays each value on the 7-segment display fast enough to give the
//illusion of just displaying the two digit decimal number.
//*/
///* Dependencies: clk_divider_nbit.v, Two_Digit_Decoder.v, AN_DCDR.v,
//BCD_Decoder.v, mux_2t1_nb.v
//*/ 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

module Multiplexed_Display(input CLK, input [3:0] arr_0, input [3:0] arr_1, input [3:0] arr_2, input [3:0] arr_3, output [3:0] an, output [7:0] seg);

wire CLK_S, CLK_F; //used for the input of the mux selectors

wire [3:0] F_SORTED;

//T_S - slower clock used for SEL[1] for 4-t-1 mux
clk_divider_nbit #(.n(12)) clk_s(.clockin(CLK), .clockout(CLK_S));

//T_F = (1/2)T_S - used for SEL[0] for 4-to-1 mux
clk_divider_nbit #(.n(24)) clk_faster(.clockin(CLK), .clockout(CLK_F));

mux_4t1_nb #(.n(4)) sorted(.SEL({CLK_S, CLK_F}), .D0(arr_0), .D1(arr_1), .D2(arr_2), .D3(arr_3), .D_OUT(F_SORTED));

//output the value of F_sorted on the 7-segment display
BCH_Decoder BCH(.x(F_SORTED),.seg(seg));

AN_DCDR anDCDR(.CLK_S(CLK_S),.CLK_F(CLK_F),.an(an));

endmodule
