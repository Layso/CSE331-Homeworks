// Testbench for RegisterBlock module
module RegisterBlock_TestBench();
	// Variable declarations
	wire [31:0]data1, data2;
	reg[31:0]aluData, memData, pc;
	reg[4:0]rs, rt, rd;
	reg clock, sig, regDest, memToReg, jalSignal;
	
	// Calling module to test
	RegisterBlock registerTest(data1, data2, aluData, memData, pc, rs, rt, rd, sig, regDest, jalSignal, memToReg);
	
	
	
	initial begin
		// Initial values of registers and clock
		clock = 0;
		rs = 0;
		rt = 1;
		aluData = 11184640;
		memData = 32'b00001111000011110000111100001111;
		sig = 0;
		regDest = 0;
		memToReg = 1;
		jalSignal = 0;
		pc = 15;
		
		// On each positive edge (when clock is 1) registerTest will assign new values
		// of data1 and data2. If signal is 1 it will also write value of data3 to rd register
		clock=~clock; rs=rs+2; rt=rt+2; #20;
		clock=~clock; rs=rs+2; rt=rt+2; #20;
		clock=~clock; rs=rs+2; rt=rt+2; rd=rs; #20;
		clock=~clock; sig=~sig; #20;
		clock=~clock; #20;
		clock=~clock; #20;
		clock=~clock; sig=~sig; #20;
	end

	initial begin
		// Monitoring changes
		$monitor("clk: %1b\nrs: %5b\nrt: %5b\nrd: %5b\ndata1: %32b\ndata2: %32b\naluData: %32b\nmemData: %32b\nwriteSig: %1b\ndestSig: %1b\nmemSig: %1b\n\n", clock, rs, rt, rd, data1, data2, aluData, memData, sig, regDest, memToReg);
	end
endmodule