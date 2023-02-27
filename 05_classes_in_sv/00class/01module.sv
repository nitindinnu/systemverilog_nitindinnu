class transaction_02;
    int a,b,c;
    function disp();
        $display("a=%0d,b=%0d,c=%0d",a,b,c);
    endfunction
endclass

module nitin(
);
  transaction_02 handle = new();
  initial begin
    handle.a=25;
    handle.b=55;
    // handle.c=a+b; //gives error
    handle.c=10;
    handle.disp();
  end  
endmodule