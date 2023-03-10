`include "20interface.sv" //interface block
`include "30mux2x1_dut.sv" //dut block
`include "40program_block.sv" //program block

module top;
    
    mux_2x1_intf inter();
    mux_tb tb(inter);//program block
    mux2x1_dut dut(inter);//dut block

endmodule