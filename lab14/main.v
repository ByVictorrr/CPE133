`include "../Modules/univ_sseg.v"
`include "SR_Multiplier_5b.v"

module main(input CLK, input BTN, input [9:0] SW, output [7:0] seg, output [3:0] an, output led);

wire [9:0] SUM;


SR_Muliplier_5b MULT( .CLK(CLK), .BTN(BTN), .SW(SW),  .SUM(SUM), .led(led));


univ_sseg display(
     .cnt1(SUM),
     .cnt2(0),
     .valid(1),
     .dp_en(0),
     .dp_sel(0),
     .mod_sel(2'b10),
     .sign(0),
     .clk(CLK),
     .ssegs(seg),
     .disp_en(an)
    ); 
  
  


endmodule

