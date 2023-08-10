module pc(
	input [15:0] E,
	input Reset,
	input clk,
	output wire [15:0] Saida
);
reg [15:0] S;
assign Saida = S;
always @(posedge clk) 
	begin
		if (Reset == 1'b1) 
			begin
				S[0] <= 1'b0;
				S[1] <= 1'b0;
				S[2] <= 1'b0;
				S[3] <= 1'b0;
				S[4] <= 1'b0;
				S[5] <= 1'b0;
				S[6] <= 1'b0;
				S[7] <= 1'b0;
				S[8] <= 1'b0;
				S[9] <= 1'b0;
				S[10] <= 1'b0;
				S[11] <= 1'b0;
				S[12] <= 1'b0;
				S[13] <= 1'b0;
				S[14] <= 1'b0;
				S[15] <= 1'b0;
			end
		else 
			begin
				S <= E;
			end
	end
endmodule