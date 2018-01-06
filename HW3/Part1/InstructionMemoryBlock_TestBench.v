// Testbench for InstructionMemoryBlock module
module InstructionMemoryBlock_TestBench();
	// Variable declarations
	wire [31:0]instruction;
	reg [31:0]programCounter;
	
	// Calling module to test
	InstructionMemoryBlock instructionTest(instruction, programCounter);
	
	
	
	initial begin
		// Initial value of programCounter
		programCounter = 0;
		
		// On each step PC will be increased by 1 and instruction will be changed
		programCounter=programCounter+1; #20;
		programCounter=programCounter+1; #20;
		programCounter=programCounter+1; #20;
		programCounter=programCounter+1; #20;
		programCounter=programCounter+1; #20;
	end

	initial begin
		// Monitoring changes
		$monitor("PC: %32b\ninstruction: %32b\n\n", programCounter, instruction);
	end
endmodule