onerror {quit -f}
vlib work
vlog -work work ProjetoFinal.vo
vlog -work work ProjetoFinal.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.teste_vlg_vec_tst
vcd file -direction ProjetoFinal.msim.vcd
vcd add -internal teste_vlg_vec_tst/*
vcd add -internal teste_vlg_vec_tst/i1/*
add wave /*
run -all
