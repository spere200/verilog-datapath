//simple adder with 2 inputs and an output
module Adder (A, B, Sum);
	input [63:0] A, B;
	output reg [63:0] Sum;
	
	always @(A, B)
	begin
		Sum = A + B;
	end
endmodule