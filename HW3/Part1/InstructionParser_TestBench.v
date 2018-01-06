// Testbench for Core module
module InstructionParser_TestBench();
	// Variable declarations
	reg [31:0]instruction;
	wire [5:0]opcode, funct;
	wire [4:0]rs, rt, rd, shamt;
	wire [15:0]imm;
	wire [25:0]address;
	
	// Calling module to test
	InstructionParser parse(opcode, rs, rt, rd, shamt, funct, imm, address, instruction);
	
	
	
	initial begin
		instruction = 32'b00000000000000000000000000000000; #20;
		instruction = 32'b00100010011100110000000000000001; #20;
		instruction = 32'b10010010000010000000000000000010; #20;
		instruction = 32'b10010110001010010000000000000100; #20;
		instruction = 32'b00000010100101010101100000101010; #20;
		instruction = 32'b00101010110011000000000000010000; #20;
		instruction = 32'b10100010111011010000000000100000; #20;
	end
	
	
	initial begin
		// Monitoring changes
		$monitor("opcode: %6b\nrs: %5b\nrt: %5b\nrd: %5b\nshamt: %5b\nfunct: %6b\nimm: %16b\naddress: %26b\ninstruction: %32b\n\n", opcode, rs, rt, rd, shamt, funct, imm, address, instruction);
	end
endmodule