class const_inside;
    randc bit[3:0]a,b;
    // rand bit[3:0]a,b; //! check diff b/w rand and randc
    bit[5:0] sum;
    constraint nn;
    extern function void s_sum;
endclass

// constraint const_inside::nn{a inside{1,3,5,7};b inside{2,4,6,8};}; //!taken set of values
// constraint const_inside::nn{a inside{[2:4]}; b inside{[8:12]};}; //!taken range
// constraint const_inside::nn{a inside{1,3,[8:10],15}; b inside{6,7,[2:4],11,12};}; //!taken range and set of values combo
constraint const_inside::nn{!(a inside{1,3,[8:10],15}); !(b inside{[5:15]});}; //!taken inverted constraint inside

function void const_inside:: s_sum();
    sum=a+b;
    $display("a=%0d\t,b=%0d\t.sum=%0d",a,b,sum);
endfunction

module constraint_inside_operator(
);
    const_inside yes = new();
    initial begin
        repeat(20) begin
        yes.randomize();
        yes.s_sum();
        end
    end
endmodule