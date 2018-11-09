`include "../Modules/clk_divider_nbit.v"
`include "./Stone_Age_CNTR.v"
`include "Multiplexed_Display.v"

module main(BTN,CLK, seg, an, led);

input BTN, CLK;
output [14:0] led;
wire [3:0] ST;
output [3:0] an;
output [7:0] seg;




Stone_Age_CNTR LeftModule(
                        .BTN(BTN),
                        .CLK(CLK), //clk_Reg is a slowed down version
                        .ST(ST),
                        .led_mealy(led)


);



//faster clock than reg
Multiplexed_Display Display(
                      .CLK(CLK),
                            .x(ST),
                            .seg(seg),
                            .an(an)

);



endmodule
