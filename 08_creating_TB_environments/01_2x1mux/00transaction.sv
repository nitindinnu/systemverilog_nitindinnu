class transaction;
    randc bit [3:0]i0,i1;
    randc bit sel ;
    bit [3:0]out;
    function void display();
        $display("\n >>>TRANSACTION CLASS<<<");
        $display("\n[transaction]: randomized input values of 2x1mux are i0=[%0d], i1=[%0d], sel=[%0d]",i0,i1,sel);
        $display("[transaction]:default output value of 2x1mux is out=[%0d]",out);
        $display("------------------------------------------------------------");
    endfunction
endclass