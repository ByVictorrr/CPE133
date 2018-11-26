`include "../Modules/mux_2t1_nb.v"

//////////////////////////////////////////////////////////////////////////////////
//// Company: VANE
//// Engineer: Victor Delaplaine, Esteban Rubio
//// 
//// Create Date: 11/13/2018 12:31:47 PM
//// Design Name: 
//// Module Name: PAR_DCDR
//// Project Name: Exp 13
//// Target Devices: Basy3
//// Tool Versions: 
///  Description: Inputs the left most bit of the CNT and determines the
//		  parity from it. If LSB is 0 - seg will make an E
//
///  Dependencies: mux_2t1_nb.v
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////



module PAR_DCDR(input PAR, output [7:0] seg);

mux_2t1_nb #(.n(8)) PARITY(.SEL(PAR),.D0(8'b01100001),.D1(8'b11000101),.D_OUT(seg));

endmodule

