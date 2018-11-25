`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 07/04/2018 02:46:31 PM
// Design Name: 
// Module Name: cntr_udr_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic n-bit up/down counter with asynchronous reset. 
//     This counter also has RCO that works for both up & down counting. 
// 
//      cntr_udclr_nb #(16) MY_CNTR (
//          .clk   (my_clk), 
//          .clr   (my_clr), 
//          .up    (my_up), 
//          .ld    (my_ld), 
//          .D     (my_D), 
//          .count (my_count), 
//          .rco   (my_rco)   ); 
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (07-06-2018)
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cntr_udclr_nb(clk, clr, up, ld, D, count, rco); 
    input  clk, clr, up, ld; 
    input  [n-1:0] D; 
    output   reg [n-1:0] count; 
    output   reg rco; 

    //- default data-width 
    parameter n = 8; 
    
    always @(posedge clr, posedge clk)
    begin 
        if (clr == 1)       // asynch reset
           count <= 0;
        else if (ld == 1)   // load new value
           count <= D; 
        else if (up == 1)   // count up (increment)
           count <= count + 1; 
        else if (up == 0)   // count down (decrement)
           count <= count - 1;  
    end 
       
    
    //- handles the RCO, which is direction dependent
    always @(count, up)
    begin 
       if ( up == 1 && &count == 1'b1)
          rco = 1'b1;
       else if (up == 0 && |count == 1'b1)
          rco <= 1'b1;
       else 
          rco <= 1'b0; 
    end
    
endmodule