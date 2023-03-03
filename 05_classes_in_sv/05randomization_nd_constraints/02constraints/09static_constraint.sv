class sttic_constraint;
    rand bit[3:0] addr;
    static constraint addr_range{addr==5;}
endclass

module static_constraints(
);
    initial begin
        sttic_constraint tt1= new();
        sttic_constraint tt2= new();
        // before_disabling();
        $display("before disabling constraint");
        tt1.randomize();
        $display("\tpkt1.addr =%0d",tt1.addr);
        tt2.randomize();
        $display("\tpkt2.addr =%0d",tt2.addr);

        // tt1.addr.rand_mode(0); //! try disabling randomize for tt1
        // tt2.addr.rand_mode(0); //! try disabling randomize for tt2
        tt2.addr_range.constraint_mode(0);
        // after_disabling();
        $display("after disabling constraint");
        tt1.randomize();
        $display("\tpkt1.addr =%0d",tt1.addr);
        tt2.randomize();
        $display("\tpkt2.addr =%0d",tt2.addr);
    end

    // function void before_disabling();
        
    // endfunction

    // function void after_disabling();
        
    // endfunction
endmodule