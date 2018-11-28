`include "../Modules/univ_sseg.v"
`include "SR_Multiplier_5b.v"

module main(input CLK, input BTN, input [9:0] SW, output [7:0] seg, output [3:0] an);

wire [9:0] tot;

SR_Muliplier_5b MULT( .CLK(CLK), .BTN(BTN), .SW(SW),  .tot(tot));

univ_sseg display(.cnt1(tot),
    .cnt2(0),
     .valid(1),
     .dp_en(0),
     .dp_sel(0),
     .mod_sel(0),
     .sign(0),
     .clk(CLK),
     .ssegs(seg),
     .disp_en(an)
    ); 
  


endmodule
