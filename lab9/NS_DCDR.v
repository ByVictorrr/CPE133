`timescale 1ns/1ps

module NS_DCDR(x1, F1);

    input  [4:0]x1;

    output reg [3:0]F1;
  
  
always @(x1)

    begin

     if     (x1 == 5'b10000)   F1 = 4'b0001;

     else if (x1 == 5'b10001)  F1 = 4'b0010;

     else if (x1 == 5'b10010)  F1 = 4'b0011;

     else if (x1 == 5'b10011)  F1 = 4'b0100;

     else if (x1 == 5'b10100)  F1 = 4'b0101;

     else if (x1 == 5'b10101)  F1 = 4'b0110;

     else if (x1 == 5'b10110)  F1 = 4'b0111;

     else if (x1 == 5'b10111)  F1 = 4'b1000;

     else if (x1 == 5'b11000)  F1 = 4'b1001;

     else if (x1 == 5'b11001)  F1 = 4'b1010;

      else if (x1 == 5'b11010)  F1 = 4'b1011;

      else if (x1 == 5'b11011)  F1 = 4'b1100;

      else if (x1 == 5'b11100)  F1 = 4'b1101;

      else if (x1 == 5'b11101)  F1 = 4'b1110;

      else if (x1 == 5'b11110)  F1 = 4'b1111;

      else if (x1 == 5'b11111)  F1 = 4'b0000;

//counting down

     else if (x1 == 5'b00000)  F1 = F1-1;

     else if (x1 == 5'b00001)  F1 = F1-1;

     else if (x1 == 5'b00010)  F1 = F1-1;

     else if (x1 == 5'b00011)  F1 = F1-1;

     else if (x1 == 5'b00100)  F1 = F1-1;

     else if (x1 == 5'b00101)  F1 = F1-1;

     else if (x1 == 5'b00110)  F1 = F1-1;

     else if (x1 == 5'b00111)  F1 = F1-1;

     else if (x1 == 5'b01000)  F1 = F1-1;

     else if (x1 == 5'b01001)  F1 = F1-1;

     else if (x1 == 5'b01010)  F1 = F1-1;

     else if (x1 == 5'b01011)  F1 = F1-1;

     else if (x1 == 5'b01100)  F1 = F1-1;

     else if (x1 == 5'b01101)  F1 = F1-1;

     else if (x1 == 5'b01110)  F1 = F1-1;

     else if (x1 == 5'b01111)  F1 = F1-1;

     else if (F1 == 4'b0000) F1= 4'b0000;
     
end 

     endmodule
    
