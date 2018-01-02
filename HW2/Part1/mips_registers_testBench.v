module mips_registers_testBench();
	wire [31:0]data1, data2;
	reg [4:0]rs, rt, rd;
	reg [31:0]writeData;
	reg clock, writeSignal;
	
	
	
	// Calling module to test
	mips_registers regs(data1, data2, writeData, rs, rt, rd, writeSignal, clock);
	
	
	
	// Test values
	initial begin
		rs = 5'b00011; rt = 5'b10011; #10;
		rs = 5'b11111; rt = 5'b01110; #10;
		writeSignal = 1'b1; clock = 1'b1; writeData = 32'b11111111111111111111111111111111; rd = 5'b11111; rs = 5'b01001; rt = 5'b01110; #10;
		rs = 5'b10001; rt = 5'b11111; #10;
		rs = 5'b00111; rt = 5'b11110; #10;
	end
	
	
	
	// Monitoring changes
	initial begin
		$monitor("Time=%2d, rs=%5b, rt=%5b, register1=%32b, register2=%32b", $time, rs, rt, data1, data2);
	end
endmodule