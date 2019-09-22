module ALUControl (ALUOp, OpCode, ALUctl); //takes ALUOp and OpCode as input and outputs ALUctl for ALU
	input [1:0] ALUOp;
	input [10:0] OpCode;
	output reg [3:0] ALUctl;
	
	//not complete, missing NOR and SLT, but I don't think we need it for the operations we're implementing
	always @(ALUOp, OpCode) 
	begin
		if(ALUOp == 0)
		begin
			ALUctl <= 2;
		end
		
		else if (ALUOp == 1)
		begin
			ALUctl <= 7;
		end
		
		else
		begin
			if(OpCode[6] == 1) begin
				case (OpCode)
					1112:	ALUctl <= 2;	//ADD
					1624:	ALUctl <= 6;	//SUB
					1104:	ALUctl <= 0; 	//AND
					1360:	ALUctl <= 1;	//ORR
					default: ALUctl <=15;   //should never happen
				endcase
			end
			
			else begin //if OpCode[6] == 0 then it's ADDI
				ALUctl <= 2;
			end
		end
	end
endmodule