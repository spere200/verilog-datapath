module Control(OpCode, Reg2Loc, Uncondbranch, nzBranch, zBranch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
	input [10:0] OpCode;
	
	//control signals
	output reg [1:0] ALUOp;
	output reg Reg2Loc, Uncondbranch, nzBranch, zBranch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	
	//setting control signals
	always @(OpCode)
	begin
		if((OpCode[10] == 1) && (OpCode[5] == 0)) begin //R-type, D-type, or I-Type if instruction[31] = 1 and instruction[26] = 0
			if (OpCode[6] == 1) begin //if OpCode[6] == 1 then D-Type or R-Type
				case (OpCode)
					1112: begin Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 2; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 1; end	//ADD
					1624: begin Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 2; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 1; end	//SUB
					1104: begin Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 2; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 1; end	//AND
					1360: begin Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 2; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 1; end	//ORR
					1986: begin Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 1; MemtoReg <= 1; ALUOp <= 0; MemWrite <= 0; ALUSrc <= 1; RegWrite <= 1; end	//LDUR
					1984: begin Reg2Loc <= 1; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 0; MemWrite <= 1; ALUSrc <= 1; RegWrite <= 0; end	//STUR
					default : begin Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 0; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 0; end //nothing
				endcase
			end
			
			else begin //if OpCode [6] == 0 then I-Type
				Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 2; MemWrite <= 0; ALUSrc <= 1; RegWrite <= 1; //ADDI
			end
		end
		
		else if((OpCode[10] == 1) && (OpCode[5] == 1)) begin  //CBZ, CBNZ, and NO-OP
			if(OpCode[3] == 0 && OpCode[9] == 0) begin //CBZ
				Reg2Loc <= 1; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 1; MemRead <= 0; MemtoReg <= 0; ALUOp <= 1; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 0;
			end
			
			else if(OpCode[3] == 1 && OpCode[9] == 0)begin // CBNZ
				Reg2Loc <= 1; Uncondbranch <= 0; nzBranch <= 1; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 1; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 0;
			end
			
			else begin //no-op
				Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 0; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 0;
			end
		end
		
		else if((OpCode[10] == 0) && (OpCode[5] == 1)) begin //Unconditional Branch if Instruction[31] = 0 and Instruction[26] = 1
			Reg2Loc <= 0; Uncondbranch <= 1; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 2; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 0;
		end
		else begin
			Reg2Loc <= 0; Uncondbranch <= 0; nzBranch <= 0; zBranch <= 0; MemRead <= 0; MemtoReg <= 0; ALUOp <= 2; MemWrite <= 0; ALUSrc <= 0; RegWrite <= 0;
		end
	end
endmodule