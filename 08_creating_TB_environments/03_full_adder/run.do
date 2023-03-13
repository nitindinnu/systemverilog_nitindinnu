vlib work
vdel -all;

vlib work
vlog 30top.sv 
vsim work.top_fa -l 30top01.log
run -all