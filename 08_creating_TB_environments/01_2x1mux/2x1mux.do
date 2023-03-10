vlib work
vdel -all;

vlib work
vlog 41top_module.sv 
vsim work.top -l 41top_module_ternary_dut.log
run -all