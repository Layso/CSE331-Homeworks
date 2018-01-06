// Testbench for Core module
module Core_TestBench();
	// Variable declarations
	reg clk;
	
	// Calling module to test
	Core core(clk);
	
	
	
	initial begin
		clk = 0;
		
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
		clk = ~clk; #20;
	end
	
	/*
	initial begin
		// Monitoring changes
		$monitor("inp: %16b\nout: %32b\n\n", inp, out);
	end
	*/
endmodule