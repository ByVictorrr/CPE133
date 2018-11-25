`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/5/2018 12:31:47 PM
//// Design Name: 
//// Module Name: Two_Digit_Decoder
//// Project Name: Exp 9
//// Target Devices: Basy3
//// Tool Versions: 
///* Description: Separates a 4-bit binary number into its if it were
//converted to a decimal number. The 4-bit binary number is separated
//variables F1 (1’s place)  and F2 (tens place). 
//*/
//// Dependencies: n/a  
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//
module Two_Digit_Decoder( input [4:0] x,output reg [3:0] F1, output reg [3:0] F2);


always @ (*)

	begin
    //case statement for ones place
        case (x)

                5'b00000 : F1 = x;
                5'b00001 : F1 = x;
                5'b00001 : F1 = x;
                5'b00010: F1 = x;
                5'b00010: F1 = x;
                5'b00011: F1 = x;
                5'b00100: F1 = x;
                5'b00101: F1 = x; //five
                5'b00110: F1 = x;
                5'b00111: F1 = x;
                4'b01000: F1 = x;
                4'b01001: F1 = x; //nine
                5'b01010: F1 = 4'b0000; //ten
                5'b01011: F1 = 4'b0001; 
                5'b01100: F1 = 4'b0010; //twelve                
                5'b01101: F1 = 4'b0011;
                5'b01110: F1 = 4'b0100; //fourteen  
                5'b01111: F1 = 4'b0101; //fithteen
                5'b10000: F1 = 4'b0110; 
            default: F1=4'b0000;

      endcase



          //case statement for tens place
          case (x)

                  5'b00000 : F2 = 4'b0000;
                  5'b00001 : F2 = 4'b0000 ;
                  5'b00010: F2 = 4'b0000;
                  5'b00010: F2 = 4'b0000;
                  5'b00011: F2 = 4'b0000;
                  5'b00100: F2 = 4'b0000;
                  5'b00101: F2 = 4'b0000; //five
                  5'b00110: F2 = 4'b0000;
                  5'b00111: F2 = 4'b0000;
                  5'b01000: F2 = 4'b0000;
                  4'b01001: F2 = 4'b0000; //nine
                  4'b01010: F2 = 4'b0001; //ten
                  5'b01011: F2 = 4'b0001;
                  5'b01100: F2 = 4'b0001; //twelve            
                  5'b01101: F2 = 4'b0001;
                  5'b01110: F2 = 4'b0001; //fourteen  
                  5'b01111: F2 = 4'b0001; //fithteen 
                  5'b10000: F2 = 4'b0001; //sixteen  
                 default: F2 = 4'b0000;
         endcase	
         
        end

endmodule
