// Module Description
// There are 64 32-bit registers that simulates the memory block of a MIPS processor. Reads or 
// writes data to given address depending on write signal. Operations done on positive edge of clock
// 
// Input(s)
// writeData: Data to write to memory
// memWrite:  Signal to write data
// memRead:   Signal to read data
// storeSig:  Signal to indicate store instruction type
// loadSig:   Signal to indicate load instruction type
// address:   Address to write data
// 
// Output(s)
// readData:  Value of given address
module DataMemoryBlock(storeSig, loadSig, readData, memRead, writeData, memWrite, address);
	// Input declaration(s)
	input [31:0]writeData;
	input [31:0]address;
	input [3:0]loadSig;
	input [1:0]storeSig;
	input memRead, memWrite;
	// Output declaration(s)
	output reg [31:0]readData;
	// Variable declaration(s)
	reg [31:0]memory[63:0];
	reg [1:0]sbOpt, shOpt, swOpt;
	reg [3:0]lbuOpt, lhuOpt, llOpt, luiOpt, lwOpt;
	
	
	initial begin
		// Reading initial memory content from memory file "data.mem"
		$readmemb("data.mem", memory);
		
		// Signal code list to determine which part to load
		lbuOpt = 0;
		lhuOpt = 1;
		llOpt = 2;
		luiOpt = 3;
		lwOpt = 4;
		
		// Signal code list to determine which part to store
		sbOpt = 0;
		shOpt = 1;
		swOpt = 2;
	end
	
	
	
	always@(address) begin
		// On each memory address change try to read and write data
		if (memWrite) begin
			if (storeSig == sbOpt) begin //sb
				memory[address][7:0] = writeData[7:0];
			end
			
			if (storeSig == shOpt) begin //sh
				memory[address][15:0] = writeData[15:0];
			end
			
			if (storeSig == swOpt) begin //sw
				memory[address] = writeData;
			end
		end
		
		
		if (memRead) begin
			if (loadSig == lbuOpt) begin //lbu
				readData = {24'b0, memory[address][7:0]};
			end
			
			if (loadSig == lhuOpt) begin //lhu
				readData = {16'b0, memory[address][15:0]};
			end
			
			if (loadSig == llOpt) begin //ll
				readData = memory[address];
			end
			
			if (loadSig == luiOpt) begin //lui
				readData = {address[31:15], 16'b0};
			end
			
			if (loadSig == lwOpt) begin //lw
				readData = memory[address];
			end
		end
		
		
		// Just to get rid of verilog latch warnings
		else begin
			readData = 0;
		end
	end
endmodule