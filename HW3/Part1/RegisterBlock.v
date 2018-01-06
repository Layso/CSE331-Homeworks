// Module Description
// There are 32 32-bit registers that simulates the register block of a MIPS processor. Reads 2 datas
// and writes to a register if write signal is one. Operations done on positive edge of clock
// 
// Input(s)
// rs:          Register address of first register to read, source register
// rt:          Register address of second register to read, target register
// rd:          Register address to write data
// aluData:     Result of the ALU
// memData:     Read data from data memory block
// pc: 			 Current program counter
// regWrite:    Signal to write data
// regDest:	    Signal to choose RT or RD as write register
// memToReg:    Signal to choose ALU or memory result as write data
// jalSignal:   Signal to indicate jump and link instruction
// 
// Output(s)
// readData1:   Value of RS
// readData2:   Value of RT
module RegisterBlock(readData1, readData2, aluData, memData, pc, rs, rt, rd, regWrite, regDest, jalSignal, memToReg);
	// Input declaration(s)
	input [31:0]aluData, memData, pc;
	input [4:0]rs, rt, rd;
	input regWrite, regDest, memToReg, jalSignal;
	// Output declaration(s)
	output reg [31:0]readData1, readData2;
	// Variable declaration(s)
	reg [31:0]registers[31:0], writeData, extendedJumpAddress;
	reg [4:0]writeReg, ra;
	
	
	
	initial begin
		// Defining return address register, $31 = $ra
		ra = 31;
		// Reading initial register content from register file "registers.mem"
		$readmemb("registers.mem", registers);
		registers[0] = 0;
	end
	
	
	
	always@(rs | rt) begin
		// If RS or RT changes, read their content
		readData1 = registers[rs];
		readData2 = registers[rt];
	end
	
	always@(aluData or memData) begin
		// Choosing write address and data to write
		writeReg = regDest ? rd : rt;
		writeData = memToReg ? memData : aluData;
		
		// If regWrite is 1, write data to register
		if (regWrite) begin
			if (writeReg != 0) begin
				registers[writeReg] = writeData;
			end
		end
		
		// If instruction is jal, assign next PC to $ra
		if (jalSignal) begin
			registers[ra] = pc+1;
		end
	end
endmodule