module ula(
	input [2:0] Op,
	input [15:0] A,
	input [15:0] B,
	output wire [15:0] S
);
	always@(*) begin
		if(Op == 3'b000) begin
			S = A+B;
		end
		if(Op == 3'b001) begin
			S = A-B;
		end
		if(Op == 3'b010) begin
			S = A&B;
		end
		if(Op == 3'b011) begin
			S = A|B;
		end
		if(Op == 3'b100) begin
			S = A^B;
		end
		if (Op == 3'b101) begin
			S = 16'b0;
		end
		if (Op == 3'b110) begin
			S = 16'b0;
		end
		if (Op == 3'b111) begin
			S = 16'b0;
		end
	end
endmodule