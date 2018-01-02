module muxFour(out, inp1, inp2, inp3, inp4, select);
	// Input - Output declaration
	input inp1, inp2, inp3, inp4;
	input [1:0]select;
	output out;
	
	// Variables
	wire temp1, temp2;
	
	
	
	// Logical expression for 4:1 mux
	// Using three 2:1 mux to create 4:1 mux
	// m1(temp1) = inp1, inp2 MUX select[0]
	// m2(temp2) = inp3, inp4 MUX select[0]
	// m3(out) = temp1, temp2 MUX select[1]
	muxTwo m1(temp1, inp1, inp2, select[0]);
	muxTwo m2(temp2, inp3, inp4, select[0]);
	muxTwo m3(out, temp1, temp2, select[1]);
endmodule