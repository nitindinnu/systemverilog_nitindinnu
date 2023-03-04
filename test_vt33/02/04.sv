class trnx;
    rand byte a,b;
    byte sum,sub;
    int mul;

    function  addd(byte a,b);
        dispp(a,b);
        sum=a+b;
        $display("sum value of a , b = [%0d]",sum);
    endfunction

    function  subb(byte a,b);
        dispp(a,b);
        sub=a-b;
        $display("subtracted value a, b = [%0d]",sub);
    endfunction

    function  mull(byte a,b);
        dispp(a,b);
        mul=a*b;
        $display("multipled value of a,b = [%0d]",mul);
    endfunction

    function  dispp(byte nn,zz);
        $display("a=[%0d],b=[%0d]",nn,zz);
    endfunction
endclass

module functions_sum_sub_mul(
);
    trnx cv = new();
    initial begin
        repeat(3) begin
            cv.randomize() with {cv.a>0&&a<90;cv.b>0&&b<90;};
            // cv.addd(5,10);
            // cv.subb(9,4);
            // cv.mull(5,3);
            cv.addd(cv.a,cv.b);
            cv.subb(cv.a,cv.b);
            cv.mull(cv.a,cv.b);
        end
    end
endmodule

/*
 a=[46],b=[15]
# sum value of a , b = [61]
# a=[46],b=[15]
# subtracted value a, b = [31]
# a=[46],b=[15]
# multipled value of a,b = [690]
*/