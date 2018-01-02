module shiftModule_testBench();
	wire [31:0]data1, data2;
	reg [4:0]shiftAmount;
	reg [31:0]shiftData;
	reg [5:0]funct;
	
	
	// Calling module to test
	shiftModule shift(data1, shiftData, shiftAmount, funct);
	
	
	
	// Test values
	initial begin
		shiftData = 32'b10001111000011110000111100001111; shiftAmount = 5'b00001; funct = 6'b000011; #10;
		shiftData = 32'b10001111000011110000111100001111; shiftAmount = 5'b00011; funct = 6'b000011; #10;
		shiftData = 32'b10001111000011110000111100001111; shiftAmount = 5'b00001; funct = 6'b000010; #10;
		shiftData = 32'b10001111000011110000111100001111; shiftAmount = 5'b00011; funct = 6'b000010; #10;
		shiftData = 32'b10001111000011110000111100001111; shiftAmount = 5'b00001; funct = 6'b000000; #10;
		shiftData = 32'b10001111000011110000111100001111; shiftAmount = 5'b00011; funct = 6'b000000; #10;
	end
	
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, rs=%5b, rt=%5b, register1=%32b, register2=%32b", $time, shiftAmount, funct, shiftData, data1);
	end
endmodule