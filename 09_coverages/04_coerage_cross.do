vlib work
vdel -all;

vlib work
echo "COMPILING SV FILE"
vlog +acc +cover -coveropt 3 -sv 04coverage_cross.sv
vsim work.coverages_04 -l 04coverage_cross.log
run -all