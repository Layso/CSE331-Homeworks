module muxTwo(out, inp1, inp2, select);
	// Input - Output declaration
	input inp1, inp2, select;
	output out;
	
	// Variables
	wire temp1, temp2, selectNOT;
	

	
	// Logical expression for 2:1 mux
	// g2(temp1) = inp1 AND g1(select')
	// g3(temp2) = inp2 AND select
	// g4(out) = temp1 or temp2
	not g1(selectNOT, select);
	and g2(temp1, inp1, selectNOT);
	and g3(temp2, inp2, select);
	or g4(out, temp1, temp2);
endmodule