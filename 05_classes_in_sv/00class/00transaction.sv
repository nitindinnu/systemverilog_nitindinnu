class transaction;
    bit [3:0]a ;
    bit [3:0]b ;

    function void disp();
        $display("a=%0d,b%0d",a,b);
    endfunction
endclass