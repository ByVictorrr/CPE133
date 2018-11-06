
module AN_DCDR(x,an);

input CLK;
output [3:0] an;

always @(*)

begin

	if(CLK == 1'b1) an = 4'b1101;
	else an = 4'b1110;

end

endmodule
