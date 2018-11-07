
`timescale 1ns/1ps

`include "../Modules/clk_divider_nbit.v"
`include "./Stone_Age_CNTR.v"
`include "Multiplexed_Display.v"

module main(BTN,CLK, seg, an, led

);

input BTN, CLK;

output [14:0] led;


wire [3:0] y;

output [3:0] an;
output [7:0] seg;




Stone_Age_CNTR LeftModule(
			.BTN(BTN),
			.CLK(CLK), //clk_Reg is a slowed down version
			.Num_in_StoneAge_Binary(led),
			.Num_in_Binary(y)


);



//faster clock than reg
Multiplexed_Display Display(
                      .CLK(CLK),
			    .x(y),
        		    .seg(seg),
	     		    .an(an)

);







endmodule
