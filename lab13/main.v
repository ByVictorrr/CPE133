`include "./SERIAL_PARITY_GEN.v"
`include "./Multiplexed_Display.v"



//counts the number of set bits in a givin 16 bit word, also describes where
//its even or odd parity
module main(input CLK, input BTN, input [15:0] SW, output [7:0] seg, output [3:0] an);

wire [4:0] CNT;

SERIAL_PARITY_GEN PAR_GEN(.CLK(CLK),.BTN(BTN), .SW(SW), .CNT(CNT));


Multiplexed_Display display(.CLK(CLK),.CNT(CNT),.an(an),.seg(seg));



endmodule
