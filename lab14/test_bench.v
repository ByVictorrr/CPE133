module test_bench( );
 reg CLK, BTN;
 reg [9:0] SW;
 wire [9:0] SUM;

 wire led;

 SR_Muliplier_5b test(.CLK(CLK),.BTN(BTN), .SW(SW), .SUM(SUM), .led(led) );

 initial
 begin
 CLK = 0; //- init signal
 forever #10 CLK = ~CLK;
 end

 initial
 begin
 CLK = 0;
 BTN = 1;
 SW = 10'b1010011111;
 


 end

endmodule
