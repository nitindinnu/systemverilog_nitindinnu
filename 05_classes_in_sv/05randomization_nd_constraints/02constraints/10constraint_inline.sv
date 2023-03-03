class inlinee;
    randc bit[3:0] addr; //! randc working with inline constraint but not with constraint declared in class 
    // randc bit[3:0] addr;   
    function void dispp();
        $display("values of addr = [%0d]",addr);
    endfunction
endclass

module inlinee_const(
);
    inlinee yu = new();
    initial begin
        repeat(15)begin
            yu.randomize() with {addr>3;addr<11;};
            yu.dispp();
        end
    end
endmodule