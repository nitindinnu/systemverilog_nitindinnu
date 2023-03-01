class methods_constraints_outside_class; //! using scope resolution(::) for methods to declare outside class
    rand bit[3:0]a,b;
    bit[5:0] sum;
    constraint limiter; //!line 4 and line9 are bind together to declare class constraint outside class
    extern function void sum_adder(); //!line 5 and line11 are bind together to declare class method outside class using "extern" keyword
endclass

//!declaring constraint and method outside class
constraint methods_constraints_outside_class::limiter{a>8;b<8;}; //!constraint 
//!line 4 and line9 are bind together to declare class constraint outside class
function void methods_constraints_outside_class::sum_adder; //!method
    sum=a+b;
    $display("a=%0d\t,b=%0d\t.sum=%0d",a,b,sum);
endfunction     //!line 5 and line11 are bind together to declare class method outside class


module constraint_out(
);
    methods_constraints_outside_class hh = new();
    initial begin
        repeat(10) begin
            hh.randomize();
            hh.sum_adder();
        end
    end
endmodule