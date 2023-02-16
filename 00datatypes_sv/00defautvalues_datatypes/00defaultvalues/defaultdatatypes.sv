module defaultdatatypes(
);
    logic [2:0]a;
    bit b;
    byte c;
    shortint d;
    int e;
    longint f;
    shortreal g;
    

    initial begin
        $display("[Default] a=%0b,b=%0b,c=%0b,d=%0b,e=%0b,f=%0b,g=%0b,",a,b,c,d,e,f,g);
        a=3'b101;
        b=1'b1;
        c=1'b1;
        d=1'b1;
        e=1'b1;
        f=1'b1;
        g=1'b1;
        $display("[Updated] a=%0b,b=%0b,c=%0b,d=%0b,e=%0b,f=%0b,g=%0b,",a,b,c,d,e,f,g);
        // $display("[Updated] a=%0b,b=%0b",a,b);
    end
endmodule

