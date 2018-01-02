`define DELAY 20
module halfAdder_TestBench();
	// Declaring variables
	reg a, b;
	wire sum, carry_out;
	
	// Calling module to test
	halfAdder ha(sum, carry_out, a, b);
	
	// Test values
	initial begin
		a = 1'b0; b = 1'b0;
		#`DELAY;
		a = 1'b1; b = 1'b0;
		#`DELAY;
		a = 1'b0; b = 1'b1;
		#`DELAY;
		a = 1'b1; b = 1'b1;
	end
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, a=%1b, b=%1b, sum=%1b, carry_out=%1b", $time, a, b, sum, carry_out);
	end
 
endmodule