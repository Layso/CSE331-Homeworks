`define DELAY 20
module fiveBitMuxFour_TestBench();
	// Declaring variables
	reg [4:0]a, b, c, d;
	reg [1:0]select;
	wire [4:0]result;
	
	// Calling module to test
	fiveBitMuxFour fbm(result, a, b, c, d, select);
	
	
	// Test values
	initial begin
		a = 5'b10001; b = 5'b01010; c = 5'b00010; d = 5'b11010; select = 2'b00;
		#`DELAY;
		a = 5'b00010; b = 5'b11010; c = 5'b00001; d = 5'b00111; select = 2'b00;
		#`DELAY;
		a = 5'b00111; b = 5'b11101; c = 5'b10001; d = 5'b01010; select = 2'b01;
		#`DELAY;
		a = 5'b00110; b = 5'b10001; c = 5'b11000; d = 5'b00000; select = 2'b01;
		#`DELAY;
		a = 5'b11000; b = 5'b00000; c = 5'b00110; d = 5'b10001; select = 2'b10;
		#`DELAY;
		a = 5'b10011; b = 5'b00100; c = 5'b00001; d = 5'b00111; select = 2'b10;
		#`DELAY;
		a = 5'b00001; b = 5'b00111; c = 5'b00000; d = 5'b01011; select = 2'b11;
		#`DELAY;
		a = 5'b00000; b = 5'b01011; c = 5'b11000; d = 5'b00000; select = 2'b11;
	end
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, a=%5b, b=%5b, c=%5b, d=%5b, select=%2b, result=%5b", $time, a, b, c, d, select, result);
	end
 
endmodule