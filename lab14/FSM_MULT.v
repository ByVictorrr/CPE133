`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer: Victor Delaplaine, Esteban Rubio
// 
// Create Date: 11/15/2018 08:05:03 AM
// Design Name: 
// Module Name: FSM_PAR
// Project Name: 
// Target Devices: Basy3 
// Tool Versions: 
// Description: A master controller for the overall circuit. This
// master-controller notifies a the shift register when to start the the shift operation on the
// 16 bit number using SEL to control the shift register. The shift state ends when that 16-bit number contains all
// 0's. During the shift state the Up control input for the 5b CNTR
// is crollered by CTRL to ensure in the wait state there is no up asserted.
//
//
// Dependencies: n/a
// 
// Revision:
// Revision 1.00 - File Created (11-17-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module FSM_MULT(input CLK, input BTN, input EQ, output reg CLR ,output reg [1:0] SEL_A, output reg [1:0] SEL_B, output reg LD);
     
    //- next state & present state variables
    reg  NS, PS; 
    //- bit-level state representations
    parameter st_0 = 1'b0, st_1=1'b1; 
    

    //- model the state registers
    always @ ( posedge CLK)
          PS <= NS; 
    
    
    //- model the next-state and output decoders
    always @ (*)
    begin
       CLR = 0; SEL = 2'b00; CTRL = 0;//LD = 0; // assign all outputs
       case(PS)
          
          st_0: //loads data into shift reg
          begin
	  LD = 0; SEL_A = 2'b00; SEL_B = 2'b00;
	   if(BTN ==1)
	   begin 
             SEL_A = 2'b01; //loads in parrallel data
	     SEL_B = 2'b01;
     	     CLR = 1;
             NS = st_1; 
     	    end
	    else 
	    begin
            SEL_A = 2'b00;
	    SEL_B = 2'b00;
	    CLR = 0;
	    NS = st_0;
            end
     	  end 
          
          st_1: //shift state
      begin
	  CLR = 0;
	  LD = 1;
		if(EQ == 1)
		begin 
		SEL_A = 2'b00;
		SEL_B = 2'b00;
		NS = st_0;
		end
		else
		begin
		SEL_A = 2'b10;
		SEL_B = 2'b11;
		NS = st_1;
		end
           end   
    default: NS = st_0;      
      
          endcase
      end              
endmodule

