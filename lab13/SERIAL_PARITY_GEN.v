`include "../Modules/clk_divider_nbit.v"
`include "../Modules/comp_nb.v"
`include "../Modules/usr_nb.v"
`include "../Modules/cntr_up_clr_nb.v"

module SERIAL_PARITY_GEN(input CLK, input BTN, input [15:0] SW, output [6:0] CNT_WITH_PARITY);

wire CLK_SLOWER; //slower clk 
wire [15:0] D_OUT, D_IN;
wire [1:0] SEL;
wire EQ,CLR, LD;
wire [4:0] CNT;
wire PAR; //0 = even , 1 = odd


clk_divider_nbit (#.n(25)) SLOWER_CLK(.inputclock(CLK),.outputclock(CLK_SLOWER)); 

usr_nb #(.n(16))(.data_in(D_IN), .dbit(0), .sel(SEL), .clk(CLK_SLOWER), .clr(0), .data_out(D_OUT));

//shift D_OUT until D_OUT = 16'b0000..000
comp_nb #(.n(16)) shift_reg_output_zero(.a(D_OUT),.b(16'b0000000000000000),.eq(EQ),.lt(0),.gt(0));

//counts how many events or 1's happens that 
cntr_up_clr_nb #(.n(5)) EVENT_CNTR(.clk(CLK_SLOWER), .clr(CLR), .up(D_OUT[0]), .ld(LD), .D(0), .count(CNT), .rco(0));

CNT_WITH_PARITY = {PAR, CNT};




//let parity = 1 (ODD)
//let parity = 0 (EVEN)
//SW is in stone-age binary
//Use two 7-segment displays to display the indicate parity with EE for even
//parity and oo for odd parity
//
//
//if(parity == 1) { seg = "" (display "oo")}
//else{seg = "" (display "EE")}


//if (BTN == 1){//the cicuit calculates the paity and displays the results
//according to previous paragraph. It then waits for another button press}




endmodule
