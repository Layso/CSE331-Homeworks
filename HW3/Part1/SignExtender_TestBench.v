// Testbench for SignExtender module
module SignExtender_TestBench();
	// Variable declarations
	wire [31:0]out;
	reg [15:0]inp;
	reg signSig;
	
	// Calling module to test
	SignExtender extendTest(out, inp, signSig);
	
	
	
	initial begin
		signSig = 0;
		inp = 16'b1111111100000000; #20;
		inp = 16'b0111111111111111; #20;
		signSig = 1;
		inp = 16'b1000001100000011; #20;
		inp = 16'b0111111100000000; #20;
	end
	
	initial begin
		// Monitoring changes
		$monitor("signSig: %1b\ninp: %16b\nout: %32b\n\n", signSig, inp, out);
	end
endmodule