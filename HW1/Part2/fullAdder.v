module fullAdder(sum, carryOut, inp1, inp2, carryIn);
	// Input - Output declaration
	input inp1, inp2, carryIn;
	output sum, carryOut;
	
	// Variables
	wire tempSum, tempCarry1, tempCarry2;
	
	
	
	// Operation for full adder
	// Using 2 half adders to create a full adder
	// g1(carryOut) = tempCarry1 OR tempCarry2
	halfAdder ha1(tempSum, tempCarry1, inp1, inp2);
	halfAdder ha2(sum, tempCarry2, carryIn, tempSum);
	or g1(carryOut, tempCarry1, tempCarry2);
endmodule