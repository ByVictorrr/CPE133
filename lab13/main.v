`include "./SERIAL_PARITY_GEN.v"
`include "./Multiplexed_Display.v"



//counts the number of set bits in a givin 16 bit word, also describes where
//its even or odd parity
module main(input CLK, input BTN, input [15:0] SW, output [7:0] seg, output [3:0] an);


//Shift register stores the number of ones set that is the number of switches
//asserted


//If an additional switch is added - shift register shift left - stored as
//stoneage-binary
//If one less switch is added  - shift register shift right 

//if the number stored in the shift register is divisible by 2 its even parity
//rant


endmodule
