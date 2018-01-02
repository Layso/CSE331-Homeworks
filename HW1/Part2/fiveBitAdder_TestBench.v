`define DELAY 20
module fiveBitAdder_TestBench();
	// Declaring variables
	reg [4:0]a, b;
	reg carry_in;
	wire carry_out;
	wire [4:0]sum;
	
	// Calling module to test
	fiveBitAdder fba(sum, carry_out, a, b, carry_in);
	
	
	// Test values
	initial begin
		a = 5'b10101; b = 5'b01010; carry_in = 1'b0;
		#`DELAY;
		a = 5'b10101; b = 5'b01010; carry_in = 1'b1;
		#`DELAY;
		a = 5'b00110; b = 5'b10001; carry_in = 1'b1;
		#`DELAY;
		a = 5'b00110; b = 5'b10001; carry_in = 1'b1;
		#`DELAY;
		a = 5'b00000; b = 5'b00000; carry_in = 1'b1;
		#`DELAY;
		a = 5'b00000; b = 5'b00000; carry_in = 1'b1;
	end
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, a=%5b, b=%5b, carry_in=%1b, sum=%5b, carry_out=%1b", $time, a, b, carry_in, sum, carry_out);
	end
 
endmodule