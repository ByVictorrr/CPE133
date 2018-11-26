`include "./SERIAL_PARITY_GEN.v"
`include "./Multiplexed_Display.v"

//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 11/15/2018 08:05:03 AM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: Coutns the number of bits set in a given 16-bit word, also
// describing if that 16-bit word is even or odd parity.
// Dependencies: SERIAL_PARITY_GEN.v, Multiplexed_Display.v
// 
// Revision:
// Revision 1.00 - File Created (11-17-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(input CLK, input BTN, input [15:0] SW, output [7:0] seg, output [3:0] an);

wire [4:0] CNT;

//PARITY GENERATOR
SERIAL_PARITY_GEN PAR_GEN(.CLK(CLK),.BTN(BTN), .SW(SW), .CNT(CNT));

//DISPLAY
Multiplexed_Display display(.CLK(CLK),.CNT(CNT),.an(an),.seg(seg));


endmodule
