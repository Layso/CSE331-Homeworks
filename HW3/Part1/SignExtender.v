// Module Description
// Extends the 16-bit input to 32-bit according to it's sign
// 
// Input(s)
//	in: 16-bit binary number
//	
// Output(s)
//	out: 32-bit sign extended version of input
module SignExtender(out, in, signSig);
	// Input declaration(s)
	input [15:0]in;
	input signSig;
	// Output declaration(s)
	output reg [31:0]out;
	
	
	
	//	Whenever input in changes, extend it to out
	always@(in) begin
		// If sign extend signal is 1, extend with sign
		if (signSig) begin
			out = {{16{in[15]}}, in[15:0]};
		end
		
		// Else zero extend
		else begin
			out = {16'b0, in[15:0]};
		end
	end
endmodule