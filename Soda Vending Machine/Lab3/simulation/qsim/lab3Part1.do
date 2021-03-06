onerror {quit -f}
vlib work
vlog -work work lab3StateDiagram.vo
vlog -work work lab3Part1.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.accumulator_vlg_vec_tst
vcd file -direction lab3Part1.msim.vcd
vcd add -internal accumulator_vlg_vec_tst/*
vcd add -internal accumulator_vlg_vec_tst/i1/*
add wave /*
run -all
