module halfAdder(sum, carry, inp1, inp2);
	// Input - Output declaration
	input inp1, inp2;
	output sum, carry;
	
	
	
	// Logical expression for half adder
	// (g1)sum   = inp1 AND inp2
	// (g2)carry = inp1 XOR inp2
	xor g1(sum, inp1, inp2);
	and g2(carry, inp1, inp2);
endmodule