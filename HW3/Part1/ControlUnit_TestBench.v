// Testbench for ControlUnit module
module ControlUnit_TestBench();
	// Variable declarations
	wire [1:0]storeSig;
	wire [3:0]aluSelect, loadSig;
	wire jSignal, jrSignal, jalSignal, regDest, branchEqual, branchNotEqual, memRead, memToReg, memWrite, aluSrc, regWrite, signSig;
	reg [5:0]opcode, funct;
	
	// Calling module to test
	ControlUnit controlTest(signSig, storeSig, loadSig, jSignal, jrSignal, jalSignal, regDest, branchEqual, branchNotEqual, memRead, memToReg, aluSelect, memWrite, aluSrc, regWrite, opcode, funct);
	
	
	
	initial begin
		opcode = 0;
		funct = 0;
		funct = 6'b100000; #20; // add
		funct = 6'b100001; #20; // addu
		funct = 6'b100100; #20; // and
		funct = 6'b100111; #20; // nor
		funct = 6'b100101; #20; // or
		funct = 6'b101010; #20; // slt
		funct = 6'b101011; #20; // sltu
		funct = 6'b000000; #20; // sll
		funct = 6'b000010; #20; // srl
		funct = 6'b100010; #20; // sub
		funct = 6'b100011; #20; // subu
		funct = 6'b001000; #20; // jr
		opcode = 6'b000100; #20; //beq
		opcode = 6'b000101; #20; //bne
		opcode = 6'b101000; #20; //sb
		opcode = 6'b101001; #20; //sh
		opcode = 6'b101011; #20; //sw
		opcode = 6'b001111; #20; //lui
		opcode = 6'b100011; #20; //lw
		opcode = 6'b100100; #20; //lbu
		opcode = 6'b100101; #20; //lhu
		opcode = 6'b001100; #20; //andi
		opcode = 6'b000010; #20; //j
		opcode = 6'b000011; #20; //jal
	end

	initial begin
		// Monitoring changes
		$monitor("opcode: %6b\nfunct: %6b\nregDest: %1b\nbeq: %1b\nbne: %1b\nmemRead: %1b\nmemToReg: %1b\nmemWrite: %1b\naluSrc: %1b\nregWrite: %1b\naluSelect: %4b\njSignal: %1b\njrSignal: %1b\njalSignal: %1b\nstoreSig: %2b\nloadSig: %4b\nsignSig: %1b\n\n", opcode, funct, regDest, branchEqual, branchNotEqual, memRead, memToReg, memWrite, aluSrc, regWrite, aluSelect, jSignal, jrSignal, jalSignal, storeSig, loadSig, signSig);
	end
endmodule