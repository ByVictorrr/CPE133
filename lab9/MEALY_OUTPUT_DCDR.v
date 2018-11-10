//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 10/31/2018 12:31:47 PM
//// Design Name: 
//// Module Name: MEALY_OUTPUT_DCDR
//// Project Name: Exp 9
//// Target Devices: Basy3
//// Tool Versions: 
////Description: This decoder takes the current state and forms the stone age
//unary number equivalent if the button is pressed. Else it ouputs the
//compliment of the stone age equivlent
//// Dependencies: n/a
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//
//

`include "../Modules/mux_2t1_nb.v"

module MEALY_OUTPUT_DCDR( input BTN, input [3:0] ST, output [14:0] led_mealy);

wire [14:0] led_Stone;


mux_2t1_nb #(.n(15)) mealy_OUPUT_TYPE(.SEL(BTN),.D0(~led_Stone),.D1(led_Stone),.D_OUT(led_mealy));


always@(*)

      if      (ST == 4'b0000)  led_Stone = 15'b000000000000000;

      else if (ST == 4'b0001)  led_Stone = 15'b000000000000001;

      else if (ST == 4'b0010)  led_Stone = 15'b000000000000011;

      else if (ST == 4'b0011)  led_Stone = 15'b000000000000111;

      else if (ST == 4'b0100)  led_Stone = 15'b000000000001111;

      else if (ST == 4'b0101)  led_Stone = 15'b000000000011111;

      else if (ST == 4'b0110)  led_Stone = 15'b000000000111111;

      else if (ST == 4'b0111)  led_Stone = 15'b000000001111111;

      else if (ST == 4'b1000)  led_Stone = 15'b000000011111111;

      else if (ST == 4'b1001)  led_Stone = 15'b000000111111111;

      else if (ST == 4'b1010)  led_Stone = 15'b000001111111111;

      else if (ST == 4'b1011)  led_Stone = 15'b000011111111111;

      else if (ST == 4'b1100)  led_Stone = 15'b000111111111111;

      else if (ST == 4'b1101)  led_Stone = 15'b001111111111111;

      else if (ST == 4'b1110)  led_Stone = 15'b011111111111111;

      else if (ST == 4'b1111)  led_Stone = 15'b111111111111111;

      else  led_Stone = 15'b000000000000000;

endmodule
