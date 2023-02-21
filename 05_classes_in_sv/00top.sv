`include "transaction.sv"

module top;
    transaction pkt;

    initial begin
        pkt = new(); //obj creation / memory allocation
        repeat(5) begin
            pkt.a=$random;
            pkt.b=$random;
            pkt.sel=$random;
            pkt.display();
        end
    end
endmodule