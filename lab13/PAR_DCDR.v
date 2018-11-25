`include "../Modules/mux_2t1_nb.v"

module PAR_DCDR(input PAR, output [7:0] seg);

mux_2t1_nb #(.n(8)) PARITY(.SEL(PAR),.D0(8'b01100001),.D1(8'b11000101),.D_OUT(seg));

endmodule

