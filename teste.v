module teste(
	input A[1:0],
	input B[1:0],
	input Cin,
	output wire S[1:0],
	output wire Cout[1:0]
);
	wire C[1:0];
	assign C[1] = B[1];
	assign C[0] = B[0];
	assign {Cout[0], S[0]} = A[0] + ~B[0] + Cin;
	assign {Cout[1], S[1]} = A[1] + ~B[1] + Cout[0];
endmodule