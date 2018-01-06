// Module Description
// There are 16 32-bit registers that simulates the instruction memory block of a MIPS processor. Reads
// content of memory where programCounter indicates. Operations done when programCounter changes
// 
// Input(s)
// programCounter: Cursor to the current instruction
// 
// Output(s)
// instruction: Instruction value
module InstructionMemoryBlock(instruction, programCounter);
	// Input declaration(s)
	input [31:0]programCounter;
	// Output declaration(s)
	output reg [31:0]instruction;
	// Variable declaration(s)
	reg [31:0]instructionMemory[255:0];
	
	
	
	// Reading initial memory content from instruction file "instruction.mem"
	initial begin
		$readmemb("instruction.mem", instructionMemory);
	end
	
	
	
	// Instruction will be assigned when programCounter changes
	always@(programCounter) begin
		instruction = instructionMemory[programCounter];
	end
endmodule