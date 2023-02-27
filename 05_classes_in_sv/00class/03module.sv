class transaction_04;
    int queue[$:3];
    int array[4];
    function void disp();
        $display("values of queue are [%0p]",queue);
        $display("values of queue are [%0p]",array);
    endfunction
endclass

module nitin(
);
    transaction_04 doo = new();
    initial begin
        doo.queue='{10,20,30,40};
        doo.array='{40,50,60,70};
        doo.disp();
    end
endmodule