vlib work
vdel -all;

vlib work
vlog shallow_deep.sv 
vsim work.top -l shallow_deep.log
run -all