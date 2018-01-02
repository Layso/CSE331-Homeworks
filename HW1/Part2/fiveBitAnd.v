module fiveBitAnd(out, inp1, inp2);
	// Input - Output declaration
	input [4:0]inp1, inp2;
	output [4:0]out;
	
	
	// Operation for 5-bit and gate
	// Using five 1-bit and gates to create 5-bit and gate
	and g1(out[0], inp1[0], inp2[0]);
	and g2(out[1], inp1[1], inp2[1]);
	and g3(out[2], inp1[2], inp2[2]);
	and g4(out[3], inp1[3], inp2[3]);
	and g5(out[4], inp1[4], inp2[4]);
endmodule