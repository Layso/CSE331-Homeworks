module fiveBitAdder(sum, carryOut, inp1, inp2, carryIn);
	// Input - Output declaration
	input [4:0]inp1, inp2;
	input carryIn;
	output [4:0]sum;
	output carryOut;
	
	// Variables
	wire tempCarry1, tempCarry2, tempCarry3, tempCarry4;
	
	
	
	// Operation for 5-bit full adder
	// Using five 1-bit full adders to create 5-bit full adder
	// Each bit's summation with its corresponding bit assigned to output
	// Carry bits transported to next full adder and last one assigned to carryOut
	fullAdder fa1(sum[0], tempCarry1, inp1[0], inp2[0], carryIn);
	fullAdder fa2(sum[1], tempCarry2, inp1[1], inp2[1], tempCarry1);
	fullAdder fa3(sum[2], tempCarry3, inp1[2], inp2[2], tempCarry2);
	fullAdder fa4(sum[3], tempCarry4, inp1[3], inp2[3], tempCarry3);
	fullAdder fa5(sum[4], carryOut, inp1[4], inp2[4], tempCarry4);
endmodule