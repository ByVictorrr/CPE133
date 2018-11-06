`include "../Modules/mux_2t1_nb.v"
`include "../Modules/comp_nb.v"
`include "../Modules/BCD_Decoder.v"
`include "./Two_Digit_DEC_decoder.v"
`include "./AN_DCDR.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 10/07/2018 10:23:19 PM
// Design Name: VANE
// Module Name: BCD_Decoder
// Project Name: 7 - Segment BCD decoder
// Target Devices: 
// Tool Versions: 
// Description: A project in which we learned learned how a BCD works and is applied to a 7-segment display decoder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module  Multiplexed_Display(
    input [3:0] y,
    input CLK,
    output reg [7:0] seg,
    output [3:0] an );

wire [3:0] tensPlace,onesPlace, muxOUT;



Two_Digit_DEC_decoder(
			.x2(y),
			.F1(onesPlace),
			.F2(tensPlace)
			);
 

mux_2t1_nb #(.n(4)) place(
			.SEL(CLK),
			.D0(onesPlace),
			.D1(tensPlace),
			.D_OUT(muxOUT)	
			);
			
//an = anOutput
AN_DCDR anOutput(.CLK(CLK), .an(an));

//seg = BCD_Decoder
BCD_Decoder Segment(.x(muxOUT),.seg(seg);


endmodule
