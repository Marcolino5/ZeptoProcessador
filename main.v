module main(
	input [3:0] KEY, // KEY[0] = Reset, KEY[3] = Clock manual
	input [3:0] SW, // SW[0] = Muda clock, SW[1] e SW[2] = Seleciona valor do display, SW[3] = Muda clock automático
	input CLOCK_50,
	output wire [6:0] HEX0,
	output wire [6:0] HEX1,
	output wire [6:0] HEX2,
	output wire [6:0] HEX3,
	output wire [6:0] HEX4,
	output wire [6:0] HEX5,
	output wire [6:0] HEX6,
	output wire [6:0] HEX7,
	output wire [1:0] LEDR,
	output [15:0] VerRA
);
wire clk;
wire div;
// Clock automático / manual
fdiv U0(.clkin(CLOCK_50),.clkout(div));
always @(*)
begin
	if (SW[0] == 1'b0)
		begin
			if (SW[3] == 1'b0)
				begin
				clk = CLOCK_50;
				end
			if (SW[3] == 1'b1)
				begin
				clk = div;
				end
		end
	if (SW[0] == 1'b1)
		begin
		clk = KEY[3];
		end
end

assign LEDR[0] = clk;
// PC e ROM
wire [15:0] E; // Entrada de PC
wire [15:0] Adds; // Endereço
wire [31:0] Inst; // Instrução
wire Reset;
assign Reset = ~KEY[0];
pc U1(.E(E),.clk(clk),.Saida(Adds),.Reset(Reset)); // Pega saida de PC (endereço), coloca Reset de PC em KEY[0], coloca clock
rom U2(.Adds(Adds),.Inst(Inst)); // Pega instruçao da ROM a partir de endereço

// Controle
wire [2:0] Op;
wire [3:0] Ra;
wire [3:0] Rb;
wire [3:0] Rd;
wire [15:0] Imm;
wire WE;
wire Jump;
wire CJump;
wire beq;
wire bne;
wire bge;
wire blt;
wire jalr;
controle U3(.Inst(Inst),.Op(Op),.Ra(Ra),.Rb(Rb),.Rd(Rd),.Imm(Imm),.WE(WE),.Jump(Jump),.CJump(CJump),.beq(beq),.bne(bne),.bge(bge),.blt(blt),.jalr(jalr));

// Registradores
wire [15:0] D;
wire [15:0] A;
wire [15:0] B;
registrador U5(.D(D),.Ra(Ra),.Rb(Rb),.Rd(Rd),.WE(WE),.Reset(Reset),.clk(clk),.A(A),.B(B));
assign VerRA = A;

// ULA e comparador
wire [15:0] P;
wire [15:0] S;
wire [3:0] SComp;
comparador U6(.A(A),.B(B),.S(SComp));
ula U7(.Op(Op),.A(A),.B(B),.S(S)); // Realiza operaçao com Ra e Rb
ula U8(.Op(Op),.A(S),.B(Imm),.S(P)); // Realiza operaçao com resultado e imediato

wire [15:0] Sadd; // Soma ao endereço de PC
always @(*)
begin
	if (Jump == 1'b0)
		begin
		D = P;
		Sadd = 16'b0000000000000001;
		end
	else
		begin
		if (CJump == 1'b1)
			begin
			if (beq == 1'b1)
				begin
				Sadd = SComp[3] ? Imm : 16'b0000000000000001;
				end
			if (bne == 1'b1)
				begin
				Sadd = SComp[2] ? Imm : 16'b0000000000000001;
				end
			if (bge == 1'b1)
				begin
				Sadd = SComp[1] ? Imm : 16'b0000000000000001;
				end
			if (blt == 1'b1)
				begin
				Sadd = SComp[0] ? Imm : 16'b0000000000000001;
				end
			end
		else
			begin
			if (jalr == 1'b1)
				begin
				D = Adds + 1;
				Sadd = A - Adds + Imm;
				end
			else
				begin
				D = Adds + 1;
				Sadd = Imm;
				end
			end
		end
end

ula U9(.Op(3'b000),.A(Adds),.B(Sadd),.S(E)); // Coloca novo endereço de PC
// SW[2],SW[1]: 00 = PC, 01 = Instruçao, 11 = Ra, 10 = Rb
	wire [6:0] PC0;
	wire [6:0] PC1;
	wire [6:0] PC2;
	wire [6:0] PC3;
	decoder7 D0(.In(Adds[3:0]),.Out(PC0));
	decoder7 D1(.In(Adds[7:4]),.Out(PC1));
	decoder7 D2(.In(Adds[11:8]),.Out(PC2));
	decoder7 D3(.In(Adds[15:12]),.Out(PC3));
	
	wire [6:0] IN0;
	wire [6:0] IN1;
	wire [6:0] IN2;
	wire [6:0] IN3;
	wire [6:0] IN4;
	wire [6:0] IN5;
	wire [6:0] IN6;
	wire [6:0] IN7;
	decoder7 D5(.In(Inst[3:0]),.Out(IN0));
	decoder7 D6(.In(Inst[7:4]),.Out(IN1));
	decoder7 D7(.In(Inst[11:8]),.Out(IN2));
	decoder7 D8(.In(Inst[15:12]),.Out(IN3));
	decoder7 D9(.In(Inst[19:16]),.Out(IN4));
	decoder7 D10(.In(Inst[23:20]),.Out(IN5));
	decoder7 D11(.In(Inst[27:24]),.Out(IN6));
	decoder7 D12(.In(Inst[31:28]),.Out(IN7));
	
	wire [6:0] RA0;
	wire [6:0] RA1;
	wire [6:0] RA2;
	wire [6:0] RA3;
	decoder7 D13(.In(A[3:0]),.Out(RA0));
	decoder7 D14(.In(A[7:4]),.Out(RA1));
	decoder7 D15(.In(A[11:8]),.Out(RA2));
	decoder7 D16(.In(A[15:12]),.Out(RA3));
	
	wire [6:0] RB0;
	wire [6:0] RB1;
	wire [6:0] RB2;
	wire [6:0] RB3;
	decoder7 D17(.In(B[3:0]),.Out(RB0));
	decoder7 D18(.In(B[7:4]),.Out(RB1));
	decoder7 D19(.In(B[11:8]),.Out(RB2));
	decoder7 D20(.In(B[15:12]),.Out(RB3));
	
	always @(*)
		begin
		if ((SW[1] == 0) & (SW[2] == 0)) 
			begin
			HEX0 = PC0;
			HEX1 = PC1;
			HEX2 = PC2;
			HEX3 = PC3;
			HEX4 = 7'b0000000;
			HEX5 = 7'b0000000;
			HEX6 = 7'b0000000;
			HEX7 = 7'b0000000;
			end
		if ((SW[1] == 1) & (SW[2] == 0))
			begin
			HEX0 = IN0;
			HEX1 = IN1;
			HEX2 = IN2;
			HEX3 = IN3;
			HEX4 = IN4;
			HEX5 = IN5;
			HEX6 = IN6;
			HEX7 = IN7;
			end
		if ((SW[1] == 1) & (SW[2] == 1))
			begin
			HEX0 = RA0;
			HEX1 = RA1;
			HEX2 = RA2;
			HEX3 = RA3;
			HEX4 = 7'b0000000;
			HEX5 = 7'b0000000;
			HEX6 = 7'b0000000;
			HEX7 = 7'b0000000;
			end
		if ((SW[1] == 0) & (SW[2] == 1))
			begin
			HEX0 = RB0;
			HEX1 = RB1;
			HEX2 = RB2;
			HEX3 = RB3;
			HEX4 = 7'b0000000;
			HEX5 = 7'b0000000;
			HEX6 = 7'b0000000;
			HEX7 = 7'b0000000;
			end
	end
endmodule