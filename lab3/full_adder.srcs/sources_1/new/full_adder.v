`timescale 1ns / 1ps                                                                                     
//////////////////////////////////////////////////////////////////////////////////                       
// Company: VANE                                                                                        
// Engineer: Victor Delaplaine, Est                                                                                            
//                                                                                                       
// Create Date: 10/01/2018 12:07:24 PM                                                                   
// Design Name:                                                                                          
// Module Name: Full_Adder                                                                            
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
                                                                                                         
                                                                                                         
module project2(                                                                                         
    input A,                                                                                             
    input B,                                                                                             
    input Cin,                                                                                           
    output sumsop,                                                                                       
    output sumpos,                                                                                       
    output cosop,                                                                                        
    output copos                                                                                         
    );                                                                                                   
                                                                                                         
    assign sumpos = ( A | B | Cin) & ( A | ~B | ~Cin) & ( ~A | B | ~Cin) & ( ~A | ~B | Cin);             
                                                                                                         
    assign sumsop = ( ~A & ~B & Cin) | ( ~A & B & ~Cin) | ( A & ~B & ~Cin) | ( A & B & Cin);             
                                                                                                         
    assign cosop = ( ~A & B & Cin) | ( A & ~B & Cin) | ( A & B & ~Cin) | ( A & B & Cin);                 
                                                                                                         
    assign copos = ( A | B | Cin) & ( A | B | ~Cin) & ( A | ~B | Cin) & ( ~A | B | Cin);                 
                                                                                                         
endmodule                                                       
