`include "FSM_MULT.v"
`include "./SLAVE_CIRCUIT.v"
`include "../Modules/clk_divider_nbit.v"

module SR_Muliplier_5b(input CLK,input BTN, input [9:0] SW, output [9:0] SUM);

wire CLK_S, EQ, CLR, LD;
wire [1:0] SEL_A, SEL_B;

clk_divider_nbit #(.n(20)) slow(.clockin(CLK), .clockout(CLK_S));
  
// this is the actual multiplication of of the inputs  
FSM_MULT FSM(
.CLK(CLK), 
.BTN(BTN), 
.EQ(EQ), 
.CLR(CLR), 
.SEL_A(SEL_A), 
.SEL_B(SEL_B),
.LD(LD));
  
//this acculmulates  
SLAVE_CIRCUIT SLAVE(
.CLK(CLK), 
.CLR(CLR),  
.LD(LD), 
.SEL_A(SEL_A), 
.SEL_B(SEL_B), 
.SW(SW) ,
.EQ(EQ), 
.SUM(SUM));

endmodule
