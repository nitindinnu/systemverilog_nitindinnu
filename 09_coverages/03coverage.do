vlib work
vdel -all;

vlib work
echo "COMPILING SV FILE"
vlog +acc +cover -coveropt 3 -sv 03_coverage_transition_IGNORE_ILLEGAL_cross.sv
vsim work.coverages_03 -l 03_coverage_transition_IGNORE_ILLEGAL.log
run -all