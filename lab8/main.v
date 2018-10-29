`include "Stone_Age_CNTR.v"
`include "clk_divider_nbit.v"


module main(BTN,CLK, segs, an



);

wire [14:0] Num_in_StoneAge_Binary;
wire clk_Reg; //slower clock


output [3:0] an;
output [7:0] segs;


// f(n) * 2Hz = 100MHz  = > n = 25
//always slows down a clock
clk_divder_nbit #(.n(25)) clkReg(
				.clockin(CLK),
       				.clockout(clk_Reg)
			);





Stone_Age_CNTR LeftModule(
			.BTN(BTN),
			.CLK(clk_Reg), //clk_Reg is a slowed down version
			.Num_in_StoneAge_Binary(Num_in_StoneAge_Binary)

);



//slow clock for the register 
//fast clock for sseg
univ_sseg Univ( 
	
	.cnt1(Num_in_StoneAge_Binary),                                                                                    
   	.cnt2(0),                                                                                     
    	.valid(0),                                                                                           	  .dp_en(0),                                                                                          
    	.dp_sel(0),                                                                                   
     	.mod_sel(0),                                                                                  
     	.sign(0),                                                                                           
     	.clk(CLK),                                                                                            
    	.ssegs(seg),                                                                               
    	.disp_en(an) 
);






endmodule
