module rom(
	input [15:0] Adds,
	output wire [31:0] Inst
);
	logic [31:0] ROM[1023:0];
	initial $readmemh("MDC.dat", ROM);
	assign Inst = ROM[Adds];
endmodule