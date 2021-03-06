
`timescale 1ns/1ps

`include "../Modules/clk_divider_nbit.v"
`include "Stone_Age_CNTR.v"
`include "../Modules/univ_sseg.v"

module main(BTN,CLK, seg, an, led

);

output [14:0] led;
wire clk_Reg; //slower clock
input BTN;
input CLK;

wire [3:0] y;

output [3:0] an;
output [7:0] seg;



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



//slow clock for the register 
//fast clock for sseg
univ_sseg Univ( 
	
	.cnt1(y),                                                                                    
   	.cnt2(0),                                                                                     
    	.valid(1), 
    	.dp_en(0),                                                                                          
    	.dp_sel(0),                                                                                   
     	.mod_sel(0),                                                                                  
     	.sign(0),                                                                                           
     	.clk(CLK),                                                                                            
    	.ssegs(seg),                                                                               
    	.disp_en(an) 
);






endmodule
