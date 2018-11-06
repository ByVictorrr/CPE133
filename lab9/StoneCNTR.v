
`timescale 1ns/1ps

`include "../Modules/clk_divider_nbit.v"
`include "Stone_Age_CNTR.v"

module StoneCNTR(BTN,CLK,y,led);

output [14:0] led;
wire clk_Reg; //slower clock

output [3:0] y;
input BTN,CLK;



// f(n) * 2Hz = 100MHz  = > n = 25
//always slows down a clock
clk_divder_nbit #(.n(25)) clkReg(
				.clockin(CLK),
       				.clockout(clk_Reg)
			);





Stone_Age_CNTR LeftModule(
			.BTN(BTN),
			.CLK(clk_Reg), //clk_Reg is a slowed down version
			.Num_in_StoneAge_Binary(led),
			.Num_in_Binary(y)

);






endmodule
