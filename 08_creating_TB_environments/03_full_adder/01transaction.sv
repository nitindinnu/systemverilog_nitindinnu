class transaction_fa;
    rand bit[3:0] a,b;
    bit cin=0;
    bit [4:0] sum,carry;

    function void fa_display();
        $display("\n >>>TRANSACTION CLASS<<<");
        $display("random inputs are a,b,c=[%0d, %0d, %0d]",a,b,cin);
        $display("default outputs at transaction are [%0d %0d]",sum,carry);
    endfunction
endclass