`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Victor Delaplaine, Esteben Rubios
// 
// Create Date: 10/07/2018 10:23:19 PM
// Design Name: VANE
// Module Name: BCD_Decoder
// Project Name: 7 - Segment BCD decoder
// Target Devices: 
// Tool Versions: 
// Description: A project in which we learned to convert binary inputs into a display of decimal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_Decoder(
    input [3:0] x,
    output reg [7:0] seg);
    

    always @(x)
    
    begin
    //cases for x

        case(x)
            //if no inputs
            4'b0000 : 
                seg = 8'b00000011; //output a zero
            4'b0001 :           
                seg = 8'b10011111; 
            4'b0010 :  
                seg = 8'b00100101;
            4'b0011 :       
                seg = 8'b00001101;
            4'b0100 :        // Hexadecimal 4
                seg = 8'b10011001;
            4'b0101 :        // Hexadecimal 5
                seg = 8'b01001001;
            4'b0110 :        // Hexadecimal 6
                seg = 8'b01000001;
            4'b0111 :        // Hexadecimal 7
                seg = 8'b00011111;
            4'b1000 :              //Hexadecimal 8
                seg =  8'b00000001;
            4'b1001 :           
                seg =  8'b00001001;
             default: 
                seg = 8'b11111111;
      endcase
     end       
endmodule
