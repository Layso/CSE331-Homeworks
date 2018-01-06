// Module Description
// Datapath is where all operations happen according to the signals
// that control unit has produced
// 
// Input(s)
//	clock: System clock for state changes
module Core(clock);
	// Input declaration(s)
	input clock;
	// Variable declaration(s)
	reg [31:0]PC;
	wire [31:0]instruction, newPC;
	
	// Instruction fields
	wire [5:0]opcode, funct;
	wire [4:0]rs, rt, rd, shamt;
	wire [15:0]imm;
	wire [25:0]address;
	
	// Control unit signals
	wire signSig, jSignal, jrSignal, jalSignal, regDest, branchEqual, branchNotEqual, memRead, memToReg, memWrite, aluSrc, regWrite, zero;
	wire [1:0]storeSig;
	wire [3:0]aluSelect, loadSig;
	
	// Register data
	wire [31:0]rsContent, rtContent, aluResult, memResult, extendedImm;
	
	
	
	InstructionMemoryBlock fetch(instruction, PC);
	InstructionParser parse(opcode, rs, rt, rd, shamt, funct, imm, address, instruction);
	ControlUnit control(signSig, storeSig, loadSig, jSignal, jrSignal, jalSignal, regDest, branchEqual, branchNotEqual, memRead, memToReg, aluSelect, memWrite, aluSrc, regWrite, opcode, funct);
	RegisterBlock registers(rsContent, rtContent, aluResult, memResult, PC, rs, rt, rd, regWrite, regDest, jalSignal, memToReg);
	ArithmeticLogicUnit alu(aluResult, zero, jrSignal, rsContent, rtContent, extendedImm, aluSrc, aluSelect);
	SignExtender sigExt(extendedImm, imm, signSig);
	DataMemoryBlock memory(storeSig, loadSig, memResult, memRead, rtContent, memWrite, aluResult);
	ProgramCounterHandler pcHandler(newPC, PC, extendedImm, address, aluResult, branchEqual, branchNotEqual, zero, jSignal, jrSignal, jalSignal, clock);
	
	
	always@(newPC) begin
		PC = newPC;
	end
	
	initial begin
		PC = -1;
	end
	
endmodule