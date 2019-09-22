//takes in a value A and shifts it
//twice to the left
module Shifter (A, ShiftedA);
	input [63:0] A;
	output reg [63:0] ShiftedA;
	
	always @(A)
	begin
		ShiftedA = A + A;
		ShiftedA = ShiftedA + ShiftedA;
	end
endmodule