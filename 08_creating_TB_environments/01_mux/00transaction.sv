class transaction_mux;
    randc bit[3:0] i[0:1];
    randc bit sel;
    bit [3:0]out;
    function  display();
        $display("\n >>>>>>>>>>>>>>TRANSACTION class");
        $display("\n randomized ouy[%0d]",i[0],i[1]);
    endfunction
endclass