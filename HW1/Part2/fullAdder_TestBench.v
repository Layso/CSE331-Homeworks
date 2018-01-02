`define DELAY 20
module fullAdder_TestBench();
	// Declaring variables
	reg a, b, carry_in;
	wire sum, carry_out;
	
	// Calling module to test
	fullAdder fa(sum, carry_out, a, b, carry_in);
	
	
	// Test values
	initial begin
		a = 1'b0; b = 1'b0; carry_in = 1'b0;
		#`DELAY;
		a = 1'b1; b = 1'b0; carry_in = 1'b0;
		#`DELAY;
		a = 1'b0; b = 1'b1; carry_in = 1'b0;
		#`DELAY;
		a = 1'b1; b = 1'b1; carry_in = 1'b0;
		#`DELAY;
		a = 1'b0; b = 1'b0; carry_in = 1'b1;
		#`DELAY;
		a = 1'b1; b = 1'b0; carry_in = 1'b1;
		#`DELAY;
		a = 1'b0; b = 1'b1; carry_in = 1'b1;
		#`DELAY;
		a = 1'b1; b = 1'b1; carry_in = 1'b1;
	end
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, a=%1b, b=%1b, carry_in=%1b, sum=%1b, carry_out=%1b", $time, a, b, carry_in, sum, carry_out);
	end
 
endmodule