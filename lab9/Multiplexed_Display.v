`include "../Modules/clk_divider_nbit.v"
`include "./Two_Digit_Decoder.v"
`include "./AN_DCDR.v"
`include "../Modules/BCD_Decoder.v"
`include "../Modules/mux_2t1_nb.v"


module Multiplexed_Display( input CLK, input [3:0] x, output [3:0] an , output [7:0] seg);

wire CLK_M; //slower clock
wire [3:0] F1, F2, F_ones_or_tens;

//clk_M = slower clock
clk_divider_nbit #(.n(12)) CLK_m(.clockin(CLK), .clockout(CLK_M));
	                    
//F1 = ones place of x
//F2 = tens place of x
Two_Digit_Decoder onesTensDivider(.x(x),.F1(F1), .F2(F2));


//F_ones_or_tens
mux_2t1_nb #(.n(4)) onesTensDecider(.SEL(CLK_M), .D0(F1), .D1(F2), .D_OUT(F_ones_or_tens));

//output ones or tens 
BCD_Decoder bcd(.x(F_ones_or_tens),seg(seg));


//anode decoder
AN_DCDR anDCDR(.CLK(CLK_M),.an(an));



endmodule
