module comparador (
	input [15:0] A,
	input [15:0] B,
	output [3:0] S
);
assign S[3] = (A == B);
assign S[2] = (A != B);
assign S[1] = (A >= B);
assign S[0] = (A < B);
endmodule