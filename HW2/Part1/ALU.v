module ALU(outData, inpData1, inpData2, funct);
	// Input - Output declarations
	input [31:0]inpData1, inpData2;
	input [5:0]funct;
	output reg [31:0]outData;
	
	// Function code definitions
	wire [5:0] addCode 	= 6'b100000;
	wire [5:0] adduCode 	= 6'b100001;
	wire [5:0] subCode 	= 6'b100010;
	wire [5:0] andCode 	= 6'b100100;
	wire [5:0] orCode 	= 6'b100101;
	wire [5:0] sltuCode 	= 6'b101011;
	
	
	
	// Selecting operation and operating
	always @(*) begin
		if (funct == addCode) begin
			outData = $signed(inpData1) + $signed(inpData2);
		end
		
		
		if (funct == adduCode) begin
			outData = inpData1 + inpData2;
		end
		
		
		if (funct == subCode) begin
			outData = $signed(inpData1) - $signed(inpData2);
		end
		
		
		if (funct == andCode) begin
			outData = inpData1 & inpData2;
		end
		
		
		if (funct == orCode) begin
			outData = inpData1 | inpData2;
		end
		
		
		if (funct == sltuCode) begin
			outData[0] = (inpData1 < inpData2) ? 1'b1 : 1'b0;
		end
	end

endmodule