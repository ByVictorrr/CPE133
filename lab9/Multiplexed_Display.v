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


module  Multiplexed_Display(
    input [3:0] y,
    output reg [7:0] seg,
    output [1:0] an );
 
//two clocks one for displaying
 
    always @(seg)
  
    begin
   
        case(y)
            //if no inputs
            4'b0000 : 
                seg = 8'b00000011; 
            4'b0001 :           
                seg = 8'b10011111; 
            4'b0010 :  
                seg = 8'b00100101;
            4'b0011 :       
                seg = 8'b00001101;
            4'b0100 :     
                seg = 8'b10011001;
            4'b0101 :      
                seg = 8'b01001001;
            4'b0110 :      
                seg = 8'b01000001;
            4'b0111 :        
                seg = 8'b00011111;
            4'b1000 :            
                seg =  8'b00000001;
            4'b1001 :           
                seg =  8'b00001001;
             default: 
                seg = 8'b11111111;
      endcase
     end       
endmodule
