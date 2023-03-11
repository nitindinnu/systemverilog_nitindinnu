vlib work
vdel -all;

vlib work
vlog shallow_deep02.sv 
vsim work.top -l shallow_deep02_01.log
run -all