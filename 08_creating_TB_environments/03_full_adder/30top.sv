`include "21program_block.sv"
`include "22interface.sv"
`include "20dut_fa.sv"
module top_fa(
);
fa_interface inter();
fa_pb_block tb(inter);
fa_dut dut(inter);
endmodule