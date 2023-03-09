class transaction_mux;
    randc bit[3:0] i0,i1;
    randc bit sel;
    bit [3:0]out;
    function  display();
        $display("\n >>>>>>>>>>>>>>TRANSACTION class");
        $display("\n randomized input values of 2x1MUX are i[0]=[%0d],i[1]=,i[1]=[%0d],sel=[%0d]",i0,i1,sel);
        $display("[transaction]:default output value of 2x1mux is out=[%0d]",out);
        $display("------------------------------------------------------------");
    endfunction
endclass