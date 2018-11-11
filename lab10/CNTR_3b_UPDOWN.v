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

module CNTR_3b_UPDOWN(RST, HOLD, UP,EVEN,ODD, CLK, mealy, moore); 
    input  RST, UP, EVEN, ODD, CLK, HOLD; 
    output reg [2:0] mealy, moore;
     
    //- next state & present state variables
    reg [2:0] NS, PS; 
    //- bit-level state representations
    parameter [2:0] st_0= 2'b000, st_1 = 3'b001, st_2 = 3'b010,  st_3 = 3'b011,  st_4 = 3'b100, st_5 = 3'b101, st_6 = 3'b110, st_7 = 3'b111;
    

    //- model the state registers
    always @ (negedge RST, posedge CLK)
       if (RST == 0) 
          PS <= st_0; 
       else
          PS <= NS; 
    
    
    //- model the next-state and output decoders
    always @ (*)
    begin
       mealy = 3'b000; moore = 3'b000; // assign all outputs
       case(PS)
          st_0:
          begin
             moore = 3'b000;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(EVEN == 1) NS = st_2; // jumps to even sequence
			else NS = st_1; //doesnt matter if odd because next state is odd
		end
		
		else //if up is zero 
		begin
			if(EVEN == 1) NS = st_6; // jumps to even sequence
			else NS = st_7; //doesnt matter if odd because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
          end
          st_1:
 	  begin
             moore = 3'b001;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(ODD == 1) NS = st_3; // jumps to even sequence
			else NS = st_2; //doesnt matter if odd because next state is odd
		end
		
		else //if up is zero 
		begin
			if(ODD == 1) NS = st_7; // jumps to even sequence
			else NS = st_0; //doesnt matter if odd because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
	     end
          st_2:
          begin
             moore = 3'b010;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(EVEN == 1) NS = st_4; // jumps to even sequence
			else NS = st_3; //doesnt matter if odd because next state is odd
		end
		
		else //if up is zero 
		begin
			if(EVEN == 1) NS = st_0; // jumps to even sequence
			else NS = st_1; //doesnt matter if odd because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
	     end
          st_3:
 	  begin
             moore = 3'b011;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(ODD == 1) NS = st_5; // jumps to odd sequence
			else NS = st_4; //doesnt matter if even because next state is odd
		end
		
		else //if up is zero 
		begin
			if(ODD == 1) NS = st_1; // jumps to odd sequence
			else NS = st_2; //doesnt matter if even because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
	     end
          st_4:
          begin
             moore = 3'b100;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(EVEN == 1) NS = st_6; // jumps to even sequence
			else NS = st_5; //doesnt matter if odd because next state is odd
		end
		
		else //if up is zero 
		begin
			if(EVEN == 1) NS = st_2; // jumps to even sequence
			else NS = st_3; //doesnt matter if odd because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
          end
          st_5:
 	  begin
             moore = 3'b101;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(ODD == 1) NS = st_7; // jumps to odd sequence
			else NS = st_6; //doesnt matter if even because next state is odd
		end
		
		else //if up is zero 
		begin
			if(ODD == 1) NS = st_3; // jumps to odd sequence
			else NS = st_4; //doesnt matter if even because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
	     end
          st_6:
          begin
             moore = 3'b110;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(EVEN == 1) NS = st_0; // jumps to even sequence
			else NS = st_7; //doesnt matter if odd because next state is odd
		end
		
		else //if up is zero 
		begin
			if(EVEN == 1) NS = st_4; // jumps to even sequence
			else NS = st_5; //doesnt matter if odd because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
          end
          st_7:
 	  begin
             moore = 3'b111;
	     //if not held then 8 + 1 possible transistions
             if(HOLD != 1 )
	       begin
		if(UP==1)
		begin
			if(ODD == 1) NS = st_1; // jumps to odd sequence
			else NS = st_0; //doesnt matter if even because next state is odd
		end
		
		else //if up is zero 
		begin
			if(ODD == 1) NS = st_5; // jumps to odd sequence
			else NS = st_6; //doesnt matter if even because next state is odd
		end
	     end
	     else NS = PS; //if hold is asserted
	   end   
          default: NS = st_0; 
          
          endcase
       end        
endmodule

