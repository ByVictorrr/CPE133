`timescale 1ns/1ps

 module OUTPUT_DCDR(x2, F_Stone);
      input  [3:0]x2;
 
     output reg [14:0]F_Stone;
 
 always @(*)
 
      if      (x2 == 4'b0000)     F_Stone = 15'b000000000000000;
 
      else if (x2 == 4'b0001)  F_Stone = 15'b000000000000001;
 
      else if (x2 == 4'b0010)  F_Stone = 15'b000000000000011;
 
      else if (x2 == 4'b0011)  F_Stone = 15'b000000000000111;
 
      else if (x2 == 4'b0100)  F_Stone = 15'b000000000001111;
 
      else if (x2 == 4'b0101)  F_Stone = 15'b000000000011111;
 
      else if (x2 == 4'b0110)  F_Stone = 15'b000000000111111;
 
      else if (x2 == 4'b0111)  F_Stone = 15'b000000001111111;
 
      else if (x2 == 4'b1000)  F_Stone = 15'b000000011111111;
 
      else if (x2 == 4'b1001)  F_Stone = 15'b000000111111111;
 
      else if (x2 == 4'b1010)  F_Stone = 15'b000001111111111;
 
      else if (x2 == 4'b1011)  F_Stone = 15'b000011111111111;
 
      else if (x2 == 4'b1100)  F_Stone = 15'b000111111111111;
 
      else if (x2 == 4'b1101)  F_Stone = 15'b001111111111111;
 
      else if (x2 == 4'b1110)  F_Stone = 15'b011111111111111;
 
      else if (x2 == 4'b1111)  F_Stone = 15'b111111111111111;
 
      else  F_Stone = 15'b000000000000000;
 
 
 endmodule
