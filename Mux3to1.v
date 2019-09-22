module Mux3to1 (Sel, A, B, C, D, S);
	input [63:0] A, B, C, D;
	input [1:0] Sel;
	output reg [63:0] S;
	
	always @(Sel, A, B, C)
	begin
		if(Sel == 0) begin
			S <= A;
		end
		
		else if(Sel == 1) begin
			S <= B;
		end
		
		else if(Sel == 2) begin
			S <= C;
		end
		
		else begin
			S <= D;
		end
	end
endmodule