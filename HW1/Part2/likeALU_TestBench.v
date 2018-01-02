`define DELAY 20
module likeALU_TestBench();
	// Declaring variables
	reg [4:0]a, b;
	reg [1:0]select;
	wire [4:0]result;
	
	// Calling module to test
	likeALU alu(result, a, b, select);
	
	
	// Test values
	initial begin
		a = 5'b10001; b = 5'b01010; select = 2'b00;
		#`DELAY;
		a = 5'b00010; b = 5'b11010; select = 2'b00;
		#`DELAY;
		a = 5'b00111; b = 5'b01101; select = 2'b01;
		#`DELAY;
		a = 5'b00110; b = 5'b10001; select = 2'b01;
		#`DELAY;
		a = 5'b11000; b = 5'b00000; select = 2'b10;
		#`DELAY;
		a = 5'b10011; b = 5'b00100; select = 2'b10;
		#`DELAY;
		a = 5'b00001; b = 5'b00111; select = 2'b11;
		#`DELAY;
		a = 5'b00000; b = 5'b01011; select = 2'b11;
	end
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, a=%5b, b=%5b, select=%2b, result=%5b", $time, a, b, select, result);
	end
 
endmodule