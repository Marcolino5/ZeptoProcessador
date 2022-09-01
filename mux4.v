module mux4(
input [3:0] Dado,
input [1:0] Escolha,
output Saida
);
assign Saida = Dado[Escolha];
endmodule
