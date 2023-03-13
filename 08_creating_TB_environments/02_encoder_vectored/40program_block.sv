`include "11test.sv"

program encoder_tb(interface_encoder.tb interr);
    test tb;
    initial begin
        tb=new(interr);
        tb.run();
    end
endprogram