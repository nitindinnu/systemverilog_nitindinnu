module defaultdatatypes(
);
    logic [2:0]a;
    bit b;

    initial begin
        $display("[Default] a=%0b,b=%0b",a,b);
        a=3'b101;
        b=1'b1;
        $display("[Updated] a=%0b,b=%0b",a,b);
    end
endmodule