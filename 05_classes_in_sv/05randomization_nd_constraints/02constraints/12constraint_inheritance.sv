class trnx01;
    rand bit [3:0]a,b;
    rand bit[3:0]c;
    //! normal inheriting constraint
    constraint inside_trnx02{a<7;b<5;}
    
    //! soft constrait
    // constraint inside_trnx01{a<5;b<3;}
    
    function void a_dispp();
        $display("parent:a=%0d\t,b=%0d",a,b);
    endfunction
endclass

class trnx02 extends trnx01;
    // rand bit [3:0]a,b; using extend class properties cant be accessed in extended class
    //! normal inheriting constraint
    constraint inside_trnx02{a>5;b>3;}
    
    //! soft constrait
    //constraint inside_trnx02{a>5;b>3;} //!contradiction with 5th line constraint inside_trnx01 using soft will make priority less
    // constraint inside_trnx02{soft a>5; soft b>3;}
    function void b_dispp();
        a_dispp();
        $display("child:a=%0d\t,b=%0d\t,c=%0d",a,b,c);
    endfunction

    //! usage of super keyword
    function void a_dispp();
        //! by default child class is preffered by compiler to set preference to parent class use super keyword
        super.a_dispp();
        $display("child:a=%0d\t,b=%0d\t,c=%0d",a,b,c);
    endfunction
endclass

module constraint_inheritance(
);
    trnx02 tv = new();
    initial begin
        repeat(10) begin
        tv.randomize();
        // tv.a_dispp();
        tv.b_dispp();
        end
    end
endmodule