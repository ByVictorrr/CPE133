
`timescale 1ns/1ps

`include "../Modules/clk_divider_nbit.v"
`include "StoneCNTR.v"
`include "Multiplexed_Display.v"

module StoneCounter(BTN,CLK, seg, an, led

);

output [14:0] led;
wire CLK_M; //slower clock for the multiplexed display

wire [3:0] y;

output [3:0] an;
output [7:0] seg;



clk_divder_nbit #(.n(12)) clkM
				.clockin(CLK),
       				.clockout(CLK_M)
			);




StoneCNTR LeftModule(
			.BTN(BTN),
			.CLK(clk_Reg), //clk_Reg is a slowed down version
			.Num_in_StoneAge_Binary(led),
			.Num_in_Binary(y)

);

//faster clock than reg
Multiplexed_Display Display(
			    .y(y),
    			    .CLK(CLK_M),
        		    .seg(seg),
	     		    .an(an)

);











endmodule
