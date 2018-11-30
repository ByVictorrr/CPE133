module test_bench( );
 reg CLK, BTN, led;
 reg [9:0] SW;
 wire [9:0] SUM;

 wire [7:0] count;

 wire led;

 SR_Muliplier_5b test(.CLK(CLK),.BTN(BTN), .SW(SW), .SUM(SUM), .led(led) );

 initial
 begin
 CLK = 0; //- init signal
 forever #10 CLK = ~CLK;
 end;

 initial
 begin
 CLK = 0;
 BTN = 1;
 SW = {{1,0,1,0,0},{1,1,1,1,1}};
 
 //- send out LD pulse
 #10 SW = {{1,0,1,0,0},{1,1,1,1,1}};



 end

endmodule

