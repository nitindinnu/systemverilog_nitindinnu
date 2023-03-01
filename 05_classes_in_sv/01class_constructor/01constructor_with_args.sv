class tranx;
    bit[3:0] addr,mem;
    function new(bit[3:0] a,b);
        // a=addr;
        // b=mem; //! doesnt work in this way ,LHS must be class variables
        addr=a;
        mem=b;
    endfunction
endclass

module constructor_with_args(
);
    tranx hpp = new(5,10);
    tranx hpq = new(6,3);
    initial begin
        $display("addr - %0d,mem =%0d",hpp.addr,hpp.mem);
        $display("addr - %0d,mem =%0d",hpq.addr,hpq.mem);
    end
    // # addr - 5,mem =10
    // # addr - 6,mem =3
endmodule