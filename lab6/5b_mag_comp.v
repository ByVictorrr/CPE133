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



module rca_nb(
    input [n-1:0] a,
    input [n-1:0] b,
    input cin,
    output reg [n-1:0] sum,
    output reg co
    );
	
    parameter n = 8;
	
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
      else  F = D2; //else output 
   end
           

endmodule






module comp_nb(a, b, eq, lt, gt);

    input  [4:0] a, b;

    output reg eq, lt, gt;

    parameter n = 8;

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
    
   
   //wire nor_output_SELX, nor_output_SELY;
    //for output of rca
    wire [4:0]x_bar;
    wire [4:0] y_bar;
    //for output of mux
    wire [4:0] choose_x_OR_x_bar;
    wire [4:0] choose_y_OR_y_bar;
  
  
   
//x_bar = twoComp_x
rca_nb #(.n(5)) twoComp_x( .a(~x),
                .b(5'b00000),
               .cin(1),
               .sum(x_bar),
               .co(0) //0 because were not using it
                  

);

//y_bar = twoComp_y
rca_nb #(.n(5)) twoComp_y( .a(~ y ),
                .b(5'b00000),
                 .cin(1),
                  .sum(y_bar),
                  .co(0) //because were not using it

);

//choose_x_OR_x_bar = X_MUX
mux_2t1_a X_MUX( .SEL(x[4]), //from nor gate output
                  .D1(x), //just x by itself
                   .D2(x_bar), //from rca output 
                   .F(choose_x_OR_x_bar)



);

//choose_y_OR_y_bar = y_MUX
mux_2t1_a Y_MUX( .SEL(y[4]), //from nor gate output
                  .D1(y), //just y by itself
                   .D2(y_bar), //from rca output 
                   .F(choose_y_OR_y_bar)



);




  


//finalOuput = { EQ, LT, GT}
comp_nb #(.n(5)) finalOutput(
                    .a(choose_x_OR_x_bar), //choose_x_OR_x_bar
                     .b(choose_y_OR_y_bar), //choose_y_  OR_y_bar
                     .eq(EQ), //EQ final
                     .lt(LT), //LT final
                      .gt(GT) //GT final
                );



 assign absX = choose_x_OR_x_bar; 


endmodule





