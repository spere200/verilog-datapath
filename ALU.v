//Takes ALUctl from ALUControl, Reg A, and Reg B
//Generates output depending on ALUOp, and Zero for CBZ
module ALU (ALUctl, A, B, ALUOut, Zero);
	input [3:0] ALUctl;					 
	input [63:0] A, B;
	output reg [63:0] ALUOut;
	output Zero;
	
	//Zero is true if ALUOut is 0
	assign Zero = (ALUOut == 0);
	
	always @(ALUctl, A, B)
	begin
		case(ALUctl)
			0:	ALUOut <= (A & B);
			1:	ALUOut <= (A | B);
			2:	ALUOut <= (A + B);
			6:	ALUOut <= (A - B);
			7:	ALUOut <= (B == 0) ? 0 : 1;      
			default: ALUOut <= 0;
		endcase
	end
endmodule