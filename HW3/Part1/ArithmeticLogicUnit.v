// Module Description
// ALU of CPU. Will do artihmetic or logic operations with data1 & data2 depending on select
// 
// Input(s)
// data1:    First operand, content of RS
// regData:  First candidate for second operand
// immData:  Second candidate for second operand
// aluSrc:   Signal to choose over second operand candidates
// select:   Operation selecter
// jrSignal: Signal to indicate jump register instruction
// 
// Output(s)
// result:  Result value of operation
// zero:    Will be 1 if result is 0
module ArithmeticLogicUnit(result, zero, jrSignal, data1, regData, immData, aluSrc, select);
	// Input declaration(s)
	input [31:0]data1, regData, immData;
	input [3:0]select;
	input jrSignal, aluSrc;
	// Output declaration(s)
	output reg [31:0]result;
	output reg zero;
	// Variable declaration(s)
	reg [31:0]data2;
	reg [3:0]addOpt, adduOpt, andOpt, jumpOpt, norOpt, orOpt, sltOpt, sltuOpt, sllOpt, srlOpt, subOpt, subuOpt;
	
	
	initial begin
		// Function code list to compare with select. The operation on ALU will
		// be executed depending on function code
		addOpt = 0;
		adduOpt = 1;
		andOpt = 2;
		norOpt = 3;
		orOpt = 4;
		sltOpt = 5;
		sltuOpt = 6;
		sllOpt = 7;
		srlOpt = 8;
		subOpt = 9;
		subuOpt = 10;
		jumpOpt = 11;
	end
	
	
	
	always@(data1 or data2 or select or immData) begin
		data2 = (aluSrc) ? immData : regData;
		
		
		// Signed Addition
		if (select == addOpt) begin	
			result = data1 + data2;
		end
		
		// Unsigned Addition
		else if (select == adduOpt) begin	
			result = data1 + data2;
		end
		
		// And
		else if (select == andOpt) begin	
			result = data1 & data2;
		end
		
		// Jump Register
		else if (select == jumpOpt) begin
			result = data1;
		end
		
		// Nor
		else if (select == norOpt) begin	
			result = ~(data1 | data2);
		end
		
		// Or
		else if (select == orOpt) begin	
			result = data1 | data2;
		end
		
		// Set Less Than
		else if (select == sltOpt) begin
			result = ($signed(data1) < $signed(data2)) ? 1:0;
		end
		
		// Set Less Than Unsigned
		else if (select == sltuOpt) begin
			result = (data1 < data2) ? 1:0;
		end
		
		// Shift Left Logical
		else if (select == sllOpt) begin	
			result = data1 << data2;
		end
		
		// Shift Right Logical
		else if (select == srlOpt) begin	
			result = data1 >> data2;
		end
		
		// Signed Substraction
		else if (select == subOpt) begin	
			result = data1 - data2;
		end
		
		// Unsigned Substraction
		else if (select == subuOpt) begin	
			result = data1 - data2;
		end
		
		zero = ~result[31] & ~result[30] & ~result[29] & ~result[28] & ~result[27] & ~result[26] & ~result[25] & ~result[24] & ~result[23] & ~result[22] & ~result[21] & ~result[20] & ~result[19] & ~result[18] & ~result[17] & ~result[16] & ~result[15] & ~result[14] & ~result[13] & ~result[12] & ~result[11] & ~result[10] & ~result[9] & ~result[8] & ~result[7] & ~result[6] & ~result[5] & ~result[4] & ~result[3] & ~result[2] & ~result[1] & ~result[0];
	end
endmodule