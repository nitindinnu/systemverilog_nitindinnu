`include "40program_block.sv"
`include "20interface.sv"
`include "30dut_encoder.sv"

module top_en(
);
    interface_encoder interr();
    encoder_tb tb(interr);
    encoder_dut du(interr);
endmodule