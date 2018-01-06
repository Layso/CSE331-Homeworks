// Testbench for ProgramCounterHandler module
module ProgramCounterHandler_TestBench();
	// Variable declarations
	wire [31:0]newPC; 
	reg [31:0]oldPC, jumpRegister;
	reg [25:0]jumpAddress;
	reg [31:0]imm;
	reg branchEqual, branchNotEqual, zero, jSignal, jrSignal, jalSignal, clock;
	
	// Calling module to test
	ProgramCounterHandler pcTest(newPC, oldPC, imm, jumpAddress, jumpRegister, branchEqual, branchNotEqual, zero, jSignal, jrSignal, jalSignal, clock);
	
	
	
	initial begin
		oldPC = 0;
		imm = 2;
		branchEqual = 0;
		branchNotEqual = 1;
		zero = 0;
		clock = 1;
		jSignal = 0;
		jrSignal = 0;
		jalSignal = 0;
		jumpAddress = 5;
		jumpRegister = 12;
		
		#20
		clock = ~clock; oldPC = newPC; #20;
		clock = ~clock; oldPC = newPC; #20;
		clock = ~clock; oldPC = newPC; #20;
		clock = ~clock; oldPC = newPC; #20;
	end
	
	initial begin
		// Monitoring changes
		$monitor("oldPC: %4b\nnewPC: %4b\nimm: %32b\nbeq: %1b\nbne: %1b\nzero: %1b\njSignal: %1b\njrSignal: %1b\njalSignal: %1b\nclock1: %1b\n\n", oldPC, newPC, imm, branchEqual, branchNotEqual, zero, jSignal, jrSignal, jalSignal, clock);
	end
endmodule