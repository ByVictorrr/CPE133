//black box diagram of the whole assn
module main(x, y, ssegs, disp_en);


input x,y;
wire EQ, absX;

wire [6:0] cnt2;



output [8:0] ssegs;
output [3:0] disp_en;




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
  
  
          
        
  //right module "output" 
  univ_sseg U(
   .cnt1(14'b00000000000000), //hardwiring to zero
    .cnt2({2'b00, absX}), //converting 5 bit input to 7bit input 
   .valid(~EQ),
  .dp_en(0),
  .dp_sel(0),
  .mod_sel(0),
   .sign(),
  .clk(),
  .ssegs(),
   .disp_en()

    );     


//if EQ isnt 1 then cnt2 default value should be all zeroes
endmodule
