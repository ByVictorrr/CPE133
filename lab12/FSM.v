`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer:  Victor Delaplaine, Esteban Rbuio
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: FSM_SEQ_DETECTOR
// Project Name:  Exp 11
// Target Devices: Basys3
// Tool Versions: 
// Description: A seqence detector built from a the fsm module that will
// detect the sequence of bits {0,1,1,1,0,1} when the button is clicked and
// {0,1,1,0,0,1} when the button isnt clicked. 
//   
//
// Dependencies: n/a
// 
// Revision:
// Revision 1.00 - File Created (07-07-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module  FSM_SEQ_DETECTOR(X,BTN, CLK,Z); 
    input X, CLK,BTN; 
    output reg  Z; //more type
     
    //- next state & present state variables
    reg [2:0] NS, PS; 
    //- bit-level state representations

    parameter [2:0] st_0= 3'b000, st_1 = 3'b001, st_2 = 3'b010,  st_3 = 3'b011,  st_4 = 3'b100, st_5 = 3'b101, st_6 = 3'b110, st_7 = 3'b111;
    
    //- model the state registers
    always @ ( posedge CLK)
          PS <= NS; 
    
    
    //- model the next-state and output decoders
    always @ (*)
    begin
       Z = 0; // assign all outputs
       case(PS)
          st_0:
          begin
             Z=0;
		if(X!=1) NS = st_1;
		else NS=st_0;
	     end
          st_1:
          begin
             Z=0;
		if(X==1) NS = st_2;
		else NS=st_0; //self-loop
	     end
          st_2:
          begin
             Z=0;
		if(X==1) NS = st_3;
		else NS=st_1;
	     end
          st_3:
          begin
             Z=0;
	     if(BTN == 0 )
	       begin
		if(X==0) NS = st_4;
		else NS=st_0; 
		end
	      else //if button =0
		begin
		if(X==1) NS = st_5;
		else NS = st_1; //default
		end
	     end

	  st_4:
          begin
	    Z=0;
	     if(BTN == 1)
	       begin
		if(X==1) NS = st_2;
		else NS=st_1;
		end
	      else
	        begin 
		if(X==1)NS = st_2;
		else NS = st_6;
	     end
     	end
          st_5:
          begin
             Z=0;
	     if(BTN == 1)
	       begin
		if(X==1) NS = st_0;
		else NS=st_6;
		end
	      else //if button =0
		begin
		if(X==1) NS = st_0;
		else NS = st_1; //default
		end
	     end
          st_6: //might need button condition 
          begin
    	      Z=0;
		if(X==1) NS = st_7; //reached the goal
		else NS=st_1;
	     end

	st_7:
	begin
   	Z=1;
	if(X==1) NS = st_0; //reached the goal
	else NS=st_1;
	end
	default: NS = st_0; 
          endcase
       end        
endmodule

