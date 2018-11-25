`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: fsm_template
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic FSM model with both Mealy & Moore outputs. 
//    Note: data widths of state variables are not specified 
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (07-07-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module FSM_PAR(input CLK, input BTN, input EQ, output reg CLR ,output reg [1:0] SEL);
     
    //- next state & present state variables
    reg [1:0] NS, PS; 
    //- bit-level state representations
    parameter [1:0] st_0=2'b00, st_1=2'b01, st_2=2'b10; 
    

    //- model the state registers
    always @ ( posedge CLK)
          PS <= NS; 
    
    
    //- model the next-state and output decoders
    always @ (*)
    begin
       CLR = 0; SEL = 2'b00; //LD = 0; // assign all outputs
       case(PS)
          st_0: //loads data into shift reg
          begin
	  CTRL = 0;
	   if(BTN ==1)
	   begin 
             SEL = 2'b01; //loads in parrallel data
     	     CLR = 1;
             NS = st_1; 
     	    end
	    else 
	    begin
            SEL = 2'b00;
	    CLR = 0;
	    NS = st_0;
            end
     	  end 
          st_1: //load
          begin
	  SEL = 2'b10;
	  CLR = 0;
	  CTRL = 1;
	  if(EQ == 1) NS = st_1; 
	  else NS = st_0;
  	  end
	  default: NS = st_0; 
          endcase
      end              
endmodule

