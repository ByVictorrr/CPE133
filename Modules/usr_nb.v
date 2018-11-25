`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 07/04/2018 02:46:31 PM
// Design Name: 
// Module Name: usr_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic n-bit universial shift register 
//                    with a asynchronous positive logic reset. 
//
//
//      SEL  |  Operation   
//   -----------------------------------------------
//       00  |  Hold
//       01  |  Load         (input data_in)
//       10  |  Shift left   (input dbit on right)
//       11  |  Shift right  (input dbit on left)
//
//      usr_nb #(.n(16)) MY_USR (
//          .data_in (my_data_in), 
//          .dbit (my_dbit), 
//          .sel (my_sel), 
//          .clk (my_clk), 
//          .clr (my_clr), 
//          .data_out (my_data_out)
//          );  
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (07-06-2018)
//        
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module usr_nb(data_in, dbit, sel, clk, clr, data_out); 
    input  [n-1:0] data_in; 
    input  dbit, clk, clr; 
    input  [1:0] sel; 
    output reg [n-1:0] data_out; 

    parameter n = 8; 
    
    always @(posedge clr, posedge clk)
    begin 
        if (clr == 1)     // asynch reset
           data_out <= 0;
        else 
           case (sel) 
              0: data_out <= data_out;                // hold value
              1: data_out <= data_in;                 // load
              2: data_out <= {data_out[n-2:0],dbit};  // shift left
              3: data_out <= {dbit,data_out[n-1:1]};  // shift right
              default data_out <= 0; 
           endcase 
    end
    
endmodule