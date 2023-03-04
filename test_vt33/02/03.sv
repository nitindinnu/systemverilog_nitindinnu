//! enabling_disabling_constraint
class ab;
    randc byte unsigned a,b;
    constraint k_name1 {a inside{2,4};b inside {1,3};}
    function dispp01();
        $display("a=[%0d],b=[%0d]",a,b);
    endfunction
endclass

class bc extends ab;
    randc byte unsigned c,d;
    // constraint k_name {a inside{1,3,5,7};b inside {2,4,6,8};} 
    // constraint k_name2 {soft a inside{1,3,5,7};soft b inside {2,4,6,8};} 
    function dispp02();
        $display("--------------------class bc");
        dispp01();
        $display("b=[%0d],c=[%0d]",c,d);
        $display("--------------------class bc");
    endfunction
endclass

module enabling_disabling_constraint(
);
    bc ok =new();
    initial begin
        $display("========== enabling constraint:its by default in sv");
        repeat(5) begin
            //!ENABLING CONSTRAINT
            ok.randomize();
            ok.dispp01();
        end
        $display("========== disabling constraint");
        repeat(5)begin
            //!disabling constraint
            ok.randomize();
            ok.constraint_mode(0);
            ok.dispp01();
        end
    end
endmodule

/*
# ========== enabling constraint:its by default in sv
# a=[4],b=[1]
# a=[2],b=[3]
# a=[2],b=[1]
# a=[4],b=[3]
# a=[4],b=[3]
# ========== disabling constraint
# a=[2],b=[1]
# a=[167],b=[158]
# a=[94],b=[85]
# a=[8],b=[50]
# a=[250],b=[155]
*/