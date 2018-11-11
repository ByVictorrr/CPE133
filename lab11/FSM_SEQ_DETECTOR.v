`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer:  Victor Delaplaine, Esteban Rbuio
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: CNTR_3b_UPDOWN
// Project Name:  Exp 10
// Target Devices: Basys3
// Tool Versions: 
// Description: A 3bit counter that that has a RST asynchrounous,
// HOLD,UP,EVEN,ODD synchrounous inputs and a mealy and moore ouput. These
// inputs controls the count sequence of the counter; if Up is asserted it
// counts in a upward sequence (ODD or even). Otherwise counts in a downard
// seqence determined by (ODD or even).   
//    Note: data widths of state variables are not specified 
//
// Dependencies: 
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

    parameter [2:0] st_a= 3'b000, st_b = 3'b001, st_c = 3'b010,  st_d = 3'b011,  st_e = 3'b100, st_f = 3'b101, st_g = 3'b110;
    
    //- model the state registers
    always @ ( posedge CLK)
          PS <= NS; 
    
    
    //- model the next-state and output decoders
    always @ (*)
    begin
       Z = 0; // assign all outputs
       case(PS)
          st_a:
          begin
             Z=0;
	     //unconditional for btn
	     if(BTN == 1 || BTN == 0)
	       begin
		if(X!=1) NS = st_b;
		else NS=st_a;
		end
	     end
          st_b:
          begin
             Z=0;
	     if(BTN == 1 )
	       begin
		if(X==1) NS = st_c;
		else NS=st_b; //self-loop
		end
	      else //if button =0
		begin
		if(X!=1) NS = st_f;
		else NS = st_c; //default
		end
	     end
          st_c:
          begin
             Z=0;
	     if(BTN == 1)
	       begin
		if(X==1) NS = st_d;
		else NS=st_c;
		end
	      else
		begin
		if(X==1) NS = st_d;
		else NS = st_c;
		end
	     end
          st_d:
          begin
             Z=0;
	     if(BTN == 1 )
	       begin
		if(X==1) NS = st_e;
		else NS=st_d;
		end
	      else //if button =0
		begin
		if(X!=1) NS = st_b;
		else NS = st_d; //default
		end
	     end

	  st_e:
          begin
	    Z=0;
	     if(BTN == 1)
	       begin
		if(X!=1) NS = st_f;
		else NS=st_e;
		end
	      else NS = st_e;
	     end
          st_f:
          begin
             Z=0;
	     if(BTN == 1)
	       begin
		if(X==1) NS = st_g;
		else NS=st_f;
		end
	      else //if button =0
		begin
		if(X==1) NS = st_g;
		else NS = st_f; //default
		end
	     end
          st_g:
		  //unsure
          begin
             Z=1;
		if(X==1) NS = st_a;
		else NS=st_f;
	    end
		default: NS = st_a; 
          
          endcase
       end        
endmodule

