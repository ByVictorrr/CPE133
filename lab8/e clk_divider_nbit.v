`include "Stone_Age_CNTR.v"
`include "clk_divider_nbit.v"


module main(BTN,CLK,segs,an);

output [3:0] an;
output [7:0] segs;
wire [14:0] Num_in_StoneAge_Binary;

Stone_Age_CNTR LeftModule(
			.BTN(BTN),
			.CLK(CLK),
			.Num_in_StoneAge_Binary(Num_in_StoneAge_Binary)

);





//slow clock for the register 
//fast clock for sseg
univ_sseg Univ( 
	
	.cnt1(Num_in_StoneAge_Binary),                                                                                    
   	.cnt2(0),                                                                                     
    	.valid(),                                                                                           	  .dp_en(),                                                                                          
    	.dp_sel(),                                                                                   
     	.mod_sel(),                                                                                  
     	.sign(),                                                                                           
     	.clk(),                                                                                            
    	.ssegs(segs),                                                                               
    	.disp_en(an) 
);






endmodule
