`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Victor Delaplaine, Esteben Rubios
// 
// Create Date: 10/07/2018 10:23:19 PM
// Design Name: VANE
// Module Name: BCH_Decoder
// Project Name: Exp 12
// Target Devices: Basy3
// Tool Versions: 
// Description: A module convert binary inputs into hexadecimal 7-segment displays
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
                seg = 8'b00001001; //Hexadeciaml 9
	    4'b1010 : //ten
		seg = 8'b00010001;
	    4'b1011 : //Hex eleven
		seg = 8'b11000001;
            4'b1100 : //hex 12
		seg = 8'b01100011;
	    4'b1101 : //hex 13
		seg =  8'b1000010;
            4'b1110 : //hex 14      
		seg = 8'b01100001;
	    4'b1111:	        
		seg = 8'b01110001;
           
      
	default: 
                seg = 8'b11111111;
      endcase
     end       
endmodule
