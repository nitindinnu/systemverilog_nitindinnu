class normal_constraint;
    rand bit[3:0]a,b;
    bit[5:0] sum;

    constraint c_name {a<5;b>10;} //!constraint inside class

    function sum_add();
        sum=a+b;
        $display("a=%0d\t,b=%0d\t.sum=%0d",a,b,sum);
    endfunction

    // constraint name; //!line 12 and line15 are bind together to declare constraint outside class
endclass

// constraint normal_constraint::name{a>10;b<5;}; //!construct outside class using scope resolution



module constraintss(
);
    normal_constraint hh = new();
    initial begin
        repeat(10)begin
            hh.randomize();
            hh.sum_add();
        end
    end
endmodule