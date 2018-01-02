module shiftModule(outData, shiftData, shiftAmount, funct);
	//
	input [31:0]shiftData;
	input [4:0]shiftAmount;
	input [5:0]funct;
	output reg [31:0]outData;
	
	// Function code definitions
	wire [5:0] sraCode = 6'b000011;
	wire [5:0] srlCode = 6'b000010;
	wire [5:0] sllCode = 6'b000000;
	
	
	
	// Shifting data wanted amount times according to funct-code
	always @(*) begin
		if (funct == sraCode) begin
			outData = $signed(shiftData) >>> shiftAmount;
		end
		
		if (funct == srlCode) begin
			outData = shiftData >> shiftAmount;
		end
		
		if (funct == sllCode) begin
			outData = shiftData << shiftAmount;
		end
	end
endmodule