// Testbench for DataMemoryBlock module
module DataMemoryBlock_TestBench();
	// Variable declarations
	wire [31:0]data1;
	reg [3:0]loadSig;
	reg [1:0]storeSig;
	reg[31:0]data2, address;
	reg clock, sigRead, sigWrite;
	// Calling module to test
	DataMemoryBlock memoryTest(storeSig, loadSig, data1, sigRead, data2, sigWrite, address);
	
	
	
	initial begin
		// Initial values of address and clock
		clock = 0;
		address = 1;
		sigWrite = 0;
		sigRead = 1;
		data2 = 11184640;
		storeSig = 2;
		loadSig = 4;
		
		// On each positive edge (when clock is 1) if sigWrite is 1, data2 will
		// be written on address. If sigRead is 1, data1 will be content of address
		clock=~clock; address = address*2; #20;
		clock=~clock; address = address*2; #20;
		clock=~clock; address = address*2; #20;
		clock=~clock; sigRead=~sigRead; sigWrite=~sigWrite; #20;
		clock=~clock; #20;
		clock=~clock; #20;
		clock=~clock; sigRead=~sigRead; sigWrite=~sigWrite; #20;
	end

	initial begin
		// Monitoring changes
		$monitor("clk: %1b\naddress: %32b\ndata1: %32b\n\n", clock, address, data1);
	end
endmodule