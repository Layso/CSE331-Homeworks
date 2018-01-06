 // Module Description
// Control unit produces signals for datapath from the opcode and function field
// of the instruction
// 
// Input(s)
// opcode: 		First 6 bits of instruction -> [31:26]instruction
// funct:  		Last 6 bits of instruction -> [5:0]instruction
//	
// Output(s)
// storeSig:   Signal to indicate store instruction type
// loadSig:    Signal to indicate load instruction type
// jSignal:    Signal to indicate jump instruction
// jrSignal:   Signal to indicate jump register instruction
// jalSignal:  Signal to indicate jump and link instruction
// regDest: 	Signal to choose destination register (RT or RD)
// branch:		Signal to indicate branch instruction
// memRead:		Signal to read data from memory block
// memToReg:	Signal to choose source data (ALU result or memory data)
// aluSelect:	Signal to choose ALU operation
// memWrite:	Signal to enable memory write
// aluSrc:		Signal to choose second operand of ALU (RT or imm16)
// regWrite:	Signal to enable register write
// signSig:		Signal to indicate extend immedite
module ControlUnit(signSig, storeSig, loadSig, jSignal, jrSignal, jalSignal, regDest, branchEqual, branchNotEqual, memRead, memToReg, aluSelect, memWrite, aluSrc, regWrite, opcode, funct);
	// Input declaration(s)
	input [5:0]opcode, funct;
	// Output declaration(s)
	output reg jSignal, jrSignal, jalSignal, regDest, branchEqual, branchNotEqual, memRead, memToReg, memWrite, aluSrc, regWrite, signSig;
	output reg [1:0]storeSig;
	output reg [3:0]aluSelect, loadSig;
	// Variable declaration(s)
	reg [3:0]addOpt, adduOpt, andOpt, jumpOpt, norOpt, orOpt, sltOpt, sltuOpt, sllOpt, srlOpt, subOpt, subuOpt, lbuOpt, lhuOpt, llOpt, luiOpt, lwOpt;
	reg [1:0]sbOpt, shOpt, swOpt;
	reg rType;
	
	
	
	initial begin
		// Function code list of ALU to determine aluSelect
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
	
	
	
	always@(opcode or funct) begin
		signSig = 0; jSignal = 0; jrSignal = 0; jalSignal = 0; regDest = 0; branchEqual = 0; branchNotEqual = 0; memRead = 0; memToReg = 0; memWrite = 0; aluSrc = 0; regWrite = 0; aluSelect = 0; storeSig = -1; loadSig = -1;
		rType = ~opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5];
		
		if (rType) begin
			regDest = 1;
			regWrite = 1;
			
			if (funct == 6'b100000) begin	//add
				aluSelect = addOpt;
			end
			
			else if (funct == 6'b100001) begin	//addu
				aluSelect = adduOpt;
			end
			
			else if (funct == 6'b100100) begin	//and
				aluSelect = andOpt;
			end
			
			else if (funct == 6'b100111) begin //nor
				aluSelect = norOpt;
			end
			
			else if (funct == 6'b100101) begin //or
				aluSelect = orOpt;
			end
			
			else if (funct == 6'b101010) begin //slt
				aluSelect = sltOpt;
			end
			
			else if (funct == 6'b101011) begin //sltu
				aluSelect = sltuOpt;
			end
			
			else if (funct == 6'b000000) begin //sll
				aluSelect = sllOpt;
			end
			
			else if (funct == 6'b000010) begin //srl
				aluSelect = srlOpt;
			end
			
			else if (funct == 6'b100010) begin //sub
				aluSelect = subOpt;
			end
			
			else if (funct == 6'b100011) begin //subu
				aluSelect = subuOpt;
			end
			
			else if (funct == 6'b001000) begin //jr
				aluSelect = jumpOpt;
				regWrite = 0;
				jrSignal = 1;
			end
		end
		
		
		else if (opcode == 6'b100100 | opcode == 6'b100101 | opcode == 6'b110000 | opcode == 6'b001111 | opcode == 6'b100011) begin //loads
			if (opcode == 6'b100100) begin //lbu
				loadSig = lbuOpt;
			end
			
			if (opcode == 6'b100101) begin //lhu
				loadSig = lhuOpt;
			end
			
			if (opcode == 6'b110000) begin //ll
				loadSig = llOpt;
			end
			
			if (opcode == 6'b001111) begin //lui
				loadSig = luiOpt;
			end
			
			if (opcode == 6'b100011) begin //lw
				loadSig = lwOpt;
			end
			
			
			aluSrc = 1;
			memToReg = 1;
			regWrite = 1;
			memRead = 1;
			signSig = 1;
			aluSelect = addOpt;
		end
		
		else if (opcode == 6'b101000 | opcode == 6'b101001 | opcode == 6'b101011) begin //stores
			if (opcode == 6'b101000) begin //sb
				storeSig = sbOpt;
			end
			
			if (opcode == 6'b101001) begin //sh
				storeSig = shOpt;
			end
			
			if (opcode == 6'b101011) begin //sw
				storeSig = swOpt;
			end
			
			aluSrc = 1;
			memWrite = 1;
			signSig = 1;
			aluSelect = addOpt;
		end
		
		else if (opcode == 6'b001000) begin //addi
			aluSrc = 1;
			aluSelect = addOpt;
			regWrite = 1;
			signSig = 1;
		end
		
		else if (opcode == 6'b001001) begin //addiu
			aluSrc = 1;
			aluSelect = adduOpt;
			regWrite = 1;
			signSig = 1;
		end
		
		else if (opcode == 6'b001100) begin //andi
			aluSrc = 1;
			aluSelect = andOpt;
			regWrite = 1;
		end
		
		else if (opcode == 6'b001101) begin //ori
			aluSrc = 1;
			aluSelect = orOpt;
			regWrite = 1;
		end
		
		else if (opcode == 6'b001010) begin //slti
			aluSrc = 1;
			aluSelect = sltOpt;
			regWrite = 1;
			signSig = 1;
		end
		
		else if (opcode == 6'b001011) begin //sltiu
			aluSrc = 1;
			aluSelect = sltuOpt;
			regWrite = 1;
			signSig = 1;
		end
		
		else if (opcode == 6'b000100) begin //beq
			branchEqual = 1;
			aluSelect = subOpt;
			signSig = 1;
		end
		
		else if (opcode == 6'b000101) begin //bne
			branchNotEqual = 1;
			aluSelect = subOpt;
			signSig = 1;
		end
		
		else if (opcode == 6'b000011) begin //jal
			jalSignal = 1;
		end
		
		else if (opcode == 6'b000010) begin //j
			jSignal = 1;
		end
	end
endmodule