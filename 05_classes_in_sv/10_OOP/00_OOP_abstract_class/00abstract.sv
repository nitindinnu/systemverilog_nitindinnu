/*
In SystemVerilog, a class is declared as abstract with the keyword virtual.
An abstract class can never be directly instantiated and can only be inherited.
Abstract classes are those which can be used for creation of handles,
but their methods and constructors can be used by the child or extended class.
*/

// virtual class trnx;
//     bit[3:0]a;
// endclass

// module virtual_classs(
// );
//     trnx io = new();  //! Fatal: (vsim-8250) can't create handle for abstract class
//     //! 00abstract.sv (14): Class allocator method 'new' called on abstract class 'trnx'.
// endmodule

virtual class trnx;
    bit[3:0]a;
endclass

class trnx02 extends trnx;
    function disp();
        $display("value of a in abstract super class,accessing from sub-class is %0d",a);
    endfunction
endclass

module virtual_classs(
);
    trnx02 io2 = new();
    initial begin
        io2.disp();
        io2.a=15;
        io2.disp(); //! accessing abstract class properties from inherited class
    end
endmodule