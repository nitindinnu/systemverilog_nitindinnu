class transaction;
    input bit[3:0]a,b;
    output bit[3:0]f;
    input bit sel;

    function void display();
        $display("a=%0b,b=%0b,sel=%0b,out=%0d",a,b,sel,f);        
    endfunction

    task run();
        a=4'b0000;
        b=4'b0000;
    endtask
endclass