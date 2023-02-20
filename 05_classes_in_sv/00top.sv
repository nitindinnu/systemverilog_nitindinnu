`include "transaction.sv"

module top(
);
    transaction pkt;

    initial begin
        pkt = new(); //obj creation / memory allocation
        pkt.a=$random;
        pkt.b=$random;
        pkt.c=$random;
        pkt.display();
    end
endmodule