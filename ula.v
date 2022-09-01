module ula(
	input [2:0] Op,
	input [15:0] A,
	input [15:0] B,
	output wire [15:0] S
);
	wire Bn[15:0];
	wire CoutA[15:0];
	wire CoutS[15:0];
	assign Bn[0] = ~B[0];
	assign Bn[1] = ~B[1];
	assign Bn[2] = ~B[2];
	assign Bn[3] = ~B[3];
	assign Bn[4] = ~B[4];
	assign Bn[5] = ~B[5];
	assign Bn[6] = ~B[6];
	assign Bn[7] = ~B[7];
	assign Bn[8] = ~B[8];
	assign Bn[9] = ~B[9];
	assign Bn[10] = ~B[10];
	assign Bn[11] = ~B[11];
	assign Bn[12] = ~B[12];
	assign Bn[13] = ~B[13];
	assign Bn[14] = ~B[14];
	assign Bn[15] = ~B[15];
	always@(*) begin
		if(Op == 3'b000) begin
			{CoutA[0], S[0]} = A[0] + B[0] + 1'b0;
			{CoutA[1], S[1]} = A[1] + B[1] + CoutA[0];
			{CoutA[2], S[2]} = A[2] + B[2] + CoutA[1];
			{CoutA[3], S[3]} = A[3] + B[3] + CoutA[2];
			{CoutA[4], S[4]} = A[4] + B[4] + CoutA[3];
			{CoutA[5], S[5]} = A[5] + B[5] + CoutA[4];
			{CoutA[6], S[6]} = A[6] + B[6] + CoutA[5];
			{CoutA[7], S[7]} = A[7] + B[7] + CoutA[6];
			{CoutA[8], S[8]} = A[8] + B[8] + CoutA[7];
			{CoutA[9], S[9]} = A[9] + B[9] + CoutA[8];
			{CoutA[10], S[10]} = A[10] + B[10] + CoutA[9];
			{CoutA[11], S[11]} = A[11] + B[11] + CoutA[10];
			{CoutA[12], S[12]} = A[12] + B[12] + CoutA[11];
			{CoutA[13], S[13]} = A[13] + B[13] + CoutA[12];
			{CoutA[14], S[14]} = A[14] + B[14] + CoutA[13];
			{CoutA[15], S[15]} = A[15] + B[15] + CoutA[14];
		end
		if(Op == 3'b001) begin
			{CoutS[0], S[0]} = A[0] + Bn[0] + 1'b1;
			{CoutS[1], S[1]} = A[1] + Bn[1] + CoutS[0];
			{CoutS[2], S[2]} = A[2] + Bn[2] + CoutS[1];
			{CoutS[3], S[3]} = A[3] + Bn[3] + CoutS[2];
			{CoutS[4], S[4]} = A[4] + Bn[4] + CoutS[3];
			{CoutS[5], S[5]} = A[5] + Bn[5] + CoutS[4];
			{CoutS[6], S[6]} = A[6] + Bn[6] + CoutS[5];
			{CoutS[7], S[7]} = A[7] + Bn[7] + CoutS[6];
			{CoutS[8], S[8]} = A[8] + Bn[8] + CoutS[7];
			{CoutS[9], S[9]} = A[9] + Bn[9] + CoutS[8];
			{CoutS[10], S[10]} = A[10] + Bn[10] + CoutS[9];
			{CoutS[11], S[11]} = A[11] + Bn[11] + CoutS[10];
			{CoutS[12], S[12]} = A[12] + Bn[12] + CoutS[11];
			{CoutS[13], S[13]} = A[13] + Bn[13] + CoutS[12];
			{CoutS[14], S[14]} = A[14] + Bn[14] + CoutS[13];
			{CoutS[15], S[15]} = A[15] + Bn[15] + CoutS[14];
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
	end
endmodule