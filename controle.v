module controle(
	input [31:0] Inst,
	output wire [2:0] Op,
	output wire [3:0] Ra,
	output wire [3:0] Rb,
	output wire [3:0] Rd,
	output wire [15:0] Imm,
	output wire WE,
	output wire Jump,
	output wire CJump,
	output wire beq,
	output wire bne,
	output wire bge,
	output wire blt,
	output wire jalr
);
wire [3:0] Opcode;
assign Opcode = Inst % 5'b10000;
assign Op = Opcode[2:0];
assign Rd = ((Inst % 9'b100000000) >> 4);
assign Ra = ((Inst % 13'b1000000000000) >> 8);
assign Rb = ((Inst % 17'b10000000000000000) >> 12);
assign Imm = ((Inst % 33'b100000000000000000000000000000000) >> 16);
assign Jump = (Opcode == 4'b0101|Opcode == 4'b0110|Opcode == 4'b0111|Opcode == 4'b1001|Opcode == 4'b1011|Opcode == 4'b1100) ? 1'b1 : 1'b0;
assign CJump = (Opcode == 4'b0101|Opcode == 4'b0110|Opcode == 4'b0111|Opcode == 4'b1001) ? 1'b1 : 1'b0;
assign WE = (Opcode == 4'b0000|Opcode == 4'b0001|Opcode == 4'b0010|Opcode == 4'b0011|Opcode == 4'b0100|Opcode == 4'b1011|Opcode == 4'b1100) ? 1'b1 : 1'b0;
assign beq = Opcode == 4'b0101 ? 1'b1 : 1'b0;
assign bne = Opcode == 4'b0110 ? 1'b1 : 1'b0;
assign bge = Opcode == 4'b0111 ? 1'b1 : 1'b0;
assign blt = Opcode == 4'b1001 ? 1'b1 : 1'b0;
assign jalr = Opcode == 4'b1100 ? 1'b1 : 1'b0;

endmodule