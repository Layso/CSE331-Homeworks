module fiveBitMuxFour(out, inp1, inp2, inp3, inp4, select);
	// Input - Output declaration
	input [4:0]inp1, inp2, inp3, inp4;
	input [1:0]select;
	output [4:0]out;
	
	
	// Operation for 5-bit 4:1 mux
	// Selecting each bit by using 1-bit 4:1 MUX
	muxFour m1(out[0], inp1[0], inp2[0], inp3[0], inp4[0], select);
	muxFour m2(out[1], inp1[1], inp2[1], inp3[1], inp4[1], select);
	muxFour m3(out[2], inp1[2], inp2[2], inp3[2], inp4[2], select);
	muxFour m4(out[3], inp1[3], inp2[3], inp3[3], inp4[3], select);
	muxFour m5(out[4], inp1[4], inp2[4], inp3[4], inp4[4], select);
endmodule