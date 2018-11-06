
`timescale 1ns/1ps

`include "../Modules/clk_divider_nbit.v"
`include "StoneCNTR.v"
`include "Multiplexed_Display.v"

module main(BTN,CLK, seg, an, led

);

input BTN, CLK;

output [14:0] led;
wire CLK_M; //slower clock for the multiplexed display

wire [3:0] y;

output [3:0] an;
output [7:0] seg;



clk_divder_nbit #(.n(12)) div(
				.clockin(CLK),
       				.clockout(CLK_M)
			);




StoneCNTR LeftModule(
			.BTN(BTN),
			.CLK(CLK), //clk_Reg is a slowed down version
			.y(y),
			.led(led)


);

//faster clock than reg
Multiplexed_Display Display(
			         .y(y),
    			    .CLK(CLK_M),
        		    .seg(seg),
	     		    .an(an)

);







endmodule
