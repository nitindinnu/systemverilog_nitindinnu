`include "11test.sv"

program mux_tb(mux_2x1_intf.tb inter);
    test tb;
    initial begin
        tb=new(inter);
        tb.run();
    end
endprogram