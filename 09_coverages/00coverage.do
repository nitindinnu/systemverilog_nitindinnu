vlib work
vdel -all;

vlib work
echo "COMPILING SV FILE"
vlog +acc +cover -coveropt 3 -sv 00coverage.sv
vsim work.coverages_00 -l 00coverage.log
run -all