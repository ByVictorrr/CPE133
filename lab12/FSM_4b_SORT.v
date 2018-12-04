`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  VANE
// Engineer:  Victor Delaplaine, Esteban Rbuio
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: FSM_4b_SORT
// Project Name:  Exp 12
// Target Devices: Basys3
// Tool Versions: 
// Description: Takes in a status signal 3-bit LT signal that notifies if one number arr_0 is less than arr_1 if 
//		so it doesnt put load high. It does this for 9-clock signals until arr_0 is the least value and 
//		arr_3 has the highest value.
//   
//
// Dependencies: n/a
// 
// Revision:
// Revision 1.00 - File Created (07-07-2018) 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module FSM_4b_SORT(input CLK, input BTN, input [2:0] LT, output reg led, output reg [5:0] SEL, output reg [3:0] LD, output reg CLR); 

  //- next state & present state variables
    reg [3:0] NS, PS;
    //- bit-level state representations

    parameter [3:0] st_0= 4'b0000, st_1 = 4'b0001, st_2 = 4'b0010,  st_3 = 4'b0011,  st_4 = 4'b0100, st_5 = 4'b0101, st_6 = 4'b0110, st_7 = 4'b0111, st_8 = 4'b1000, st_9 = 4'b1001, st_10 = 4'b1010;
  
    always @ ( posedge CLK)
    	begin
	    PS <= NS; 
    	end
    
    //- model the next-state and output decoders
    always @ (*)
    begin
       //initializing outputs
       SEL = 6'b000000;
       LD  = 4'b0000;
      // LT  = 3'b000; should already assign
       
       case(PS)

	       
	       
	        st_0: //waiting state
	   begin
		   led = 1; //sort has completed
   	   	if(BTN == 1)
	   	begin
	    	CLR = 1; //clear 
		NS  = st_0; //reset state
		end
		
		else //stay in same state
		begin
		CLR = 0;
		NS  = st_10;
		end
	   
	  end 
          st_1:
	  begin
	        led = 0; // sort is starting
	  	SEL = 6'b000000; //selecting x,y,z,w which are all the inital values
		LD  = 4'b1111; //loads all of the inital values on the next state
		NS  = st_2; //start the sort
          end

	  st_2:
	  begin
		CLR = 0;
	  	led = 0;
		if(LT[0] == 1'b0) //if arr[0] > arr[1]
	      	begin
		//swap(arr[0],arr[1])
		   SEL = 6'b000011; //SEL[2:0] //Three select signals
		   
		//SEL[0] feeds arr[0] to the input of REG[1]
		//SEL[2:1] feeds arr[1] to the input of REG[0]
		//Therefore swapping them
		LD  = 4'b0011; //LD [1:0] 
		//LD[0] loads arr[1] to the ouput of REG[0] on the next state
		///LD[1] loads arr[0] to the ouput of REG[1] on the next state
		NS = st_2;
			
		end
		else NS = st_3;
	  end
          st_3:
          begin
		  CLR = 0;
		  led = 0;
		if(LT[1] == 1'b0) //if arr[1] > arr[2]
                begin
                //swap(arr[1],arr[2])
                SEL = 6'b010100; //SEL[3:1] //four select signals
                //SEL[2:1] feeds arr[1] to the input of REG[2]
                //SEL[3:2] feeds arr[2] to the input of REG[1]
                //Therefore swapping them
                LD  = 4'b0110; //LD [2:1]
                //LD[1] loads arr[2] to the ouput of REG[1] on the next state
                ///LD[2] loads arr[1] to the ouput of REG[2] on the next state
		NS = st_3;
                end
                else NS = st_4;
	  end
          st_4:
          begin
		  CLR =0;
		  led = 0;
		if(LT[2] == 3'b0) //if arr[2] > arr[3]
                begin
                //swap(arr[2],arr[3])
                SEL = 6'b101000; //SEL[5:3] //three select signals
                //SEL[4:3] feeds arr[2] to the input of REG[3]
                //SEL[5] feeds arr[3] to the input of REG[2]
                //Therefore swapping them
                LD  = 4'b1100; //LD [3:2]
                //LD[2] loads arr[3] to the ouput of REG[2] on the next state
                ///LD[3] loads arr[2] to the ouput of REG[3] on the next state
		NS = st_4;
                end
                else NS = st_5; //going to 2nd transversal
	  end
	  st_5:
       	   begin
		CLR = 0;
        	led=0;
		if(LT[0] == 1'b0) //if arr[0] > arr[1]
	      	begin
		//swap(arr[0],arr[1])
		SEL = 6'b000011; //SEL[2:0] //Three select signals
		//SEL[0] feeds arr[0] to the input of REG[1]
		//SEL[2:1] feeds arr[1] to the input of REG[0]
		//Therefore swapping them
		LD  = 4'b0011; //LD [1:0] 
		//LD[0] loads arr[1] to the ouput of REG[0] on the next state
		///LD[1] loads arr[0] to the ouput of REG[1] on the next state
		NS = st_5;
		end
		else NS = st_6;	
	  end
          st_6:
          begin
		  CLR = 0;
		  led = 0;
		if(LT[1] == 1'b0) //if arr[1] > arr[2]
                begin
                //swap(arr[1],arr[2])
                SEL = 6'b010100; //SEL[3:1] //four select signals
                //SEL[2:1] feeds arr[1] to the input of REG[2]
                //SEL[3:2] feeds arr[2] to the input of REG[1]
                //Therefore swapping them
                LD  = 4'b0110; //LD [2:1]
                //LD[1] loads arr[2] to the ouput of REG[1] on the next state
                ///LD[2] loads arr[1] to the ouput of REG[2] on the next state
                NS = st_6;
		end
                else NS = st_7;
	  end
          st_7:
          begin
		  CLR = 0;
		  led = 0;
		if(LT[2] == 1'b0) //if arr[2] > arr[3]
                begin
                //swap(arr[2],arr[3])
                SEL = 6'b101000; //SEL[5:3] //three select signals
                //SEL[4:3] feeds arr[2] to the input of REG[3]
                //SEL[5] feeds arr[3] to the input of REG[2]
                //Therefore swapping them
                LD  = 4'b1100; //LD [3:2]
                //LD[2] loads arr[3] to the ouput of REG[2] on the next state
                ///LD[3] loads arr[2] to the ouput of REG[3] on the next state
		NS = st_7;
                end
                else NS = st_8; //going to 3rd transversal
	  end
	  st_8:
          begin
		CLR = 0;
          	led=0;
		if(LT[0] == 1'b0) //if arr[0] > arr[1]
	      	begin
		//swap(arr[0],arr[1])
		SEL = 6'b000011; //SEL[2:0] //Three select signals
		//SEL[0] feeds arr[0] to the input of REG[1]
		//SEL[2:1] feeds arr[1] to the input of REG[0]
		//Therefore swapping them
		LD  = 4'b0011; //LD [1:0] 
		//LD[0] loads arr[1] to the ouput of REG[0] on the next state
		///LD[1] loads arr[0] to the ouput of REG[1] on the next state
		NS = st_8;
		end
		else NS = st_9;
	  end
          st_9:
          begin
		  CLR = 0;
		  led = 0;
		if(LT[1] == 1'b0) //if arr[1] > arr[2]
                begin
                //swap(arr[1],arr[2])
                SEL = 6'b010100; //SEL[3:1] //four select signals
                //SEL[2:1] feeds arr[1] to the input of REG[2]
                //SEL[3:2] feeds arr[2] to the input of REG[1]
                //Therefore swapping them
                LD  = 4'b0110; //LD [2:1]
                //LD[1] loads arr[2] to the ouput of REG[1] on the next state
                ///LD[2] loads arr[1] to the ouput of REG[2] on the next state
		NS = st_9;
                end
                else NS = st_10;
	  end
          st_10:
          begin
		  CLR = 0;
		  led = 0;
		if(LT[2] == 1'b0) //if arr[2] > arr[3]
                begin
                //swap(arr[2],arr[3])
                SEL = 6'b101000; //SEL[5:3] //three select signals
                //SEL[4:3] feeds arr[2] to the input of REG[3]
                //SEL[5] feeds arr[3] to the input of REG[2]
                //Therefore swapping them
                LD  = 4'b1100; //LD [3:2]
                //LD[2] loads arr[3] to the ouput of REG[2] on the next state
		NS = st_10;
                ///LD[3] loads arr[2] to the ouput of REG[3] on the next state
	         end
	        else NS = st_0; //if btn not 1 then stay in same state
	   end
	  
	   
	   default: NS = st_0;
	
	endcase

    end
    
endmodule
