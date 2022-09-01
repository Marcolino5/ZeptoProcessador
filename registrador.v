module registrador(
	input [3:0] Ra,
	input [3:0] Rb,
	input [3:0] Rd,
	input [15:0] D,
	input WE,
	input Reset,
	input clk,
	output wire [15:0] A,
	output wire [15:0] B
);

// cria cada registrador
reg [15:0] S;
reg [15:0] R0;
reg [15:0] R1;
reg [15:0] R2;
reg [15:0] R3;
reg [15:0] R4;
reg [15:0] R5;
reg [15:0] R6;
reg [15:0] R7;
reg [15:0] R8;
reg [15:0] R9;
reg [15:0] R10;
reg [15:0] R11;
reg [15:0] R12;
reg [15:0] R13;
reg [15:0] R14;
reg [15:0] R15;

// mantem R0 com 0
assign R0[0] = 1'b0;
assign R0[1] = 1'b0;
assign R0[2] = 1'b0;
assign R0[3] = 1'b0;
assign R0[4] = 1'b0;
assign R0[5] = 1'b0;
assign R0[6] = 1'b0;
assign R0[7] = 1'b0;
assign R0[8] = 1'b0;
assign R0[9] = 1'b0;
assign R0[10] = 1'b0;
assign R0[11] = 1'b0;
assign R0[12] = 1'b0;
assign R0[13] = 1'b0;
assign R0[14] = 1'b0;
assign R0[15] = 1'b0;

always @(posedge clk)
	begin
	if (Reset == 1) // Coloca 0 em todos os registradores
		begin
		R1 = R0;
		R2 = R0;
		R3 = R0;
		R4 = R0;
		R5 = R0;
		R6 = R0;
		R7 = R0;
		R8 = R0;
		R9 = R0;
		R10 = R0;
		R11 = R0;
		R12 = R0;
		R13 = R0;
		R14 = R0;
		R15 = R0;
		end
	if (Reset == 0)
		begin
		if (WE == 1) // Escreve no registrador escolhido o que tem em D
			begin
			if (Rd == 4'b0001)
				begin
				R1 = D;
				end
			if (Rd == 4'b0010)
				begin
				R2 = D;
				end
			if (Rd == 4'b0011)
				begin
				R3 = D;
				end
			if (Rd == 4'b0100)
				begin
				R4 = D;
				end
			if (Rd == 4'b0101)
				begin
				R5 = D;
				end
			if (Rd == 4'b0110)
				begin
				R6 = D;
				end
			if (Rd == 4'b0111)
				begin
				R7 = D;
				end
			if (Rd == 4'b1000)
				begin
				R8 = D;
				end
			if (Rd == 4'b1001)
				begin
				R9 = D;
				end
			if (Rd == 4'b1010)
				begin
				R10 = D;
				end
			if (Rd == 4'b1011)
				begin
				R11 = D;
				end
			if (Rd == 4'b1100)
				begin
				R12 = D;
				end
			if (Rd == 4'b1101)
				begin
				R13 = D;
				end
			if (Rd == 4'b1110)
				begin
				R14 = D;
				end
			if (Rd == 4'b1111)
				begin
				R15 = D;
				end
			end
		if (WE == 0)
			begin
			// Lê do registrador escolhido e põe em A
			if (Ra == 4'b0000)
				begin
				A = R0;
				end
			if (Ra == 4'b0001)
				begin
				A = R1;
				end
			if (Ra == 4'b0010)
				begin
				A = R2;
				end
			if (Ra == 4'b0011)
				begin
				A = R3;
				end
			if (Ra == 4'b0100)
				begin
				A = R4;
				end
			if (Ra == 4'b0101)
				begin
				A = R5;
				end
			if (Ra == 4'b0110)
				begin
				A = R6;
				end
			if (Ra == 4'b0111)
				begin
				A = R7;
				end
			if (Ra == 4'b1000)
				begin
				A = R8;
				end
			if (Ra == 4'b1001)
				begin
				A = R9;
				end
			if (Ra == 4'b1010)
				begin
				A = R10;
				end
			if (Ra == 4'b1011)
				begin
				A = R11;
				end
			if (Ra == 4'b1100)
				begin
				A = R12;
				end
			if (Ra == 4'b1101)
				begin
				A = R13;
				end
			if (Ra == 4'b1110)
				begin
				A = R14;
				end
			if (Ra == 4'b1111)
				begin
				A = R15;
				end
			// Lê do registrador escolhido e põe em B
			if (Rb == 4'b0000)
				begin
				B = R0;
				end
			if (Rb == 4'b0001)
				begin
				B = R1;
				end
			if (Rb == 4'b0010)
				begin
				B = R2;
				end
			if (Rb == 4'b0011)
				begin
				B = R3;
				end
			if (Rb == 4'b0100)
				begin
				B = R4;
				end
			if (Rb == 4'b0101)
				begin
				B = R5;
				end
			if (Rb == 4'b0110)
				begin
				B = R6;
				end
			if (Rb == 4'b0111)
				begin
				B = R7;
				end
			if (Rb == 4'b1000)
				begin
				B = R8;
				end
			if (Rb == 4'b1001)
				begin
				B = R9;
				end
			if (Rb == 4'b1010)
				begin
				B = R10;
				end
			if (Rb == 4'b1011)
				begin
				B = R11;
				end
			if (Rb == 4'b1100)
				begin
				B = R12;
				end
			if (Rb == 4'b1101)
				begin
				B = R13;
				end
			if (Rb == 4'b1110)
				begin
				B = R14;
				end
			if (Rb == 4'b1111)
				begin
				B = R15;
				end
			end
		end
	end
endmodule