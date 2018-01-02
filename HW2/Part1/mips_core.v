module mips_core(instruction, result);
	// Input - Output declaration
	input [31:0] instruction;
	output reg [31:0] result;
	
	// Variables
	wire [5:0]opcode, funct;
	wire [4:0]rs, rt, rd, shamt;
	wire [31:0]inpData1, inpData2, outData, shiftOut, aluOut, temp1, temp2;
	wire writeSignal, clock;
	
	// Setting clock
	assign clock = 1'b1;
	
	// Parsing instruction
	assign opcode = instruction[31:26];
	assign rs = instruction[25:21];
	assign rt = instruction[20:16];
	assign rd = instruction[15:11];
	assign shamt = instruction[10:6];
	assign funct = instruction[5:0];
	
	
	
	// Taking ALU and shift results
	mips_registers reg1(inpData1, inpData2, outData, rs, rt, rd, 1'b0, clock);
	shiftModule sm1(shiftOut, inpData2, shamt, funct);
	ALU alu1(aluOut, inpData1, inpData2, funct);
	
	// Selecting result according to function code
	always @(*) begin
		if (funct[5]) begin
			result = aluOut;
		end
		
		else begin
			result = shiftOut;
		end
	end
	
	// Writing result to register block
	mips_registers reg2(temp1, temp2, result, rs, rt, rd, 1'b1, clock);
endmodule