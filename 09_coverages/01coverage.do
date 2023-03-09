vlib work
vdel -all;

vlib work
echo "COMPILING SV FILE"
vlog +acc +cover -coveropt 3 -sv 01coverage.sv
vsim work.coverages_01 -l 01coverage.log
run -all