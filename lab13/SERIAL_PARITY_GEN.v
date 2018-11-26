`include "../Modules/clk_divider_nbit.v"
`include "../Modules/comp_nb.v"
`include "../Modules/usr_nb.v"
`include "./FSM_PAR.v"
`include "../Modules/cntr_up_hold_nb.v"

//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 11/17/2018 08:05:03 AM
// Design Name: 
// Module Name: SERIAL_PARITY_GEN
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: Produces a CNT - the number of bits asserted (Positive logic)
// 		in the input SW.
// 		
// Dependencies: clk_divider_nbit.v, comp_nb.v, usr_nb.v, FSM_PAR.v,
// 		 cntr_up_hold_nb.v
// 
// Revision:
// Revision 1.00 - File Created (11-17-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SERIAL_PARITY_GEN(input CLK, input BTN, input [15:0] SW, output [4:0] CNT);

wire CLK_SLOWER; //slower clk 
wire [15:0] D_OUT;
wire [1:0] SEL;
wire EQ,CLR, CTRL;

clk_divider_nbit #(.n(17)) SLOWER_CLK(.clockin(CLK),.clockout(CLK_SLOWER)); 

usr_nb #(.n(16))(.data_in(SW), .dbit(0), .sel(SEL), .clk(CLK_SLOWER), .clr(0), .data_out(D_OUT));

//shift D_OUT until D_OUT = 16'b0000..000
comp_nb #(.n(16)) shift_reg_output_zero(.a(D_OUT),.b(16'b0000000000000000),.eq(EQ),.lt(0),.gt(0));


FSM_PAR FSM(.CLK(CLK_SLOWER),.BTN(BTN),.EQ(EQ),.CLR(CLR),.SEL(SEL), .CTRL(CTRL));

//counts how many events or 1's happens that 
cntr_up_hold_nb #(.n(5)) EVENT_CNTR(.clk(CLK_SLOWER), .clr(CLR), .up(D_OUT[0] & CTRL), .ld(0), .D(0), .count(CNT), .rco(0) );


endmodule
