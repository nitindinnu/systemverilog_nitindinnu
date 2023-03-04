class tranx;
    rand bit a;
    rand bit[1:0]b;
    constraint vh {a -> b ==3'h3; solve a before b;}
endclass

module solve_befor(
    //! sv allows a mechanism to order variables so that a can be chosen independently of b.
    //!this is done using "solve keyword"
);
    tranx tee = new();
    initial begin
        for (int i =0 ;i<8 ;i++ ) begin
            tee.randomize();
            $display("[%0d],a=%0d,b=%0d",i,tee.a,tee.b);
        end
    end
endmodule















