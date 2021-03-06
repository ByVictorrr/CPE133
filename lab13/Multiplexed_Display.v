`include "../Modules/clk_divider_nbit.v"
`include "./AN_DCDR.v"
`include "../Modules/BCD_Decoder.v"
`include "../Modules/mux_2t1_nb.v"
`include "../Modules/mux_4t1_nb.v"
`include "./Two_Digit_Decoder.v"
`include "../Modules/cntr_up_clr_nb.v"

//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/13/2018 12:31:47 PM
//// Design Name: 
//// Module Name: Multiplexed_Display
//// Project Name: Exp 13
//// Target Devices: Basy3
//// Tool Versions: 
///* Description: Extracts the ones and tens place of a four-bit binary number
//and displays each value on the 7-segment display fast enough to give the
//illusion of just displaying the two digit decimal number. Also provides an
//even or odd parity with the 16-bit word on the screen.
//
///  Dependencies: clk_divider_nbit.v, Two_Digit_Decoder.v, AN_DCDR.v,
//                 mux_2t1_nb.v, mux_4t1_nb.v, BCD_Decoder.v
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

module Multiplexed_Display(input CLK, input [4:0] CNT, output [3:0] an, output [7:0] seg);

wire CLK_S;
wire [3:0] F1, F2; //F1 - ones place, F2 - tens place
wire [7:0] F1_seg, F2_seg, PAR_seg;
wire [1:0] SEL;

clk_divider_nbit #(.n(12)) clk_faster(.clockin(CLK), .clockout(CLK_S));


cntr_up_clr_nb #(.n(2)) SEL_CNTR (
          .clk   (CLK_S), 
          .clr   (0), 
          .up    (1),
           .ld   (0), 
           .D    (0), 
           .count (SEL), 
           .rco    (0) );

Two_Digit_Decoder CNTR_SPLIT(.x(CNT),.F1(F1),.F2(F2));

BCD_Decoder F1_DCDR(.x(F1),.seg(F1_seg));

BCD_Decoder F2_DCDR(.x(F2),.seg(F2_seg));

PAR_DCDR CNTR_LSB(.PAR(CNT[0]),.seg(PAR_seg));

mux_4t1_nb #(.n(8)) seg_selector(.SEL(SEL), .D0(F1_seg), .D1(F2_seg), .D2(PAR_seg), .D3(PAR_seg), .D_OUT(seg));

AN_DCDR anDCDR(.SEL(SEL),.an(an));

endmodule
