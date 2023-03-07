/*
Encapsulation in Systemverilog (SV) is the technique of hiding data within the class and making
it available only through the methods.
It is an act of enclosing class members (properties/methods) from being accessed outside of SV,
and by default members are public,
so it can be accessible outside of SV directly using class handle and dot operator.1
*/
class tranx;
    local bit[3:0]a;

    function  new(bit[3:0]b);
        a= b+15;
    endfunction

    function dispay();
        $display("a = %0d",a);
    endfunction
endclass

module encapsulate_local(
);
    initial begin
        tranx lo = new(5);
        // lo.a=20  //!Accessing local variable outside the class not allowed 
        lo.dispay();  //!Accessing local variable inside the class is allowed 
    end
endmodule