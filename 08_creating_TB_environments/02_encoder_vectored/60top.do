vlib work
vdel -all;

vlib work
vlog 50top.sv 
vsim work.top_en -l 60encode3rdrun.log
run -all