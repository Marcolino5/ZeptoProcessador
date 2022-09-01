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
assign Op[0] = (Inst % 2'b10);
assign Op[1] = ((Inst % 3'b100) >> 1);
assign Op[2] = ((Inst % 4'b1000) >> 2);
assign Opcode[0] = Op[0];
assign Opcode[1] = Op[1];
assign Opcode[2] = Op[2];
assign Opcode[3] = ((Inst % 5'b10000) >> 3);
assign Rd[0] = ((Inst % 6'b100000) >> 4);
assign Rd[1] = ((Inst % 7'b1000000) >> 5);
assign Rd[2] = ((Inst % 8'b10000000) >> 6);
assign Rd[3] = ((Inst % 9'b100000000) >> 7);
assign Ra[0] = ((Inst % 10'b1000000000) >> 8);
assign Ra[1] = ((Inst % 11'b10000000000) >> 9);
assign Ra[2] = ((Inst % 12'b100000000000) >> 10);
assign Ra[3] = ((Inst % 13'b1000000000000) >> 11);
assign Rb[0] = ((Inst % 14'b10000000000000) >> 12);
assign Rb[1] = ((Inst % 15'b100000000000000) >> 13);
assign Rb[2] = ((Inst % 16'b1000000000000000) >> 14);
assign Rb[3] = ((Inst % 17'b10000000000000000) >> 15);
assign Imm[0] = ((Inst % 18'b100000000000000000) >> 16);
assign Imm[1] = ((Inst % 19'b1000000000000000000) >> 17);
assign Imm[2] = ((Inst % 20'b10000000000000000000) >> 18); 
assign Imm[3] = ((Inst % 21'b100000000000000000000) >> 19); 
assign Imm[4] = ((Inst % 22'b1000000000000000000000) >> 20);
assign Imm[5] = ((Inst % 23'b10000000000000000000000) >> 21);
assign Imm[6] = ((Inst % 24'b100000000000000000000000) >> 22);
assign Imm[7] = ((Inst % 25'b1000000000000000000000000) >> 23);
assign Imm[8] = ((Inst % 26'b10000000000000000000000000) >> 24);
assign Imm[9] = ((Inst % 27'b100000000000000000000000000) >> 25);
assign Imm[10] = ((Inst % 28'b1000000000000000000000000000) >> 26);
assign Imm[11] = ((Inst % 29'b10000000000000000000000000000) >> 27);
assign Imm[12] = ((Inst % 30'b100000000000000000000000000000) >> 28);
assign Imm[13] = ((Inst % 31'b1000000000000000000000000000000) >> 29);
assign Imm[14] = ((Inst % 32'b10000000000000000000000000000000) >> 30);
assign Imm[15] = ((Inst % 33'b100000000000000000000000000000000) >> 31);
assign Jump = (Opcode == 4'b0101|Opcode == 4'b0110|Opcode == 4'b0111|Opcode == 4'b1001|Opcode == 4'b1011|Opcode == 4'b1100) ? 1'b1 : 1'b0;
assign CJump = (Opcode == 4'b0101|Opcode == 4'b0110|Opcode == 4'b0111|Opcode == 4'b1001) ? 1'b1 : 1'b0;
assign WE = (Opcode == 4'b0000|Opcode == 4'b0001|Opcode == 4'b0010|Opcode == 4'b0011|Opcode == 4'b0100|Opcode == 4'b1011|Opcode == 4'b1100) ? 1'b1 : 1'b0;
assign beq = Opcode == 4'b0101 ? 1'b1 : 1'b0;
assign bne = Opcode == 4'b0110 ? 1'b1 : 1'b0;
assign bge = Opcode == 4'b0111 ? 1'b1 : 1'b0;
assign blt = Opcode == 4'b1001 ? 1'b1 : 1'b0;
assign jalr = Opcode == 4'b1100 ? 1'b1 : 1'b0;

endmodule