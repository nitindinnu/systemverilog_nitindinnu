//!write a code by taking variable s1,s2,s3,s4,s5 of size [4:0].Use
class trnx;
    rand bit[4:0] s1,s2,s3,s4,s5;
    // constraint no_same {unique {s1,s2,s3,s4,s5};}
    constraint no_same {s1 inside{[0:16]};s2 inside{[0:16]};s3 inside{[0:16]};s4 inside{[0:16]};s5 inside{[0:16]};}
    constraint unik {unique{s1,s2,s3,s4,s5};}
    function dispp();
        $display("s1=[%0d]\t,s2=[%0d]\t,s3=[%0d]\t,s4=[%0d]\t,s5=[%0d]",s1,s2,s3,s4,s5);
    endfunction
endclass

module randomizing(
);
    trnx av = new();
    initial begin
        repeat(15) begin
        av.randomize()  ;
        av.dispp();
        end
    end
endmodule

/*
 Loading work.randomizing(fast)
# s1=[9]	,s2=[14]	,s3=[16]	,s4=[0]	,s5=[12]
# s1=[0]	,s2=[16]	,s3=[10]	,s4=[9]	,s5=[13]
# s1=[4]	,s2=[7]	,s3=[12]	,s4=[1]	,s5=[14]
# s1=[12]	,s2=[13]	,s3=[8]	,s4=[9]	,s5=[3]
# s1=[1]	,s2=[11]	,s3=[15]	,s4=[7]	,s5=[5]
# s1=[12]	,s2=[13]	,s3=[4]	,s4=[1]	,s5=[2]
# s1=[0]	,s2=[10]	,s3=[1]	,s4=[12]	,s5=[2]
# s1=[9]	,s2=[16]	,s3=[7]	,s4=[12]	,s5=[2]
# s1=[8]	,s2=[2]	,s3=[0]	,s4=[6]	,s5=[13]
# s1=[13]	,s2=[16]	,s3=[8]	,s4=[1]	,s5=[2]
# s1=[10]	,s2=[4]	,s3=[8]	,s4=[16]	,s5=[11]
# s1=[8]	,s2=[11]	,s3=[9]	,s4=[14]	,s5=[5]
# s1=[10]	,s2=[5]	,s3=[8]	,s4=[4]	,s5=[15]
# s1=[10]	,s2=[4]	,s3=[7]	,s4=[15]	,s5=[13]
# s1=[1]	,s2=[2]	,s3=[3]	,s4=[9]	,s5=[11]
*/