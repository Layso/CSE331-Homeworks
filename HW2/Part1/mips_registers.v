module mips_registers(read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);
	// Input - Output declaration
	output [31:0]read_data_1, read_data_2;
	input [31:0]write_data;
	input [4:0]read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	// Register array
	reg [31:0]registers[31:0];
	
	
	
	// Initializing registers from file "registers.mem"
	initial begin
		$readmemb("registers.mem", registers);
	end
	
	// If positive edge, process the block
	always @(posedge clk) begin
		// If write signal is 1, write data to write_reg
		if (signal_reg_write) begin
			registers[write_reg] = write_data;
		end
	end
	
	
	
	// Read data from rs(read_reg_1) and rt(read_reg_2)
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];
endmodule