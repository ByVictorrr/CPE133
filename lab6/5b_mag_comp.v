`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 12:31:47 PM
// Design Name: 
// Module Name: 5b_mag_comp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module rca_5b(
    input [n-1:0] a,
    input [n-1:0] b,
    input cin,
    output reg [n-1:0] sum,
    output reg co
    );
	
    parameter n = 5;
	
    reg [n:0] tmp_sum;  
    
    always @(a,b,cin)
    begin
       {co,sum} = a + b + cin;    
    end
    
endmodule







module mux_2t1_a(SEL, D1, D2, F); 
    
    input  SEL;
   input  [4:0] D1;
   input [4:0] D2; 
    output reg [4:0] F; 

  always @(SEL,D1,D2)

   begin
      if      (SEL == 0)  F = D1; //twos complement x 
      else if (SEL == 1)  F = D2; //else output x
      else                F = 5'b00000;
   end
           

endmodule






module comp_5b(a, b, eq, lt, gt);

    input  [4:0] a, b;

    output reg eq, lt, gt;

    always @ (a,b)

    begin     

       if (a == b)
       begin    
          eq = 1; lt = 0;  gt = 0;  
       end
       else if (a > b)  
       begin    
          eq = 0; lt = 0;  gt = 1;
       end
       else if (a < b) 
       begin    
          eq = 0; lt = 1;  gt = 0;
       end
       else
       begin    
          eq = 0; lt = 0;  gt = 0;
       end 
    end
endmodule








module mag5b_comp(
    input [4:0] x,
    input [4:0] y,
    output [4:0] absX,
    output GT,
    output EQ,
    output LT
    );
    
    parameter oneS = 5'b00001;
   
   //wire nor_output_SELX, nor_output_SELY;
    //for output of rca
    wire x_bar, y_bar;
    //for output of mux
    wire choose_x_OR_x_bar, choose_y_OR_y_bar;
    
    
   //nor_output_SELX == ~( x[4] | 0);
    //nor_output_SELY == ~( y[4] | 0);
   
//x_bar = twoComp_x
rca_5b twoComp_x( .a(~x),
                .b(oneS),
               .cin(0),
               .sum(x_bar),
               .cout(0) //0 because were not using it
                  

);

//y_bar = twoComp_y
rca_5b twoComp_y( .a(~ y ),
                .b(oneS),
                 .cin(0),
                  .sum(y_bar),
                  .cout(0) //because were not using it

);

//choose_x_OR_x_bar = X_MUX
mux_2t1_a X_MUX( .SEL(~( x[4] | 0)), //from nor gate output
                  .D1(x), //just x by itself
                   .D2(x_bar), //from rca output 
                   .F(choose_x_OR_x_bar)



);

//choose_y_OR_y_bar = y_MUX
mux_2t1_a Y_MUX( .SEL(~( y[4] | 0)), //from nor gate output
                  .D1(y), //just y by itself
                   .D2(y_bar), //from rca output 
                   .F(choose_y_OR_y_bar)



);


////////////// FOR ABS Value if(|x| = |y| )//////////////////
         
     mux_2t1_a absValueOfX(
        .SEL(x[4]),
         .D1(x), //0 select
         .D2(x_bar), //1 select
         .F(absX)

);
  ///////////////////////////////////////////////

//finalOuput = { EQ, LT, GT}
comp5b finalOutput(
                    .a(x), //choose_x_OR_x_bar
                     .b(y), //choose_y_OR_y_bar
                     .eq(EQ), //EQ final
                     .lt(LT), //LT final
                      .gt(GT) //GT final
                );






endmodule





