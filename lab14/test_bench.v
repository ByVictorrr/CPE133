module tb_comp_nb( );
 reg [7:0] D;
 reg clk, clr, up, ld;
 wire [7:0] count;
 wire rco;

 cntr_udclr_nb MY_CNTR (
 .clk (clk),
 .clr (clr),
 .up (up),
 .ld (ld),
 .D (D),
 .count (count),
 .rco (rco) );

 //- Generate periodic clock signal
 initial
 begin
 clk = 0; //- init signal
 forever #10 clk = ~clk;
 end;

 initial
 begin
 clk = 0;
 up = 1;
 ld = 0;
 D = 'hFB;
 clr = 0;

 //- send out LD pulse
 #10 ld = 1;
 #30 ld = 0;

 //- change count direction
 #200 up = 0;

 end

endmodule

