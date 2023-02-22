module functions01();
/* 
    ? the primary purpose of a function is to return a value that can be used in the expression 
    ? and cannot consume simulation time
    !>>>> a function cannot have time controlled stmnts like @,#,fork join,wait
    !>>>  a function cannot start a task since tasks are allowed to consume simulation time
*/ 
    initial begin //!normal function 
        int x,y;
        x= sum(7,7);
        $display("x is %0d",x);
        $display("sum function of 5+5 is %0d",sum(5,5));
        $display("mul is %0d",mul(3,6,y));
        $display("res = %0d",y);
    end
    /*
    function return_value name(port_list);
        // syntax
    endfunction
    */

    function bit[7:0] sum;
        input int m,n;
        // reg sum;
            sum=m+n;
    endfunction

    function byte mul(input int m,n,output int res);
        res=n*m+1;
        return m*n;
    endfunction
/*
# Loading work.functions01(fast)
# x is 14
# sum function of 5+5 is 10
# mul is 18
# res = 19
*/
    
endmodule

//  Module: 01functions
//
module functions02(); //! pass args by value
    /*  package imports  */
    // #(
    //     <parameter_list>
    // )(
    //     <port_list>
    // );
    initial begin
    int a,res;
    // a=$urandom_range(10,0);
    a=5;
    $display("before calling a function a=%0d,res=%0d",a,res);
    res =fn(a);
    $display("after calling a function a=%0d,res=%0d",a,res);
    end

    function int fn(int a);
        a=a+7;
        return a*10;
    endfunction
/*
# before calling a function a=7,res=0
# after calling a function a=7,res=140
*/
    
endmodule: functions02

//  Module: functions03
//
module functions03(); //! pass args by reference
    initial begin
        int a,res;
        // a=$urandom_range(10,0);
        a=5;
        $display("before calling a function a=%0d,res=%0d",a,res);
        res =fn(a);
        $display("after calling a function a=%0d,res=%0d",a,res);
        end
    
        function automatic int fn(ref int a);
            a=a+7;
            return a*10;
        endfunction
    //! it is illegal to use argument passing by reference for subroutines with a lifetime of static
/*
before calling a function a=5,res=0
after calling a function a=12,res=120
*/
endmodule: functions03

