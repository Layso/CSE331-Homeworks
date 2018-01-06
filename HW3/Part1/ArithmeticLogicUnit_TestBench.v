// Testbench for ArithmeticLogicUnit module
module ArithmeticLogicUnit_TestBench();
	// Variable declarations
	wire [31:0]result;
	wire zero;
	reg [31:0]data1, regData, immData;
	reg [3:0]select;
	reg aluSrc, jrSignal;
	
	// Calling module to test
	ArithmeticLogicUnit aluTest(result, zero, jrSignal, data1, regData, immData, aluSrc, select);
	
	
	
	initial begin
		// Initial value of datas and select
		//data1 = 32'b11111111111111111111111111111011;	// -5
		//data2 = 32'b00000000000000000000000000001111;	// 14
		aluSrc = 1;
		data1 = 5;
		regData = 15;
		immData = -15;
		select = -1;
		jrSignal = 0;
		
		select=select+1; #20; // addOpt 	- 0000
		select=select+1; #20; // adduOpt	- 0001
		select=select+1; #20; // andOpt	- 0010
		select=select+1; #20; // norOpt	- 0011
		select=select+1; #20; // orOpt	- 0100
		select=select+1; #20; // sltOpt	- 0101
		select=select+1; #20; // sltuOpt	- 0110
		select=select+1; #20; // sllOpt	- 0111
		select=select+1; #20; // srlOpt	- 1000
		select=select+1; #20; // subOpt	- 1001
		select=select+1; #20; // subuOpt	- 1010
	end

	initial begin
		// Monitoring changes
		$monitor("select: %4b\ndata1:   %32b\nregData: %32b\nimmData: %32b\nresult:  %32b\nresult_dec: %d\nresult_dec_signed: %d\naluSrc: %1b\njrSignal: %1b\nzero: %1b\n\n", select, data1, regData, immData, result, result, $signed(result), aluSrc, jrSignal, zero);
	end
endmodule