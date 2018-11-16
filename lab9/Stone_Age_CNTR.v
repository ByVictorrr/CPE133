`include "NS_DCDR.v"
`include "../Modules/reg_nb.v" 
`include "./MEALY_OUTPUT_DCDR.v" 
`include "../Modules/clk_divider_nbit.v"

`timescale 1ns/1ps



module Stone_Age_CNTR(BTN,CLK,ST,led_mealy );	
		
 input  BTN, CLK;
 output  [15:0] led_mealy;
 wire CLK_REG;
 output [3:0] ST;
 wire [3:0] ST_plus; //ps and NS



clk_divider_nbit #(.n(25)) CLK_m(.clockin(CLK), .clockout(CLK_REG));


//input has to conca BTN and ST from REG output
NS_DCDR inputDCDR(.x1({BTN, ST}),.F1(ST_plus) );


reg_nb #(.n(4)) REG(.data_in(ST_plus),
       			.clk(CLK_REG), 
			.clr(0), 
		       	.ld(1), 
			.data_out(ST)
); 

MEALY_OUTPUT_DCDR outputDCDR(
			.BTN(BTN),
			.ST(ST),
			.led_mealy(led_mealy)
		);




endmodule
