`timescale 1ns/1ps

module Two_Digit_DEC_decoder(x, F1, F2);

    input  [4:0]x;

    output reg [3:0]F1, F2;
  
  
always @(x)

    begin

    
       if      (x2 == 4'b0000) F2 = 4'b0000; F1 = x2;

      else if (x2 == 4'b0001)  F2 = 4'b0000; F1 = x2;

      else if (x2 == 4'b0010)  F2 = 4'b0000; F1 = x2;

      else if (x2 == 4'b0011)  F2 = 4'b0000; F1 = x2; //three

      else if (x2 == 4'b0100)  F2 = 4'b0000; F1 = x2; //four

      else if (x2 == 4'b0101)  F2 = 4'b0000; F1= x2; //five

      else if (x2 == 4'b0110)  F2 = 4'b0000; F1 = x2;

      else if (x2 == 4'b0111)  F2 = 4'b0000; F1 = x2; 

      else if (x2 == 4'b1000)  F2 = 4'b0000; F1 = x2;

      else if (x2 == 4'b1001)  F2 = 4'b0000; F1 = x2; //nine

      else if (x2 == 4'b1010)  F2 = 4'b0001; F1 = 4'b0000; //10

      else if (x2 == 4'b1011)  F2 = 4'b0001; F1 = 4'b0001;

      else if (x2 == 4'b1100)  F2 = 4'b0001; F1 = 4'b0010;

      else if (x2 == 4'b1101)  F2 = 4'b0001; F1 = 4'b0011;

      else if (x2 == 4'b1110)  F2 = 4'b0001; F1 = 4'b0100;

      else if (x2 == 4'b1111)  F2 = 4'b0001; F1 = 4'b0101; //fithteen
	
      else F1 = 4'b0000; F2 4'b0000;


      endmodule
