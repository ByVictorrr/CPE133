//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 10/07/2018 10:23:19 PM
// Design Name: VANE
// Module Name: BCD_Decoder
// Project Name: 7 - Segment BCD decoder
// Target Devices: 
// Tool Versions: 
// Description: A project in which we learned learned how a BCD works and is applied to a 7-segment display decoder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_Decoder(
    input [3:0] bcd,
    input [3:0] switch,
    output reg [7:0] display,
    output [3:0] an);
 
 assign an = ~switch;
 
    always @(bcd)
  
    begin
    //cases for bcd
        case(bcd)
            //if no inputs
            4'b0000 : 
                display = 8'b00000011; 
            4'b0001 :           
                display = 8'b10011111; 
            4'b0010 :  
                display = 8'b00100101;
            4'b0011 :       
                display = 8'b00001101;
            4'b0100 :     
                display = 8'b10011001;
            4'b0101 :      
                display = 8'b01001001;
            4'b0110 :      
                display = 8'b01000001;
            4'b0111 :        
                display = 8'b00011111;
            4'b1000 :            
                display =  8'b00000001;
            4'b1001 :           
                display =  8'b00001001;
             default: 
                display = 8'b11111111;
      endcase
     end       
endmodule
