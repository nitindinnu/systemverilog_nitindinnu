vlib work
vdel -all;

vlib work
echo "COMPILING SV FILE"
vlog +acc +cover -coveropt 3 -sv 05_coverage_implicit_explicit.sv
vsim work.fifo_coverage -l 05_coverage_implicit_explicit.log
run -all