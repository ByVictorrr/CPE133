`include "../Modules/mux_2t1_nb.v"
`include "../Modules/reg_nb.v"
`include "../Modules/comp_nb.v"
`include "../Modules/usr_nb.v"
`include "../Modules/rca_nb.v"

module SLAVE_CIRCUIT(input CLK, input CLR, input LD, input [1:0] SEL_A, input [1:0] SEL_B, input [9:0] SW, output EQ, output [9:0] SUM);

wire [4:0] D_OUT_B,ZER;
wire [9:0] D_OUT_A, RCA_OUT, M_OUT;

assign ZER = 10'b0000000000;

//11111
//11111
//x----


usr_nb #(.n(10)) USR_A(.data_in({5'b00000, SW[9],SW[8],SW[7],SW[6],SW[5]}), .dbit(0), .sel(SEL_A), .clk(CLK), .clr(0), .data_out(D_OUT_A));

usr_nb #(.n(5)) USR_B(.data_in({SW[4],SW[3],SW[2],SW[1],SW[0]}), .dbit(0), .sel(SEL_B), .clk(CLK), .clr(0), .data_out(D_OUT_B));

mux_2t1_nb #(.n(10)) MUX(.D0(ZER),.D1(D_OUT_A),.SEL(D_OUT_B[0]),.D_OUT(M_OUT));

 comp_nb #(.n(5)) COMP(
          .a (D_OUT_B), 
          .b (5'b00000), 
          .eq (EQ), 
          .gt (0), 
          .lt (0)
 );  
 
rca_nb #(.n(10)) add(.a(SUM),.b(M_OUT),.cin(0),.sum(RCA_OUT),.co(0));

reg_nb #(.n(10)) MY_REG (
          .data_in  (RCA_OUT), 
          .ld       (LD), 
          .clk      (CLK), 
          .clr      (CLR), 
          .data_out (SUM)
          );  

endmodule

