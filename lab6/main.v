`include "5b_mag_comp.v"

`include "univ_sseg.v"


//black box diagram of the whole assn




module main(x, y, seg, an, clk);


input [4:0]x;
input [4:0]y;

wire EQ;
wire [4:0] absX;

input clk;

output [7:0] seg;
output [3:0] an;


//left module "input"
mag5b_comp leftModule(
            .x(x),
            .y(y),
            .absX(absX),
            .GT(0), //voiding
            .EQ(EQ),
            .LT(0) //voiding
        );
        
  // ouputs of leftmodule are EQ AND absX      
  
  
  
  assign sign = x[4] & y[4];
<<<<<<< Updated upstream
||||||| merged common ancestors
 
          assign outputx = {9'b000000000, absX};
=======
 
>>>>>>> Stashed changes
        
  //right module "output" 
  univ_sseg U(
<<<<<<< Updated upstream
  .cnt1(absX), 
||||||| merged common ancestors
  .cnt1(ouputx), //converting to 8 bi
=======
  .cnt1(absX), //converting to 8 bi
>>>>>>> Stashed changes
  .cnt2(0), //converting 5 bit input to 7bit input 
  .valid(EQ),
  .dp_en(0),
  .dp_sel(0),
  .mod_sel(0),
  .sign(sign),
  .clk(clk),
  .ssegs(seg),
  .disp_en(an)

    );     


//if EQ isnt 1 then cnt2 default value should be all zeroes
endmodule
