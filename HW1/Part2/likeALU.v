module likeALU(out, inp_A, inp_B, select);
	// Input - output declaration
	input [4:0]inp_A, inp_B;
	input [1:0]select;
	output [4:0]out;

	// Variables
	reg carryIn = 1'b0;
	wire carryOut;
	wire [4:0]andResult, sumResult, orResult, xorResult;
	
	// Operation list for simple ALU
	// Assigning results of summation, and, or & xor to variables
	// g1(andResult) = inp_A AND inp_B  -  select: 00
	// sum1(sumResult) = inp_A + inp_B  -  select: 01
	// g2(orResult) = inp_A OR inp_B    -  select: 10
	// g3(xorResult) = inp_A XOR inp_B  -  select: 11
	// 5-bit 4:1 mux selects wanted result and assigns to out
	fiveBitAnd fband(andResult, inp_A, inp_B);
	fiveBitAdder fbsum(sumResult, carryOut, inp_A, inp_B, carryIn);
	fiveBitOr fbor(orResult, inp_A, inp_B);
	fiveBitXor fbxor(xorResult, inp_A, inp_B);
	fiveBitMuxFour fbmux(out, andResult, sumResult, orResult, xorResult, select);
endmodule