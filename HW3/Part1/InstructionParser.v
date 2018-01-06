// Module Description
// Parses instruction into needed fields for all R, I and J type instructions
// 
// Input(s)
//	instruction: Current instruction to execute
//
// Output(s)
// opcode:  instruction[31:26], Operation code
// rs:      instruction[25:21], Source register
// rt:      instruction[20:16], Target register
// rd:      instruction[15:11], Destination register
// shamt:   instruction[10:6],  Shift amount
// funct:   instruction[5:0],   Function 
// imm:     instruction[15:0],  Immediate field
// address: instruction[25:0],  Address for J type instructions
module InstructionParser(opcode, rs, rt, rd, shamt, funct, imm, address, instruction);
	// Input declaration(s)
	input [31:0]instruction;
	// Output declaration(s)
	output reg [5:0]opcode, funct;
	output reg [4:0]rs, rt, rd, shamt;
	output reg [15:0]imm;
	output reg [25:0]address;
	
	
	
	always@(instruction) begin
		opcode = instruction[31:26];
		rs = instruction[25:21];
		rt = instruction[20:16];
		rd = instruction[15:11];
		shamt = instruction[10:6];
		funct = instruction[5:0];
		imm = instruction[15:0];
		address = instruction[25:0];
	end
endmodule