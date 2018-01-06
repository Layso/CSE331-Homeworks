// Module Description
// Takes old program counter and signal bits to determine next value of program counter
// 
// Input(s)
//	oldPC:			 Current value of program counter
// imm:  			 Immediate offset to change program counter
// branchEqual:    Signal to indicate instruction is beq
// branchNotEqual: Signal to indicate instruction is bne
// zero: 			 Signal that indicates result of ALU is zero
// clock:          System clock for state changes
// jSignal:        Signal to indicate jump instruction
// jrSignal:       Signal to indicate jump register instruction
// jalSignal:      Signal to indicate jump and link instruction
// jumpAddress:    Address to jump
// jumpRegister:   Register content to jump
//	
// Output(s)
//	newPC: 			 Next value of program counter
module ProgramCounterHandler(newPC, oldPC, imm, jumpAddress, jumpRegister, branchEqual, branchNotEqual, zero, jSignal, jrSignal, jalSignal, clock);
	// Input declaration(s)
	input [31:0]oldPC, imm, jumpRegister;
	input [25:0]jumpAddress;
	input branchEqual, branchNotEqual, zero, jSignal, jrSignal, jalSignal, clock;
	// Output declaration(s)
	output reg [31:0]newPC;
	// Variable declaration(s)
	reg [31:0]extendedAddress;
	
	
	
	always@(posedge clock) begin
		if (branchEqual && zero) begin
			newPC = oldPC+imm;
		end
		
		else if (branchNotEqual && ~zero) begin
			newPC = oldPC+imm;
		end
		
		else if (jSignal || jalSignal) begin
			extendedAddress = {{6{jumpAddress[25]}}, jumpAddress[25:0]};
			newPC = extendedAddress-1;
		end
		
		else if (jrSignal) begin
			newPC = jumpRegister;
		end
		
		else begin
			newPC = oldPC+1;
		end
	end
endmodule