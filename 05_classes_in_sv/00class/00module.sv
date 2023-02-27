`include "transaction.sv"
module nitin(
);
    transaction pkt= new();
    initial begin
        pkt.a=4'd8;
        pkt.b=4'd7;
        pkt.disp();
    end
endmodule