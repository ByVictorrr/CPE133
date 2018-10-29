`include "NS_DCDR.v"
`include "reg_nb.v" 
`include "OUTPUT_DCDR.v" 



module Stone_Age_CNTR(  BTN,
			CLK,
			Num_in_StoneAge_Binary
			);
 input  BTN;
 input CLK;
 output [14:0] Num_in_StoneAge_Binary;
 
 wire [4:0] y; //y is the output of REG
 wire [4:0] y_plus; //y_plus is the output of inputDCDR

//input has to conca BTN and y from REG output
NS_DCDR inputDCDR(.x1({BTN, y}),
		  .F1(y_plus) //y_plus = inputDCDR
	  	);

//
reg_nb #(.n(4)) REG(.data_in(y_plus),
       			.clk(CLK), 
			.clr(0), 
		       	.ld(1), 
			.data_out(y)
); 

OUTPUT_DCDR ouputDCDR(
			.x2(y),
			.F_stone(Num_in_StoneAge_Binary)
		);




endmodule
