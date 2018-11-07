
module Two_Digit_Decoder( input [3:0] x,output reg [3:0] F1, output reg [3:0] F2);


always @ (*)

	begin
	//case statement for ones place
	case (x)
		
	        4'b0000 : F1 = x; 
	        4'b0001 : F1 = x;
	        4'b0001 : F1 = x;
	        4'b0010: F1 = x;
	        4'b0010: F1 = x;
	        4'b0011: F1 = x;
	        4'b0100: F1 = x;
	        4'b0101: F1 = x; //five
	        4'b0110: F1 = x;
	        4'b0111: F1 = x;
	        4'b1000: F1 = x;
	        4'b1001: F1 = x; //nine
	        4'b1010: F1 = 4'b0000; //ten
	        4'b1011: F1 = 4'b0001; 
	        4'b1100: F1 = 4'b0010; //twelve	        
                4'b1101: F1 = 4'b0011;
                4'b1110: F1 = 4'b0100 ; //fourteen  
                4'b1111: F1 = 4'b0101 ; //fithteen 
            default: F1=4'b0000;
            
      endcase
      
      
     
          //case statement for tens place
          case (x)
              
                  4'b0000 : F2 = 4'b0000; 
                  4'b0001 : F2 = 4'b0000 ;
                  4'b0010: F2 = 4'b0000;
                  4'b0010: F2 = 4'b0000;
                  4'b0011: F2 = 4'b0000;
                  4'b0100: F2 = 4'b0000;
                  4'b0101: F2 = 4'b0000; //five
                  4'b0110: F2 = 4'b0000;
                  4'b0111: F2 = 4'b0000;
                  4'b1000: F2 = 4'b0000;
                  4'b1001: F2 = 4'b0000; //nine
                  4'b1010: F2 = 4'b0001; //ten
                  4'b1011: F2 = 4'b0001; 
                  4'b1100: F2 = 4'b0001; //twelve            
                  4'b1101: F2 = 4'b0001;
                  4'b1110: F2 = 4'b0001 ; //fourteen  
                  4'b1111: F2 = 4'b0001 ; //fithteen 
                   
    		 default: F2 = 4'b0000;               
	 endcase    
      
            
	end
	

endmodule
