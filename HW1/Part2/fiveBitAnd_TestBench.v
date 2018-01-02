`define DELAY 20
module fiveBitAnd_TestBench();
	// Declaring variables
	reg [4:0]a, b;
	wire [4:0]result;
	
	// Calling module to test
	fiveBitAnd fba(result, a, b);
	
	
	// Test values
	initial begin
		a = 5'b10101; b = 5'b11111;
		#`DELAY;
		a = 5'b10101; b = 5'b01010;
		#`DELAY;
		a = 5'b00110; b = 5'b10111;
		#`DELAY;
		a = 5'b10110; b = 5'b10101;
	end
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, a=%5b, b=%5b, result=%5b", $time, a, b, result);
	end
 
endmodule