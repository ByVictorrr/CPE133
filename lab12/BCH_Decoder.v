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


module BCH_Decoder(
    input [3:0] x,
    output reg [7:0] seg);
    

    always @(x)
    
    begin
    //cases for x
        case(x)
	4'b0000 :      	//Hexadecimal 0
	x = ~ 8'b11111100;
	4'b0001 :    		//Hexadecimal 1
	x = ~ 8'b01100000;
	4'b0010 :  		// Hexadecimal 2
	x = ~ 8'b11011010; 
	4'b0011 : 		// Hexadecimal 3
	x = ~ 8'b11110010;
	4'b0100 :		// Hexadecimal 4
	x = ~ 8'b01100110;
	4'b0101 :		// Hexadecimal 5
	x = ~ 8'b10110110;  
	4'b0110 :		// Hexadecimal 6
	x = ~ 8'b10111110;
	4'b0111 :		// Hexadecimal 7
	x = ~ 8'b11100000;
	4'b1000 :     		 //Hexadecimal 8
	x = ~ 8'b11111110;
	4'b1001 :    		//Hexadecimal 9
	x = ~ 8'b11110110;
	4'b1010 :  		// Hexadecimal A
	x = ~ 8'b11101110; 
	4'b1011 : 		// Hexadecimal B
	x = ~ 8'b00111110;
	4'b1100 :		// Hexadecimal C
	x = ~ 8'b10011100;
	4'b1101 :		// Hexadecimal D
	x = ~ 8'b01111010;
	4'b1110 :		// Hexadecimal E
	x = ~ 8'b10011110;
	4'b1111 :		// Hexadecimal F
	x = ~ 8'b10001110;

	default: x=8'b0000000;

	endcase
end

endmodule
