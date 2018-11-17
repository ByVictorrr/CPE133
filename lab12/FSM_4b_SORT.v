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
module  FSM_4b_SORT(input CLK, input CLR, input BTN, input [2:0] LT, output led, output [5:0] SEL, output [3:0] LD); 

  //- next state & present state variables
    reg [2:0] NS, PS;
    //- bit-level state representations

    parameter [3:0] st_0= 4'b0000, st_1 = 4'b0001, st_2 = 4'b0010,  st_3 = 4'b0011,  st_4 = 4'b0100, st_5 = 4'b0101, st_6 = 4'b0110, st_7 = 4'b0111, st_8 = 4'b1000, st_9 = 4'1001, st_10 = 4'b1010;
    
    always @ ( posedge CLK)
          PS <= NS; 
    
    
    //- model the next-state and output decoders
    always @ (*)
    begin
       //initializing outputs
       SEL = 6'b000000;
       LD  = 4'b0000;
       LT  = 3'b000;
       case(PS)
          st_0:
	  begin
	        led = 0; // sort is starting
	  	SEL = 6'b000000; //selecting x,y,z,w which are all the inital values
		LD  = 4'b1111; //loads all of the inital values on the next state
		NS  = st_1; //start the sort
          end
	  st_1:
	  	led = 0;
          begin
		if(LT == 3'b000) //if arr[0] > arr[1]
	      	begin
		//swap(arr[0],arr[1])
		SEL = 6'b000011; //SEL[2:0] //Three select signals
		//SEL[0] feeds arr[0] to the input of REG[1]
		//SEL[2:1] feeds arr[1] to the input of REG[0]
		//Therefore swapping them
		LD  = 4'b0011; //LD [1:0] 
		//LD[0] loads arr[1] to the ouput of REG[0] on the next state
		///LD[1] loads arr[0] to the ouput of REG[1] on the next state
		else NS = st_2;
		end		
	  end
          st_2:
		  led = 0;
          begin
		if(LT == 3'b000) //if arr[1] > arr[2]
                begin
                //swap(arr[1],arr[2])
                SEL = 6'b010100; //SEL[3:1] //four select signals
                //SEL[2:1] feeds arr[1] to the input of REG[2]
                //SEL[3:2] feeds arr[2] to the input of REG[1]
                //Therefore swapping them
                LD  = 4'b0110; //LD [2:1]
                //LD[1] loads arr[2] to the ouput of REG[1] on the next state
                ///LD[2] loads arr[1] to the ouput of REG[2] on the next state
                else NS = st_3;
	  end
          st_3:
		  led = 0;
	  begin
		if(LT == 3'b000) //if arr[2] > arr[3]
                begin
                //swap(arr[2],arr[3])
                SEL = 6'b1010000; //SEL[5:3] //three select signals
                //SEL[4:3] feeds arr[2] to the input of REG[3]
                //SEL[5] feeds arr[3] to the input of REG[2]
                //Therefore swapping them
                LD  = 4'b1100; //LD [3:2]
                //LD[2] loads arr[3] to the ouput of REG[2] on the next state
                ///LD[3] loads arr[2] to the ouput of REG[3] on the next state
                else NS = st_4; //going to 2nd transversal
	  end
	  st_4:
		  led = 0;
          begin
		if(LT == 3'b000) //if arr[0] > arr[1]
	      	begin
		//swap(arr[0],arr[1])
		SEL = 6'b000011; //SEL[2:0] //Three select signals
		//SEL[0] feeds arr[0] to the input of REG[1]
		//SEL[2:1] feeds arr[1] to the input of REG[0]
		//Therefore swapping them
		LD  = 4'b0011; //LD [1:0] 
		//LD[0] loads arr[1] to the ouput of REG[0] on the next state
		///LD[1] loads arr[0] to the ouput of REG[1] on the next state
		else NS = st_5;
		end		
	  end
          st_5:
		  led = 0;
          begin
		if(LT == 3'b000) //if arr[1] > arr[2]
                begin
                //swap(arr[1],arr[2])
                SEL = 6'b010100; //SEL[3:1] //four select signals
                //SEL[2:1] feeds arr[1] to the input of REG[2]
                //SEL[3:2] feeds arr[2] to the input of REG[1]
                //Therefore swapping them
                LD  = 4'b0110; //LD [2:1]
                //LD[1] loads arr[2] to the ouput of REG[1] on the next state
                ///LD[2] loads arr[1] to the ouput of REG[2] on the next state
                else NS = st_6;
	  end
          st_6:
		  led = 0;
          end
		if(LT == 3'b000) //if arr[2] > arr[3]
                begin
                //swap(arr[2],arr[3])
                SEL = 6'b1010000; //SEL[5:3] //three select signals
                //SEL[4:3] feeds arr[2] to the input of REG[3]
                //SEL[5] feeds arr[3] to the input of REG[2]
                //Therefore swapping them
                LD  = 4'b1100; //LD [3:2]
                //LD[2] loads arr[3] to the ouput of REG[2] on the next state
                ///LD[3] loads arr[2] to the ouput of REG[3] on the next state
                else NS = st_7; //going to 3rd transversal
	  end
	  st_7:
		  led = 0;
          begin
		if(LT == 3'b000) //if arr[0] > arr[1]
	      	begin
		//swap(arr[0],arr[1])
		SEL = 6'b000011; //SEL[2:0] //Three select signals
		//SEL[0] feeds arr[0] to the input of REG[1]
		//SEL[2:1] feeds arr[1] to the input of REG[0]
		//Therefore swapping them
		LD  = 4'b0011; //LD [1:0] 
		//LD[0] loads arr[1] to the ouput of REG[0] on the next state
		///LD[1] loads arr[0] to the ouput of REG[1] on the next state
		else NS = st_8;
	  end
          st_8:
		  led = 0;
          begin
		if(LT == 3'b000) //if arr[1] > arr[2]
                begin
                //swap(arr[1],arr[2])
                SEL = 6'b010100; //SEL[3:1] //four select signals
                //SEL[2:1] feeds arr[1] to the input of REG[2]
                //SEL[3:2] feeds arr[2] to the input of REG[1]
                //Therefore swapping them
                LD  = 4'b0110; //LD [2:1]
                //LD[1] loads arr[2] to the ouput of REG[1] on the next state
                ///LD[2] loads arr[1] to the ouput of REG[2] on the next state
                else NS = st_9;
	  end
          st_9:
		  led = 0;
          begin
		if(LT == 3'b000) //if arr[2] > arr[3]
                begin
                //swap(arr[2],arr[3])
                SEL = 6'b1010000; //SEL[5:3] //three select signals
                //SEL[4:3] feeds arr[2] to the input of REG[3]
                //SEL[5] feeds arr[3] to the input of REG[2]
                //Therefore swapping them
                LD  = 4'b1100; //LD [3:2]
                //LD[2] loads arr[3] to the ouput of REG[2] on the next state
                ///LD[3] loads arr[2] to the ouput of REG[3] on the next state
	        else NS = st_9; //if btn not 1 then stay in same state
	   end
	   st_10: //waiting state
		   led = 1; //sort has completed
	   begin
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
	   default: NS = st_10;
	endcase
endmodule
