vlib work
vdel -all;

vlib work
echo "COMPILING SV FILE"
vlog +acc +cover -coveropt 3 -sv 02coverage.sv
vsim work.coverages_02 -l 02coverage.log
run -all