`define DELAY 20
module muxTwo_TestBench();
	// Declaring variables
	reg a, b;
	reg select;
	wire out;
	
	// Calling module to test
	muxTwo m(out, a, b, select);
	
	
	// Test values
	initial begin
		a = 1'b0; b = 1'b0; select = 1'b0;
		#`DELAY;
		a = 1'b0; b = 1'b1; select = 1'b0;
		#`DELAY;
		a = 1'b1; b = 1'b0; select = 1'b0;
		#`DELAY;
		a = 1'b1; b = 1'b1; select = 1'b0;
		#`DELAY;
		a = 1'b0; b = 1'b0; select = 1'b1;
		#`DELAY;
		a = 1'b0; b = 1'b1; select = 1'b1;
		#`DELAY;
		a = 1'b1; b = 1'b0; select = 1'b1;
		#`DELAY;
		a = 1'b1; b = 1'b1; select = 1'b1;
	end
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, a=%1b, b=%1b, select=%1b, result=%1b", $time, a, b, select, out);
	end
 
endmodule