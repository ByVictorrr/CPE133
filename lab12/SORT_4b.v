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

//overall module
module SORT_4b(input BTN, input CLR, input CLK, output led);

//controller circuit
FSM_4b_SORT fsm(.CLK(), .CLR(), .BTN(), .LT(), .led(), .SEL(), .LD()); 


//slave circuit instantion
SLAVE_CIRCUIT fsmControlled(.CLK(), .SEL(), .LD(), .LT()); 



endmodule
