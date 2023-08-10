module comparador (
	input [15:0] A,
	input [15:0] B,
	output [3:0] S
);
always @(*)
	begin
	if (A[15] == 0 & B[15] == 0)
		begin
		S[3] = (A == B);
		S[2] = (A != B);
		S[1] = (A >= B);
		S[0] = (A < B);
		end
	if (A[15] == 0 & B[15] == 1)
		begin
		S[3] = 1'b0;
		S[2] = 1'b1;
		S[1] = 1'b1;
		S[0] = 1'b0;
		end
	if (A[15] == 1 & B[15] == 0)
		begin
		S[3] = 1'b0;
		S[2] = 1'b1;
		S[1] = 1'b0;
		S[0] = 1'b1;
		end
	if (A[15] == 1 & B[15] == 1)
		begin
		S[3] = (A == B);
		S[2] = (A != B);
		S[1] = (A >= B);
		S[0] = (A < B);
		end
	end
endmodule