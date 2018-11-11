`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer:  Victor Delaplaine, Esteban Rbuio
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: main
// Project Name: Exp. 11
// Target Devices: Basys3
// Tool Versions: 
// Description: .
// Dependencies: clk_divider_nbit.v, univ_sseg.v 
// 
// Revision:
// Revision 1.00 - File Created (07-07-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "./seq_detect_driver.v"


module main(SW,BTN,CLK,seg,an,led);

input CLK,BTN;
input [7:0] SW;
output [3:0] an;
output [7:0] seg, led;
wire Z;


FSM_SEQ_DETECTOR moore_Type(.X(SW),.BTN(BTN),.CLK(CLK),.Z(Z));

seq_detect_driver driver(.switches(SW),.btn(BTN),.reset(~Z),.seg(seg),.an(an),.leds(led));







endmodule
