class trancc;
    randc bit[3:0]b,c;
    randc bit[5:0]a;
    constraint a_val {a==b+c;}
    constraint b_value {b>6;}
    constraint c_value {c<6;}
endclass

module constraint_bidirectional(
);
    initial begin
        trancc pl = new();
        repeat(20) begin
            pl.randomize();
            $display("value of a=%0d\t b=%0d \t c=%0d",pl.a,pl.b,pl.c);
        end
    end
endmodule