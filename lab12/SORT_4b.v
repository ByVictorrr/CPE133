`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/5/2018 12:31:47 PM
//// Design Name: 
//// Module Name: main
//// Project Name: Exp 12
//// Target Devices: Basy3
//// Tool Versions: 
///Description: Takes one external input - BTN. When the BTN is pressed the
//// Dependencies:  Multiplexed_Display.v
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//

`include "./FSM_4b_SORT.v"
`include "./SLAVE_CIRCUIT.v"
`include "../Modules/clk_divider_nbit.v"

module SORT_4b(input BTN, input CLK, output led);

wire CLK_SLOWER;

wire [2:0] LT;
wire [3:0] LD;
wire [5:0] SEL;

clk_divider_nbit #(.n(25)) slowerCLK(.clockin(CLK),.clockout(CLK_SLOWER));
//controller circuit
FSM_4b_SORT fsm(.CLK(CLK_SLOWER), .BTN(BTN), .LT(LT), .led(led), .SEL(SEL), .LD(LD)); 

//slave circuit instantion
SLAVE_CIRCUIT fsmControlled(.CLK(CLK_SLOWER), .SEL(SEL), .LD(LD), .LT(LT)); 


endmodule
