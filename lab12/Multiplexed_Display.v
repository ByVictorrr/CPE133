`include "../Modules/clk_divider_nbit.v"
`include "./AN_DCDR.v"
`include "BCH_Decoder.v"
`include "../Modules/mux_2t1_nb.v"
`include "../Modules/mux_4t1_nb.v"
`include "../Modules/cntr_up_clr_nb.v"

//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/5/2018 12:31:47 PM
//// Design Name: 
//// Module Name: Multiplexed_Display
//// Project Name: Exp 12
//// Target Devices: Basy3
//// Tool Versions: 
/// Description: Displays the numbers in order while being sorted and finally displays the sorted order from highest to lowest.
///
/// Dependencies: clk_divider_nbit.v, Two_Digit_Decoder.v, AN_DCDR.v, cntr_up_clr_nb.v, mux_4t1_nb.v,
///               mux_2t1_nb.v, BCH_Decoder.v
/// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

module Multiplexed_Display(input CLK, input [3:0] arr_0, input [3:0] arr_1, input [3:0] arr_2, input [3:0] arr_3, output [3:0] an, output [7:0] seg);

wire CLK_S; //used for the input of the mux selectors
wire [1:0] SEL;
wire [3:0] F_SORTED;

//T_S - slower clock used for SEL[1] for 4-t-1 mux
clk_divider_nbit #(.n(12)) clk_s(.clockin(CLK), .clockout(CLK_S));

cntr_up_clr_nb #(.n(2)) SEL_CNTR (
          .clk   (CLK_S), 
          .clr   (0), 
          .up    (1),
          .ld   (0), 
          .D    (0), 
          .count (SEL), 
          .rco    (0) );


mux_4t1_nb #(.n(4)) sorted(
          .SEL(SEL), 
          .D0(arr_0), 
          .D1(arr_1), 
          .D2(arr_2), 
          .D3(arr_3), 
          .D_OUT(F_SORTED));

//output the value of F_sorted on the 7-segment display
BCH_Decoder BCH(.x(F_SORTED),.seg(seg));

AN_DCDR anDCDR(.SEL(SEL),.an(an));

endmodule
