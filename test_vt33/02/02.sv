//! show importance of soft keyword
class ab;
    randc byte a,b;
    constraint k_name1 {a inside{2,4,6,8};b inside {1,3,5,7};}
    function dispp01();
        $display("a=[%0d],b=[%0d]",a,b);
    endfunction
endclass

class bc extends ab;
    randc byte unsigned c,d;
    // constraint k_name {a inside{1,3,5,7};b inside {2,4,6,8};} 
    constraint k_name2 { a inside{1,3,5,7}; b inside {2,4,6,8};} 
    function dispp02();
        $display("--------------------class bc");
        dispp01();
        $display("b=[%0d],c=[%0d]",c,d);
        $display("--------------------class bc");
    endfunction
endclass

module softt_importance(
);
    bc ok =new();
    initial begin
        repeat(10) begin
            ok.randomize();
            ok.dispp02();
        end
    end
endmodule

/*
! line 12 constraint is picked by default by the compiler
# --------------------class bc
# a=[5],b=[6]
# b=[225],c=[245]
# --------------------class bc
# --------------------class bc
# a=[3],b=[4]
# b=[255],c=[227]
# --------------------class bc
# --------------------class bc
# a=[7],b=[2]
# b=[245],c=[153]
# --------------------class bc
# --------------------class bc
# a=[1],b=[8]
# b=[195],c=[183]
# --------------------class bc
# --------------------class bc
# a=[7],b=[4]
# b=[217],c=[173]
# --------------------class bc
# --------------------class bc
# a=[1],b=[6]
# b=[215],c=[86]
# --------------------class bc
# --------------------class bc
# a=[5],b=[8]
# b=[45],c=[76]
# --------------------class bc
# --------------------class bc
# a=[3],b=[2]
# b=[59],c=[122]
# --------------------class bc
# --------------------class bc
# a=[5],b=[4]
# b=[49],c=[16]
# --------------------class bc
# --------------------class bc
# a=[3],b=[2]
# b=[15],c=[14]
# --------------------class bc
! giving soft for constraint at line 13
# --------------------class bc
# a=[4],b=[3]
# b=[225],c=[245]
# --------------------class bc
# --------------------class bc
# a=[6],b=[5]
# b=[255],c=[227]
# --------------------class bc
# --------------------class bc
# a=[8],b=[1]
# b=[245],c=[153]
# --------------------class bc
# --------------------class bc
# a=[2],b=[7]
# b=[195],c=[183]
# --------------------class bc
# --------------------class bc
# a=[8],b=[5]
# b=[217],c=[173]
# --------------------class bc
# --------------------class bc
# a=[2],b=[3]
# b=[215],c=[86]
# --------------------class bc
# --------------------class bc
# a=[4],b=[7]
# b=[45],c=[76]
# --------------------class bc
# --------------------class bc
# a=[6],b=[1]
# b=[59],c=[122]
# --------------------class bc
# --------------------class bc
# a=[4],b=[5]
# b=[49],c=[16]
# --------------------class bc
# --------------------class bc
# a=[6],b=[1]
# b=[15],c=[14]
# --------------------class bc
*/

