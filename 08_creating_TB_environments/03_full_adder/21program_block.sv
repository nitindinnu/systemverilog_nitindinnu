`include "11test.sv"

program fa_pb_block(fa_interface.tb inter);
    test tb;
    initial begin
        tb=new(inter);
        tb.run();
    end
endprogram