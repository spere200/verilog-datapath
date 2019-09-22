//takes in an input and increments it by 4
//use for incrementing PC
module Incrementer (A, Sum);
	input [63:0] A;
	output reg [63:0] Sum;
	
	always @(A)
	begin
		Sum <= A + 4;
	end
endmodule