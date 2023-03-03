class trancc;
    randc bit[3:0]b,c; //!randc doesnt work with constraints
    randc bit[5:0]a;
    constraint a_val {a==b+c;}
    constraint b_value {b<2;} //! at disabling this constraint b is not limited to just 0,1,2 but all possibilities
    constraint c_value {c<6;}
endclass

module constraint_disable(
);
    initial begin
        trancc pl = new();
        repeat(10) begin
            pl.randomize();
            pl.b_value.constraint_mode(0);
            $display("value of a=%0d\t b=%0d \t c=%0d",pl.a,pl.b,pl.c);
        end
        repeat(10) begin
            pl.randomize();
            pl.b_value.constraint_mode(0);
            $display("value of a=%0d\t b=%0d \t c=%0d",pl.a,pl.b,pl.c);
        end
    end
endmodule