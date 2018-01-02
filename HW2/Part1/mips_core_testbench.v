module mips_testbench ();
	reg [31:0] instruction_set;
	wire [31:0]result;
	
	
	
	// Calling module to test
	mips_core mips(instruction_set, result);
	
	
	
	// Test values
	initial begin
		instruction_set = 32'b00000001000010011111100010100000; #10; // add $31 $8 $9
		instruction_set = 32'b00000001000010011111100010100001; #10; // addu
		instruction_set = 32'b00000001000010011111100010100010; #10; // sub
		instruction_set = 32'b00000001000010011111100010100100; #10; // and
		instruction_set = 32'b00000001000010011111100010100101; #10; // or
		instruction_set = 32'b00000001000010011111100010000011; #10; // sra $31 $9 2
		instruction_set = 32'b00000001000010011111100010000010; #10; // srl
		instruction_set = 32'b00000001000010011111100010000000; #10; // sll
		instruction_set = 32'b00000001000010011111100010101011; #10; // sltu
	end



	// Monitoring changes
	initial begin
		$monitor("Time=%2d, instruction=%32b, result=%32b", $time, instruction_set, result);
	end


endmodule