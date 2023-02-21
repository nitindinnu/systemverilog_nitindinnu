class transaction;
    bit[3:0]a,b;
    bit[3:0]f;
    bit sel;

    function void display();
        $display("a=%0d,b=%0d,sel=%0d,out=%0d",a,b,sel,f);        
    endfunction

    task run();
        a=4'b0000;
        b=4'b0000;
    endtask
endclass