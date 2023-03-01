class tranx;
    byte addr;
    byte data;
endclass

module class_constructor(
);
    tranx hi = new();
    initial begin
        $display(hi.addr,hi.data);    
    end
endmodule