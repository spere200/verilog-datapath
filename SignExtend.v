//takes in an instruction, extends the offset field to 64 bits
module SignExtend(Instruction, ExtNumber);
	input [31:0]Instruction;
	output reg [63:0] ExtNumber;
	
	//testing bit 31 and 26 of the instruction to determine which field is extended
	always @(Instruction) begin
		if((Instruction[31] == 1) && (Instruction[26] == 0)) begin //LDUR, STUR, or ADDI
			if(Instruction[27] == 1) begin //LDUR or STUR
				ExtNumber <= {{55{Instruction[20]}}, Instruction[20:12]};
			end
			
			else begin //ADDI
				ExtNumber <= {{52{Instruction[20]}}, Instruction[21:10]};
			end
		end
		
		else if((Instruction[31] == 1) && (Instruction[26] == 1)) begin //CBZ or CBNZ
			ExtNumber <= {{45{Instruction[23]}}, Instruction[23:5]};
		end
		
		else if((Instruction[31] == 0) && (Instruction[26] == 1)) begin //B
			ExtNumber <= {{38{Instruction[25]}}, Instruction[25:0]};
		end
		
		else begin ExtNumber <= {{64{1'b0}}}; end //not a valid opcode
	end
endmodule