`include "NS_DCDR.v"
`include "../Modules/reg_nb.v" 
`include "OUTPUT_DCDR.v" 
`include "../Modules/clk_divider_nbit.v"

`timescale 1ns/1ps




module Stone_Age_CNTR(  BTN,
			CLK,
			Num_in_StoneAge_Binary,
		       Num_in_Binary
			);
			
			
 input  BTN;
 input CLK;
 output  [14:0] Num_in_StoneAge_Binary;
 
 output [3:0] Num_in_Binary;
 wire CLK_REG;
 
 wire [3:0] y; //y is the output of REG
 wire [3:0] y_plus; //y_plus is the output of inputDCDR

assign Num_in_Binary = y;


clk_divider_nbit #(.n(25)) CLK_m(.clockin(CLK), .clockout(CLK_REG));


//input has to conca BTN and y from REG output
NS_DCDR inputDCDR(.x1({BTN, y}),
		  .F1(y_plus) //y_plus = inputDCDR
	  	);


reg_nb #(.n(4)) REG(.data_in(y_plus),
       			.clk(clk_Reg), 
			    .clr(0), 
		       	.ld(1), 
			.data_out(y)
); 

OUTPUT_DCDR outputDCDR(
			.x2(y),
			.F_Stone(Num_in_StoneAge_Binary)
		);




endmodule
