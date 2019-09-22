//using PCSource in Datapath.v, selects what value
//PC will get; incremented PC or branched PC
module PCSelector(PCSrc, BranchPC, IncrPC, PCValue);
	input [63:0] BranchPC, IncrPC;
	input PCSrc;
	output reg[63:0] PCValue;
	
	always @(PCSrc, BranchPC, IncrPC) begin
		if(PCSrc) begin PCValue <= BranchPC; end
		else begin PCValue <= IncrPC; end
	end
endmodule