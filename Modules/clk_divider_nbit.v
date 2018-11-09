`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2018 07:53:15 PM
// Design Name: 
// Module Name: clk_divider_nbit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Parameterized clock divider
//
// Usage: 
//
//      clk_divder_nbit #(.n(16)) MY_DIV (
//          .clockin (my_clk_in), 
//          .clockout (my_clk_out) 
//          );  
// 
// Dependencies: 
// 
// Created: 06-28-2018
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module clk_divider_nbit(clockin, clockout); 
    input clockin; 
    output wire clockout; 

    parameter n = 13; 
    reg [n:0] count; 

    always@(posedge clockin) 
    begin 
        count <= count + 1; 
    end 

    assign clockout = count[n]; 
endmodule 
